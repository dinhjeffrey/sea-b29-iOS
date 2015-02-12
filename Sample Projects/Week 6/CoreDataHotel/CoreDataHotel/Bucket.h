//
//  Bucket.h
//  CoreDataHotel
//
//  Created by Bradley Johnson on 2/12/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bucket : NSObject

@property (strong,nonatomic) Bucket *next;
@property (strong,nonatomic) id data;
@property (strong,nonatomic) NSString *key;

@end
