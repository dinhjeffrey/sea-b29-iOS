//
//  MenuPressedDelegate.h
//  StackOverflowClient
//
//  Created by Bradley Johnson on 2/18/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MenuPressedDelegate <NSObject>

-(void)menuOptionSelected:(NSInteger)selectedRow;

@end
