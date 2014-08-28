//
//  AIMotionManager.m
//  CoreMotion
//
//  Created by Александр Игнатьев on 24.05.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//

#import "AIMotionManager.h"


typedef void(^AccelerationBlock)(CMAcceleration acceleration, double maxX, double maxY, double maxZ);
typedef void(^RotationBlock)(CMRotationRate rotation, double maxX, double maxY, double maxZ);
typedef void(^GravityBlock)(CMAcceleration gravity, double maxX, double maxY, double maxZ);
typedef void(^AttitudeBlock)(CMAttitude *attitude, double roll, double pitch, double yaw);


@interface AIMotionManager ()

@property (strong, nonatomic) CMMotionManager *motionManager;
@property (copy, nonatomic) AccelerationBlock accelerationBlock;
@property (copy, nonatomic) RotationBlock rotationBlock;
@property (copy, nonatomic) GravityBlock gravityBlock;
@property (copy, nonatomic) AttitudeBlock attitudeBlock;

@end


@implementation AIMotionManager

+ (AIMotionManager *)sharedManager
{
    static AIMotionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AIMotionManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self clearMax];
        [self startMonotoring];
    }
    return self;
}


#pragma mark - Getters

- (CMMotionManager *)motionManager
{
    if (_motionManager) {
        return _motionManager;
    }
    _motionManager = [[CMMotionManager alloc] init];
    _motionManager.accelerometerUpdateInterval = 0.2f;
    _motionManager.gyroUpdateInterval = 0.2f;
    return _motionManager;
}


#pragma mark -

- (void)startMonotoring
{
    if (self.motionManager.isDeviceMotionAvailable) {
        self.motionManager.deviceMotionUpdateInterval = 1.0f;
        [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            } else {
                [self outputAccelertionData:motion.userAcceleration];
                [self outputRotationData:motion.rotationRate];
                [self outputGravityData:motion.gravity];
                [self outputAttitudeData:motion.attitude];
            }
        }];
    }
}

- (void)acceleration:(void(^)(CMAcceleration acceleration, double maxX, double maxY, double maxZ))whitHandler
{
    self.accelerationBlock = whitHandler;
}

- (void)rotation:(void(^)(CMRotationRate rotation, double maxX, double maxY, double maxZ))whitHandler
{
    self.rotationBlock = whitHandler;
}

- (void)gravity:(void(^)(CMAcceleration gravity, double maxX, double maxY, double maxZ))whitHandler
{
    self.gravityBlock = whitHandler;
}

- (void)attitude:(void(^)(CMAttitude *attitude, double roll, double pitch, double yaw))whitHandler
{
    self.attitudeBlock = whitHandler;
}


#pragma mark - My Methods CMDeviceMotion

- (void)outputAccelertionData:(CMAcceleration)acceleration
{
    if(fabs(acceleration.x) > fabs(self.maxAccelX)) {
        _maxAccelX = acceleration.x;
    }
    if(fabs(acceleration.y) > fabs(self.maxAccelY)) {
        _maxAccelY = acceleration.y;
    }
    if(fabs(acceleration.z) > fabs(self.maxAccelZ)) {
        _maxAccelZ = acceleration.z;
    }
    if (self.accelerationBlock) {
        self.accelerationBlock(acceleration, self.maxAccelX, self.maxAccelY, self.maxAccelZ);
    }
}

- (void)outputRotationData:(CMRotationRate)rotation
{
    if(fabs(rotation.x) > fabs(self.maxRotationX)) {
        _maxRotationX = rotation.x;
    }
    if(fabs(rotation.y) > fabs(self.maxRotationY)) {
        _maxRotationY = rotation.y;
    }
    if(fabs(rotation.z) > fabs(self.maxRotationZ)) {
        _maxRotationZ = rotation.z;
    }
    if (self.rotationBlock) {
        self.rotationBlock(rotation, self.maxRotationX, self.maxRotationY, self.maxRotationZ);
    }
}

- (void)outputGravityData:(CMAcceleration)gravity
{
    if(fabs(gravity.x) > fabs(self.maxRotationX)) {
        _maxGravityX = gravity.x;
    }
    if(fabs(gravity.y) > fabs(self.maxRotationY)) {
        _maxGravityY = gravity.y;
    }
    if(fabs(gravity.z) > fabs(self.maxRotationZ)) {
        _maxGravityZ = gravity.z;
    }
    if (self.gravityBlock) {
        self.gravityBlock(gravity, self.maxGravityX, self.maxAccelY, self.maxAccelZ);
    }
}

- (void)outputAttitudeData:(CMAttitude *)attitude
{
    if(fabs(attitude.roll) > fabs(self.maxAttitudeRoll)) {
        _maxAttitudeRoll = attitude.roll;
    }
    if(fabs(attitude.pitch) > fabs(self.maxAttitudePitch)) {
        _maxAttitudePitch = attitude.pitch;
    }
    if(fabs(attitude.yaw) > fabs(self.maxAttitudeYaw)) {
        _maxAttitudeYaw = attitude.yaw;
    }
    if (self.attitudeBlock) {
        self.attitudeBlock(attitude, self.maxAttitudeRoll, self.maxAttitudePitch, self.maxAttitudeYaw);
    }
}

- (void)clearMax
{
    _maxAccelX = 0.0f;
    _maxAccelX = 0.0f;
    _maxAccelX = 0.0f;
    
    _maxRotationX = 0.0f;
    _maxRotationY = 0.0f;
    _maxRotationZ = 0.0f;
    
    _maxGravityX = 0.0f;
    _maxGravityY = 0.0f;
    _maxGravityZ = 0.0f;
    
    _maxAttitudeRoll = 0.0f;
    _maxAttitudePitch = 0.0f;
    _maxAttitudeYaw = 0.0f;
}

@end
