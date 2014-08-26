//
//  AIDetailTableViewController.h
//  CoreMotion
//
//  Created by Alexander Ignition on 26.08.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AIMotionType) {
    AIMotionTypeAcceleration,
    AIMotionTypeRotation,
    AIMotionTypeGravity,
    AIMotionTypeAttitude
};

@interface AIDetailTableViewController : UITableViewController

@property (strong, nonatomic) NSString *title;

@property (weak, nonatomic) IBOutlet UILabel *accelX;
@property (weak, nonatomic) IBOutlet UILabel *accelY;
@property (weak, nonatomic) IBOutlet UILabel *accelZ;

@property (weak, nonatomic) IBOutlet UILabel *maxAccelX;
@property (weak, nonatomic) IBOutlet UILabel *maxAccelY;
@property (weak, nonatomic) IBOutlet UILabel *maxAccelZ;

- (void)configurate:(AIMotionType)type;

@end
