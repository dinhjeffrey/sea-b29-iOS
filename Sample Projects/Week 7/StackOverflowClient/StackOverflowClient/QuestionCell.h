//
//  QuestionCell.h
//  StackOverflowClient
//
//  Created by Bradley Johnson on 2/17/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UITextView *titleTextView;

@end
