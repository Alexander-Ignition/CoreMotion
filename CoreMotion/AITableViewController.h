//
//  AITableViewController.h
//  CoreMotion
//
//  Created by iМас on 18.05.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>


@interface AITableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *accX;
@property (weak, nonatomic) IBOutlet UILabel *accY;
@property (weak, nonatomic) IBOutlet UILabel *accZ;

@property (weak, nonatomic) IBOutlet UILabel *maxAccX;
@property (weak, nonatomic) IBOutlet UILabel *maxAccY;
@property (weak, nonatomic) IBOutlet UILabel *maxAccZ;

@property (weak, nonatomic) IBOutlet UILabel *rotX;
@property (weak, nonatomic) IBOutlet UILabel *rotY;
@property (weak, nonatomic) IBOutlet UILabel *rotZ;

@property (weak, nonatomic) IBOutlet UILabel *maxRotX;
@property (weak, nonatomic) IBOutlet UILabel *maxRotY;
@property (weak, nonatomic) IBOutlet UILabel *maxRotZ;

- (IBAction)resetMaxValues:(id)sender;

@end
