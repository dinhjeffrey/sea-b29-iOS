//
//  Node.h
//  LocationReminders
//
//  Created by Bradley Johnson on 2/6/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (strong, nonatomic) Node *next;
@property (nonatomic) NSInteger data;

-(void)addNode:(Node*)node;

@end
