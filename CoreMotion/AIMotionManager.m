//
//  AIMotionManager.m
//  CoreMotion
//
//  Created by Александр Игнатьев on 24.05.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//


#import "AIMotionManager.h"
#import <CoreMotion/CoreMotion.h>


@interface AIMotionManager ()

@property (assign, nonatomic) double currentMaxAccelX;
@property (assign, nonatomic) double currentMaxAccelY;
@property (assign, nonatomic) double currentMaxAccelZ;

@property (assign, nonatomic) double currentMaxRotX;
@property (assign, nonatomic) double currentMaxRotY;
@property (assign, nonatomic) double currentMaxRotZ;

@property (assign, nonatomic) double currentMaxGravX;
@property (assign, nonatomic) double currentMaxGravY;
@property (assign, nonatomic) double currentMaxGravZ;

@property (assign, nonatomic) double currentMaxAttX;
@property (assign, nonatomic) double currentMaxAttY;
@property (assign, nonatomic) double currentMaxAttZ;

@property (strong, nonatomic) CMMotionManager *motionManager;

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

- (id)init
{
    self = [super init];
    if (self) {
        
        self.currentMaxAccelX = 0;
        self.currentMaxAccelY = 0;
        self.currentMaxAccelZ = 0;
        
        self.currentMaxRotX = 0;
        self.currentMaxRotY = 0;
        self.currentMaxRotZ = 0;
        
        self.motionManager = [[CMMotionManager alloc] init];
        self.motionManager.accelerometerUpdateInterval = .2;
        self.motionManager.gyroUpdateInterval = .2;
        
        if (self.motionManager.isDeviceMotionAvailable) {
            
            self.motionManager.deviceMotionUpdateInterval = 1.0/2.0;
            
            [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
                
                [self outputAccelertionData:motion.userAcceleration];
                [self outputRotationData:motion.rotationRate];
                if(error){
                    NSLog(@"%@", error);
                }
            }];
        }

    }
    return self;
}


#pragma mark - My Methods CMDeviceMotion

- (void)outputAccelertionData:(CMAcceleration)acceleration
{
    self.accX = acceleration.x;
    if(fabs(acceleration.x) > fabs(self.currentMaxAccelX)) {
        self.currentMaxAccelX = acceleration.x;
    }
    self.accY = acceleration.y;
    if(fabs(acceleration.y) > fabs(self.currentMaxAccelY)) {
        self.currentMaxAccelY = acceleration.y;
    }
    self.accZ = acceleration.z;
    if(fabs(acceleration.z) > fabs(self.currentMaxAccelZ)) {
        self.currentMaxAccelZ = acceleration.z;
    }
    
    self.maxAccX = self.currentMaxAccelX;
    self.maxAccY = self.currentMaxAccelY;
    self.maxAccZ = self.currentMaxAccelZ;
}

- (void)outputRotationData:(CMRotationRate)rotation
{
    self.rotX = rotation.x;
    if(fabs(rotation.x) > fabs(self.currentMaxRotX)) {
        self.currentMaxRotX = rotation.x;
    }
    self.rotY = rotation.y;
    if(fabs(rotation.y) > fabs(self.currentMaxRotY)) {
        self.currentMaxRotY = rotation.y;
    }
    self.rotZ = rotation.z;
    if(fabs(rotation.z) > fabs(self.currentMaxRotZ)) {
        self.currentMaxRotZ = rotation.z;
    }
    
    self.maxRotX = self.currentMaxRotX;
    self.maxRotY = self.currentMaxRotY;
    self.maxRotZ = self.currentMaxRotZ;
}

- (void)outputData:(CMRotationRate)rotation
{
    self.gravX = rotation.x;
    if(fabs(rotation.x) > fabs(self.currentMaxGravX)) {
        self.currentMaxGravX = rotation.x;
    }
    self.gravY = rotation.y;
    if(fabs(rotation.y) > fabs(self.currentMaxGravY)) {
        self.currentMaxGravY = rotation.y;
    }
    self.gravZ = rotation.z;
    if(fabs(rotation.z) > fabs(self.currentMaxGravZ)) {
        self.currentMaxGravZ = rotation.z;
    }
    
    self.maxGravX = self.currentMaxGravX;
    self.maxGravY = self.currentMaxGravY;
    self.maxGravZ = self.currentMaxGravZ;
}

@end
