//
//  AddReminderViewController.m
//  LocationReminders
//
//  Created by Bradley Johnson on 2/4/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import "AddReminderViewController.h"

@interface AddReminderViewController ()

@end

@implementation AddReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  NSLog(@" long: %f lat: %f", self.annotation.coordinate.longitude, self.annotation.coordinate.latitude);
    // Do any additional setup after loading the view.
}
- (IBAction)pressedAddReminderButton:(id)sender {
  if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:self.annotation.coordinate radius:200 identifier:@"Reminder"];
    [self.locationManager startMonitoringForRegion:region];
   // NSDictionary *userInfo = @{@"reminder" : region};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReminderAdded" object:self userInfo:@{@"reminder" : region}];
    
    
    
  }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
