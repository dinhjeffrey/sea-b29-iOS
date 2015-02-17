//
//  SearchQuestionsViewController.m
//  StackOverflowClient
//
//  Created by Bradley Johnson on 2/17/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import "SearchQuestionsViewController.h"
#import "StackOverflowService.h"
#import "Question.h"
#import "QuestionCell.h"

@interface SearchQuestionsViewController () <UISearchBarDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong,nonatomic) NSArray *questions;

@end

@implementation SearchQuestionsViewController

- (void)viewDidLoad {

  
    [super viewDidLoad];
  self.searchBar.delegate = self;
  self.tableView.dataSource = self;
  self.tableView.rowHeight = UITableViewAutomaticDimension;
    // Do any additional setup after loading the view.
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

  
  [[StackOverflowService sharedService] fetchQuestionsWithSearchTerm:searchBar.text completionHandler:^(NSArray *results, NSString *error) {
    self.questions = results;
    if (error) {
      //show alert view
    }
    [self.tableView reloadData];
  }];
  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.questions.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QUESTION_CELL"
                                                          forIndexPath:indexPath];
  cell.avatarImageView.image = nil;
  Question *question = self.questions[indexPath.row];
  cell.titleTextView.text = question.title;
  if (!question.image) {
    [[StackOverflowService sharedService] fetchUserImage:question.avatarURL completionHandler:^(UIImage *image) {
      question.image = image;
      cell.avatarImageView.image = image;
    }];
  } else {
    cell.avatarImageView.image = question.image;
  }
  return cell;
}

@end
