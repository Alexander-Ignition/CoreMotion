//
//  AIMotionManager.h
//  CoreMotion
//
//  Created by Александр Игнатьев on 24.05.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

typedef void(^AccelerationBlock)(CMAcceleration acceleration, double maxX, double maxY, double maxZ);
typedef void(^RotationBlock)(CMRotationRate rotation, double maxX, double maxY, double maxZ);
typedef void(^GravityBlock)(CMAcceleration gravity, double maxX, double maxY, double maxZ);
typedef void(^AttitudeBlock)(CMAttitude *attitude, double roll, double pitch, double yaw);

@interface AIMotionManager : NSObject

@property (strong, nonatomic, readonly) CMMotionManager *motionManager;

@property (assign, nonatomic, readonly) double maxAccelX;
@property (assign, nonatomic, readonly) double maxAccelY;
@property (assign, nonatomic, readonly) double maxAccelZ;

@property (assign, nonatomic, readonly) double maxRotationX;
@property (assign, nonatomic, readonly) double maxRotationY;
@property (assign, nonatomic, readonly) double maxRotationZ;

@property (assign, nonatomic, readonly) double maxGravityX;
@property (assign, nonatomic, readonly) double maxGravityY;
@property (assign, nonatomic, readonly) double maxGravityZ;

@property (assign, nonatomic, readonly) double maxAttitudeRoll;
@property (assign, nonatomic, readonly) double maxAttitudePitch;
@property (assign, nonatomic, readonly) double maxAttitudeYaw;

+ (instancetype)sharedManager;

- (void)setAccelerationHandler:(AccelerationBlock)handler;
- (void)setRotationHandler:(RotationBlock)handler;
- (void)setGravityHandler:(GravityBlock)handler;
- (void)setAttitudeHandler:(AttitudeBlock)handler;

- (void)clearMax;

@end
