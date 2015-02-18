//
//  MenuTableViewController.h
//  StackOverflowClient
//
//  Created by Bradley Johnson on 2/16/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuPressedDelegate.h"

@interface MenuTableViewController : UITableViewController

@property (weak,nonatomic) id<MenuPressedDelegate> delegate;

@end
