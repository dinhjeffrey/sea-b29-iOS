//
//  LinkedList.m
//  LocationReminders
//
//  Created by Bradley Johnson on 2/6/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import "LinkedList.h"

@implementation LinkedList

-(void)insertValue:(NSInteger)value {
  Node *node = [Node new];
  node.data = value;
  
  if (self.head == nil) {
    self.head = node;
    self.tail = node;
  } else {
    [self insertAtHead:node];
  }
}

-(void)insertAtHead:(Node*)node {
  node.next = self.head;
  self.head = node;
}

-(void)insertAtEnd:(Node*)node {
  [self.head addNode:node];
}

-(void)insertAtEndWithWhile:(Node *)node {
  Node *nextNode = self.head;
  while (nextNode.next != nil) {
    nextNode = nextNode.next;
  }
  nextNode.next = node;
}

@end
