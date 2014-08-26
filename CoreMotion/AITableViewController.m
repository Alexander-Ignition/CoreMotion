//
//  AITableViewController.m
//  CoreMotion
//
//  Created by iМас on 18.05.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//

#import "AITableViewController.h"
#import "AIDetailTableViewController.h"


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
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AIDetailTableViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    [controller configurate:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
