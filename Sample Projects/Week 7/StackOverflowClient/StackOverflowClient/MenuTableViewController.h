//
//  MenuTableViewController.h
//  StackOverflowClient
//
//  Created by Bradley Johnson on 2/16/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuPressedDelegate.h"

typedef enum {
  Hello,
  Goodbye
} greeting;

typedef NSString word;
typedef void (^SOCompletionHandler)(NSArray *, NSError *);
@interface MenuTableViewController : UITableViewController

@property (weak,nonatomic) id<MenuPressedDelegate> delegate;

-(void)fetchQuestionsForSearchTerm:(NSString *)searchTerm withCompletionHandler:(SOCompletionHandler)completion;


@end
