//
//  LinkedList.h
//  LocationReminders
//
//  Created by Bradley Johnson on 2/6/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface LinkedList : NSObject

@property (strong,nonatomic) Node *head;
@property (strong,nonatomic) Node *tail;
-(void)insertValue:(NSInteger)value;

@end
