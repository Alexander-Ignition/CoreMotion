//
//  AIDetailTableViewController.h
//  CoreMotion
//
//  Created by Alexander Ignition on 26.08.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//

@import UIKit;

@class AIMotionManager;

typedef NS_ENUM(NSInteger, AIMotionType) {
    AIMotionTypeAcceleration,
    AIMotionTypeRotation,
    AIMotionTypeGravity,
    AIMotionTypeAttitude
};

@interface AIDetailTableViewController : UITableViewController

- (void)motionManager:(AIMotionManager *)manager
          configurate:(AIMotionType)type;

@end
