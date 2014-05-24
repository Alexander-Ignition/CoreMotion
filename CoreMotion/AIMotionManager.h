//
//  AIMotionManager.h
//  CoreMotion
//
//  Created by Александр Игнатьев on 24.05.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface AIMotionManager : NSObject

@property (assign, nonatomic) double accX;
@property (assign, nonatomic) double accY;
@property (assign, nonatomic) double accZ;

@property (assign, nonatomic) double maxAccX;
@property (assign, nonatomic) double maxAccY;
@property (assign, nonatomic) double maxAccZ;

@property (assign, nonatomic) double rotX;
@property (assign, nonatomic) double rotY;
@property (assign, nonatomic) double rotZ;

@property (assign, nonatomic) double maxRotX;
@property (assign, nonatomic) double maxRotY;
@property (assign, nonatomic) double maxRotZ;

@property (assign, nonatomic) double gravX;
@property (assign, nonatomic) double gravY;
@property (assign, nonatomic) double gravZ;

@property (assign, nonatomic) double maxGravX;
@property (assign, nonatomic) double maxGravY;
@property (assign, nonatomic) double maxGravZ;

@property (assign, nonatomic) double attX;
@property (assign, nonatomic) double attY;
@property (assign, nonatomic) double attZ;

@property (assign, nonatomic) double maxAttX;
@property (assign, nonatomic) double maxAttY;
@property (assign, nonatomic) double maxAttZ;

@end
