//
//  Node.m
//  LocationReminders
//
//  Created by Bradley Johnson on 2/6/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import "Node.h"

@implementation Node

-(void)addNode:(Node *)node {
  if (self.next == nil) {
    self.next = node;
  } else {
    //recursive
    [self.next addNode:node];
  }
}

@end
