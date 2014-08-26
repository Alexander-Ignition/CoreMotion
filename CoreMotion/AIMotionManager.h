//
//  AIMotionManager.h
//  CoreMotion
//
//  Created by Александр Игнатьев on 24.05.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

#define MOTION [AIMotionManager sharedManager]


@interface AIMotionManager : NSObject

+ (AIMotionManager *)sharedManager;

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

- (void)acceleration:(void(^)(CMAcceleration acceleration, double maxX, double maxY, double maxZ))whitHandler;
- (void)rotation:(void(^)(CMRotationRate rotation, double maxX, double maxY, double maxZ))whitHandler;
- (void)gravity:(void(^)(CMAcceleration gravity, double maxX, double maxY, double maxZ))whitHandler;
- (void)attitude:(void(^)(CMAttitude *attitude, double roll, double pitch, double yaw))whitHandler;

- (void)clearMax;

@end
