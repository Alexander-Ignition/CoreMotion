//
//  AITableViewController.m
//  CoreMotion
//
//  Created by iМас on 18.05.14.
//  Copyright (c) 2014 Alexander Ignition. All rights reserved.
//

#import "AITableViewController.h"
#import "AIDetailTableViewController.h"
#import "AIMotionManager.h"

@interface AITableViewController ()

@end

@implementation AITableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AIDetailTableViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    
    controller.title = ((UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath]).textLabel.text;
    
    AIMotionType type = indexPath.row;
    
    [controller motionManager:[AIMotionManager sharedManager] configurate:type];
    
    [self.navigationController pushViewController:controller animated:YES];
}

@end
