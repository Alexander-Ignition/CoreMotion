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
    self.navigationItem.title = self.title;
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                 target:self
                                                                                 action:@selector(cleanMaxAction:)];
    [self.navigationItem setRightBarButtonItem:refreshItem];
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
            
        case AIMotionTypeAttitude:
            [self attitude];
            break;
            
        default:
            break;
    }
}

- (void)acceleration
{
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

- (void)attitude
{
    __weak AIDetailTableViewController *weakSelf = self;
    [MOTION attitude:^(CMAttitude *attitude, double roll, double pitch, double yaw) {
        weakSelf.accelX.text = [NSString stringWithFormat:@"%.2f", attitude.roll];
        weakSelf.accelY.text = [NSString stringWithFormat:@"%.2f", attitude.pitch];
        weakSelf.accelZ.text = [NSString stringWithFormat:@"%.2f", attitude.yaw];
        
        weakSelf.maxAccelX.text = [NSString stringWithFormat:@"%.2f", roll];
        weakSelf.maxAccelY.text = [NSString stringWithFormat:@"%.2f", pitch];
        weakSelf.maxAccelZ.text = [NSString stringWithFormat:@"%.2f", yaw];
    }];
}


#pragma mark - Actions

- (void)cleanMaxAction:(UIBarButtonItem *)sender
{
    [MOTION clearMax];
    self.maxAccelX.text = @"0.0";
    self.maxAccelY.text = @"0.0";
    self.maxAccelZ.text = @"0.0";
}

@end
