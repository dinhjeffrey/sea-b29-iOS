//
//  AddReminderViewController.h
//  LocationReminders
//
//  Created by Bradley Johnson on 2/4/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AddReminderViewController : UIViewController

@property (strong,nonatomic) MKPointAnnotation *annotation;
@property (strong,nonatomic) CLLocationManager *locationManager;

@end
