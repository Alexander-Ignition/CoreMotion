//
//  AIAccelTableViewController.h
//  CoreMotion
//
//  Created by Александр Игнатьев on 12.06.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface AIAccelTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *accelX;
@property (weak, nonatomic) IBOutlet UILabel *accelY;
@property (weak, nonatomic) IBOutlet UILabel *accelZ;

@property (weak, nonatomic) IBOutlet UILabel *maxAccelX;
@property (weak, nonatomic) IBOutlet UILabel *maxAccelY;
@property (weak, nonatomic) IBOutlet UILabel *maxAccelZ;

@end
