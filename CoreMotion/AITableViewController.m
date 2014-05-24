//
//  AITableViewController.m
//  CoreMotion
//
//  Created by iМас on 18.05.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//


#import "AITableViewController.h"


@interface AITableViewController ()

@property (assign, nonatomic) double currentMaxAccelX;
@property (assign, nonatomic) double currentMaxAccelY;
@property (assign, nonatomic) double currentMaxAccelZ;
@property (assign, nonatomic) double currentMaxRotX;
@property (assign, nonatomic) double currentMaxRotY;
@property (assign, nonatomic) double currentMaxRotZ;

@property (strong, nonatomic) CMMotionManager *motionManager;

@end


@implementation AITableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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


#pragma mark - My Methods CMDeviceMotion

-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    self.accX.text = [NSString stringWithFormat:@" %.2fg",acceleration.x];
    if(fabs(acceleration.x) > fabs(self.currentMaxAccelX)) {
        self.currentMaxAccelX = acceleration.x;
    }
    self.accY.text = [NSString stringWithFormat:@" %.2fg",acceleration.y];
    if(fabs(acceleration.y) > fabs(self.currentMaxAccelY)) {
        self.currentMaxAccelY = acceleration.y;
    }
    self.accZ.text = [NSString stringWithFormat:@" %.2fg",acceleration.z];
    if(fabs(acceleration.z) > fabs(self.currentMaxAccelZ)) {
        self.currentMaxAccelZ = acceleration.z;
    }
    
    self.maxAccX.text = [NSString stringWithFormat:@" %.2f", self.currentMaxAccelX];
    self.maxAccY.text = [NSString stringWithFormat:@" %.2f", self.currentMaxAccelY];
    self.maxAccZ.text = [NSString stringWithFormat:@" %.2f", self.currentMaxAccelZ];
}

-(void)outputRotationData:(CMRotationRate)rotation
{
    self.rotX.text = [NSString stringWithFormat:@" %.2fr/s",rotation.x];
    if(fabs(rotation.x) > fabs(self.currentMaxRotX)) {
        self.currentMaxRotX = rotation.x;
    }
    self.rotY.text = [NSString stringWithFormat:@" %.2fr/s",rotation.y];
    if(fabs(rotation.y) > fabs(self.currentMaxRotY)) {
        self.currentMaxRotY = rotation.y;
    }
    self.rotZ.text = [NSString stringWithFormat:@" %.2fr/s",rotation.z];
    if(fabs(rotation.z) > fabs(self.currentMaxRotZ)) {
        self.currentMaxRotZ = rotation.z;
    }
    
    self.maxRotX.text = [NSString stringWithFormat:@" %.2f", self.currentMaxRotX];
    self.maxRotY.text = [NSString stringWithFormat:@" %.2f", self.currentMaxRotY];
    self.maxRotZ.text = [NSString stringWithFormat:@" %.2f", self.currentMaxRotZ];
}


#pragma mark - Action

- (IBAction)resetMaxValues:(id)sender
{
    self.currentMaxAccelX = 0;
    self.currentMaxAccelY = 0;
    self.currentMaxAccelZ = 0;
    
    self.currentMaxRotX = 0;
    self.currentMaxRotY = 0;
    self.currentMaxRotZ = 0;
}
@end
