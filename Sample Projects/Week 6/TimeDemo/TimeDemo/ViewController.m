//
//  ViewController.m
//  TimeDemo
//
//  Created by Bradley Johnson on 2/10/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSDateFormatter *dateFormatter = [NSDateFormatter new];
  [dateFormatter setDateFormat:@"MM dd"];
  
  NSDate *now = [NSDate new];
  //NSLog(@"%@",[dateFormatter stringFromDate:now]);
  // Do any additional setup after loading the view, typically from a nib.
  
  NSDateComponents *components = [[NSDateComponents alloc] init];
  components.day = 12;
  components.year = 1999;
  components.month = 12;
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSDate *newDate = [calendar dateFromComponents:components];
  
  NSLog(@"%@",[dateFormatter stringFromDate:newDate]);
  // Do any additional setup after loading the view, typically from a nib.
  
  
  
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
