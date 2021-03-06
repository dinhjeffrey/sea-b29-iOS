//
//  ProfileViewController.m
//  StackOverflowClient
//
//  Created by Bradley Johnson on 2/18/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController () <UIScrollViewDelegate>
@property (retain,nonatomic) UIScrollView *scrollView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.scrollView = [[UIScrollView alloc]
                     initWithFrame:self.view.frame];
  //self.scrollView.backgroundColor = [UIColor blueColor];
  self.scrollView.contentSize = CGSizeMake(2000, 2000);
  [self.view addSubview:self.scrollView];
  //self.scrollView.pagingEnabled = true;
  
  UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 1000, 100, 50)];
  textField.backgroundColor = [UIColor blueColor];
  [self.scrollView addSubview:textField];
  [textField release];
  self.scrollView.delegate = self;

  
  // Do any additional setup after loading the view.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
  NSLog(@"x:%f y:%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
  [self.scrollView release];
  [super dealloc];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
