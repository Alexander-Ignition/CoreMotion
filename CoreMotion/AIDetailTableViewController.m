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

@property (strong, nonatomic) AIMotionManager *motionManager;

@property (weak, nonatomic) IBOutlet UILabel *accelX;
@property (weak, nonatomic) IBOutlet UILabel *accelY;
@property (weak, nonatomic) IBOutlet UILabel *accelZ;

@property (weak, nonatomic) IBOutlet UILabel *maxAccelX;
@property (weak, nonatomic) IBOutlet UILabel *maxAccelY;
@property (weak, nonatomic) IBOutlet UILabel *maxAccelZ;

@end

@implementation AIDetailTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
     target:self
     action:@selector(cleanMaxAction:)];;
}

- (void)motionManager:(AIMotionManager *)manager
          configurate:(AIMotionType)type
{
    self.motionManager = manager;
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

- (void)acceleration {
    __weak AIDetailTableViewController *weakSelf = self;
    [self.motionManager setAccelerationHandler:^(CMAcceleration acceleration, double maxX, double maxY, double maxZ) {
        [weakSelf currentX:acceleration.x currentY:acceleration.y currentZ:acceleration.y maxX:maxX maxY:maxX maxZ:maxX];
    }];
}

- (void)rotation {
    __weak AIDetailTableViewController *weakSelf = self;
    [self.motionManager setRotationHandler:^(CMRotationRate rotation, double maxX, double maxY, double maxZ) {
        [weakSelf currentX:rotation.x currentY:rotation.y currentZ:rotation.y maxX:maxX maxY:maxX maxZ:maxX];
    }];
}

- (void)gravity {
    __weak AIDetailTableViewController *weakSelf = self;
    [self.motionManager setGravityHandler:^(CMAcceleration gravity, double maxX, double maxY, double maxZ) {
        [weakSelf currentX:gravity.x currentY:gravity.y currentZ:gravity.y maxX:maxX maxY:maxX maxZ:maxX];
    }];
}

- (void)attitude {
    __weak AIDetailTableViewController *weakSelf = self;
    [self.motionManager setAttitudeHandler:^(CMAttitude *attitude, double roll, double pitch, double yaw) {
        [weakSelf currentX:attitude.roll currentY:attitude.pitch currentZ:attitude.yaw maxX:roll maxY:pitch maxZ:yaw];
    }];
}

- (void)currentX:(double)currentX
        currentY:(double)currentY
        currentZ:(double)currentZ
            maxX:(double)maxX
            maxY:(double)maxY
            maxZ:(double)maxZ
{
    self.accelX.text = [NSString stringWithFormat:@"%.2f", currentX];
    self.accelY.text = [NSString stringWithFormat:@"%.2f", currentY];
    self.accelZ.text = [NSString stringWithFormat:@"%.2f", currentZ];
    
    self.maxAccelX.text = [NSString stringWithFormat:@"%.2f", maxX];
    self.maxAccelY.text = [NSString stringWithFormat:@"%.2f", maxY];
    self.maxAccelZ.text = [NSString stringWithFormat:@"%.2f", maxZ];
}


#pragma mark - Actions

- (void)cleanMaxAction:(UIBarButtonItem *)sender {
    [self.motionManager clearMax];
    self.maxAccelX.text = @"0.0";
    self.maxAccelY.text = @"0.0";
    self.maxAccelZ.text = @"0.0";
}

@end
