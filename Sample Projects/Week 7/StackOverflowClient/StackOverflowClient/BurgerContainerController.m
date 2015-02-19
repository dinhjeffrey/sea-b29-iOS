//
//  BurgerContainerController.m
//  StackOverflowClient
//
//  Created by Bradley Johnson on 2/16/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

#import "BurgerContainerController.h"
#import "MenuTableViewController.h"
#import "ProfileViewController.h"

@interface BurgerContainerController () <MenuPressedDelegate>

@property (strong,nonatomic) UIViewController *topViewController;
@property (strong,nonatomic) UIButton *burgerButton;
@property (strong,nonatomic) UITapGestureRecognizer *tapToClose;
@property (strong,nonatomic) UIPanGestureRecognizer *slideRecognizer;

@property (strong,nonatomic) UINavigationController *searchVC;
@property (strong,nonatomic) ProfileViewController *profileVC;
@property (nonatomic) NSInteger selectedRow;
@property (strong,nonatomic) MenuTableViewController *menuVC;

@end

@implementation BurgerContainerController

NSInteger const slideRightBuffer = 300;

- (void)viewDidLoad {
    [super viewDidLoad];
  
  NSArray *things = [NSArray arrayWithObjects:@"Brad",@"Johnson", nil];
  
 // NSString *name = things[5];
  
  

  [self addChildViewController:self.searchVC];
  self.searchVC.view.frame = self.view.frame;
  [self.view addSubview:self.searchVC.view];
  [self.searchVC didMoveToParentViewController:self];
  self.topViewController = self.searchVC;
  self.selectedRow = 0;
  
  UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
  [button setBackgroundImage:[UIImage imageNamed:@"burger"] forState:UIControlStateNormal];
  [button addTarget:self action:@selector(burgerButtonPressed) forControlEvents:UIControlEventTouchUpInside];
  
  [self.searchVC.view addSubview:button];
  
  self.burgerButton = button;
  
  self.tapToClose = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closePanel)];
  
  self.slideRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(slidePanel:)];
  [self.topViewController.view addGestureRecognizer:self.slideRecognizer];
  
  
    // Do any additional setup after loading the view.
}

-(void)burgerButtonPressed {
  NSLog(@"burger pressed");
  
  self.burgerButton.userInteractionEnabled = false;
  
  __weak BurgerContainerController *weakSelf = self;
  
  [UIView animateWithDuration:.3 animations:^{
    weakSelf.topViewController.view.center = CGPointMake(weakSelf.topViewController.view.center.x + slideRightBuffer, weakSelf.topViewController.view.center.y);
  } completion:^(BOOL finished) {
    [weakSelf.topViewController.view addGestureRecognizer:weakSelf.tapToClose];
  }];
}

-(void)closePanel {
  
  NSLog(@"closing panel");
  
  [self.topViewController.view removeGestureRecognizer:self.tapToClose];
  
  
  __weak BurgerContainerController *weakSelf = self;
  
  [UIView animateWithDuration:0.3 animations:^{
    weakSelf.topViewController.view.center = weakSelf.view.center;
  } completion:^(BOOL finished) {
    weakSelf.burgerButton.userInteractionEnabled = true;
  }];
}

-(void)slidePanel:(id)sender {
  UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)sender;
  
  CGPoint translatedPoint = [pan translationInView:self.view];
  CGPoint velocity = [pan velocityInView:self.view];
  
  if ([pan state] == UIGestureRecognizerStateChanged) {
    
    if (velocity.x > 0 || self.topViewController.view.frame.origin.x > 0) {
    self.topViewController.view.center = CGPointMake(self.topViewController.view.center.x + translatedPoint.x, self.topViewController.view.center.y);
    [pan setTranslation:CGPointZero inView:self.view];
    
    }
  }
 
  if ([pan state] == UIGestureRecognizerStateEnded) {
    
    __weak BurgerContainerController *weakSelf = self;
    
    if (self.topViewController.view.frame.origin.x > self.view.frame.size.width / 3) {
      NSLog(@"they meant to open it");
      self.burgerButton.userInteractionEnabled = false;
      [UIView animateWithDuration:0.3 animations:^{
        self.topViewController.view.center = CGPointMake(weakSelf.view.frame.size.width * 1.25, weakSelf.topViewController.view.center.y);
      } completion:^(BOOL finished) {
        [weakSelf.topViewController.view addGestureRecognizer:weakSelf.tapToClose];
      }];
    }
    else {
      [UIView animateWithDuration:0.2 animations:^{
        weakSelf.topViewController.view.center = weakSelf.view.center;
      }];
      [self.topViewController.view removeGestureRecognizer:self.tapToClose];
    }
  }
  
}

-(UINavigationController *)searchVC {
  if (!_searchVC) {
    _searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SEARCH_VC"];
  }
  return _searchVC;
}

-(ProfileViewController *)profileVC {
  if (!_profileVC) {
    _profileVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PROFILE_VC"];
  }
  return _profileVC;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  
  if ([segue.identifier isEqualToString:@"EMBED_MENU"]) {
    MenuTableViewController *destinationVC = segue.destinationViewController;
    destinationVC.delegate = self;
    self.menuVC = destinationVC;
    
  }
}

-(void)switchToViewController:(UIViewController *)destinationVC {
  
  __weak BurgerContainerController *weakSelf = self;
  [UIView animateWithDuration:0.2 animations:^{
    
    weakSelf.topViewController.view.frame = CGRectMake(weakSelf.view.frame.size.width, 0, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);
  } completion:^(BOOL finished) {
    
    destinationVC.view.frame = self.topViewController.view.frame;
    
    [self.topViewController.view removeGestureRecognizer:self.slideRecognizer];
    [self.burgerButton removeFromSuperview];
    [self.topViewController willMoveToParentViewController:nil];
    [self.topViewController.view removeFromSuperview];
    [self.topViewController removeFromParentViewController];
    
    self.topViewController = destinationVC;
    
    [self addChildViewController:self.topViewController];
    [self.view addSubview:self.topViewController.view];
    [self.topViewController didMoveToParentViewController:self];
    [self.topViewController.view addSubview:self.burgerButton];
    [self.topViewController.view addGestureRecognizer:self.slideRecognizer];
    
    [self closePanel];
  } ];
  
}

-(void)menuOptionSelected:(NSInteger)selectedRow {
  NSLog(@"%ld",(long)selectedRow);
  if (self.selectedRow == selectedRow) {
    [self closePanel];
  } else {
    self.selectedRow = selectedRow;
    UIViewController *destinationVC;
    switch (selectedRow) {
      case 0:
        destinationVC = self.searchVC;
        break;
      case 1:
        destinationVC = self.profileVC;
        break;
      case 2:
        break;
      default:
        break;
    }
    [self switchToViewController:destinationVC];
  }
}
                            
@end
