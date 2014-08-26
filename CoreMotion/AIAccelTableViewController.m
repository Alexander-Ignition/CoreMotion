//
//  AIAccelTableViewController.m
//  CoreMotion
//
//  Created by Александр Игнатьев on 12.06.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//

#import "AIAccelTableViewController.h"
#import "AIMotionManager.h"


@interface AIAccelTableViewController ()

@end


@implementation AIAccelTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weak AIAccelTableViewController *weakSelf = self;
    [MOTION acceleration:^(CMAcceleration acceleration, double maxX, double maxY, double maxZ) {
        weakSelf.accelZ.text = [NSString stringWithFormat:@"%.2f", acceleration.x];
        weakSelf.accelY.text = [NSString stringWithFormat:@"%.2f", acceleration.y];
        weakSelf.accelZ.text = [NSString stringWithFormat:@"%.2f", acceleration.z];
        
        weakSelf.maxAccelX.text = [NSString stringWithFormat:@"%.2f", maxX];
        weakSelf.maxAccelY.text = [NSString stringWithFormat:@"%.2f", maxY];
        weakSelf.maxAccelZ.text = [NSString stringWithFormat:@"%.2f", maxZ];
    }];
}

- (IBAction)cleanMaxAction:(UIBarButtonItem *)sender
{
//    MOTION.maxAccelX = 0.0f;
//    MOTION.maxAccelY = 0.0f;
//    MOTION.maxAccelZ = 0.0f;
}

@end
