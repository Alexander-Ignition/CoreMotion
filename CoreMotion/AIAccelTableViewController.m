//
//  AIAccelTableViewController.m
//  CoreMotion
//
//  Created by Александр Игнатьев on 12.06.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//


#import "AIAccelTableViewController.h"
#import "AIMotionManager.h"

#define MOTION [AIMotionManager sharedManager]


@interface AIAccelTableViewController ()

@end


@implementation AIAccelTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.accelX.text = [NSString stringWithFormat:@"%f", MOTION.accX];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
