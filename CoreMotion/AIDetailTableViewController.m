//
//  AIDetailTableViewController.m
//  CoreMotion
//
//  Created by Alexander Ignition on 26.08.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//

#import "AIDetailTableViewController.h"
#import "AIMotionManager.h"

@interface AIDetailTableViewController ()

@end

@implementation AIDetailTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)configurate:(AIMotionType)type
{
    switch (type) {
        case AIMotionTypeAcceleration:
            [self acceleration];
            break;
            
        case AIMotionTypeRotation:
            [self rotation];
            break;
            
        case AIMotionTypeGravity:
            [self gravity];
            break;
            
        default:
            break;
    }
}

- (void)acceleration
{
    self.navigationItem.title = @"Acceleration";
    __weak AIDetailTableViewController *weakSelf = self;
    [MOTION acceleration:^(CMAcceleration acceleration, double maxX, double maxY, double maxZ) {
        weakSelf.accelX.text = [NSString stringWithFormat:@"%.2f", acceleration.x];
        weakSelf.accelY.text = [NSString stringWithFormat:@"%.2f", acceleration.y];
        weakSelf.accelZ.text = [NSString stringWithFormat:@"%.2f", acceleration.z];
        
        weakSelf.maxAccelX.text = [NSString stringWithFormat:@"%.2f", maxX];
        weakSelf.maxAccelY.text = [NSString stringWithFormat:@"%.2f", maxY];
        weakSelf.maxAccelZ.text = [NSString stringWithFormat:@"%.2f", maxZ];
    }];
}

- (void)rotation
{
    self.navigationItem.title = @"Rotation";
    __weak AIDetailTableViewController *weakSelf = self;
    [MOTION rotation:^(CMRotationRate rotation, double maxX, double maxY, double maxZ) {
        weakSelf.accelX.text = [NSString stringWithFormat:@"%.2f", rotation.x];
        weakSelf.accelY.text = [NSString stringWithFormat:@"%.2f", rotation.y];
        weakSelf.accelZ.text = [NSString stringWithFormat:@"%.2f", rotation.z];
        
        weakSelf.maxAccelX.text = [NSString stringWithFormat:@"%.2f", maxX];
        weakSelf.maxAccelY.text = [NSString stringWithFormat:@"%.2f", maxY];
        weakSelf.maxAccelZ.text = [NSString stringWithFormat:@"%.2f", maxZ];
    }];
}

- (void)gravity
{
    self.navigationItem.title = @"Gravity";
    __weak AIDetailTableViewController *weakSelf = self;
    [MOTION gravity:^(CMAcceleration gravity, double maxX, double maxY, double maxZ) {
        weakSelf.accelX.text = [NSString stringWithFormat:@"%.2f", gravity.x];
        weakSelf.accelY.text = [NSString stringWithFormat:@"%.2f", gravity.y];
        weakSelf.accelZ.text = [NSString stringWithFormat:@"%.2f", gravity.z];
        
        weakSelf.maxAccelX.text = [NSString stringWithFormat:@"%.2f", maxX];
        weakSelf.maxAccelY.text = [NSString stringWithFormat:@"%.2f", maxY];
        weakSelf.maxAccelZ.text = [NSString stringWithFormat:@"%.2f", maxZ];
    }];
}


#pragma mark - Actions

- (IBAction)cleanMaxAction:(UIBarButtonItem *)sender
{
//    MOTION.maxAccelX = 0.0f;
//    MOTION.maxAccelY = 0.0f;
//    MOTION.maxAccelZ = 0.0f;
}

@end
