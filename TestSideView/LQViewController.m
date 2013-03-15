//
//  LQViewController.m
//  TestSideView
//
//  Created by M on 13-3-13.
//  Copyright (c) 2013年 M. All rights reserved.
//

#import "LQViewController.h"
#import "LQMenuViewController.h"
#import "LQSetupViewController.h"
#import "vars.h"

@interface LQViewController ()

@end

@implementation LQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Test" style:UIBarButtonItemStylePlain target:self action:@selector(showLeft:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"i" style:UIBarButtonItemStylePlain target:self action:@selector(showRight:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    LQMenuViewController *menu = [[LQMenuViewController alloc] initWithNibName:@"LQMenuViewController" bundle:nil];
    [self.revealSideViewController preloadViewController:menu forSide:PPRevealSideDirectionLeft];
    
    LQSetupViewController *setup = [[LQSetupViewController alloc] initWithNibName:@"LQSetupViewController" bundle:nil];
    [self.revealSideViewController preloadViewController:setup forSide:PPRevealSideDirectionRight];
    
    // 设置左边滑动的Offset值
    [self.revealSideViewController changeOffset:OFFSETLEFT forDirection:PPRevealSideDirectionLeft];
    // 设置右边滑动的Offset值
    [self.revealSideViewController changeOffset:OFFSETRIGHT forDirection:PPRevealSideDirectionRight];

}

- (void)showLeft:(id)sender {
    [self.revealSideViewController pushOldViewControllerOnDirection:PPRevealSideDirectionLeft withOffset:OFFSETLEFT animated:YES];
}

- (void)showRight:(id)sender {
    [self.revealSideViewController pushOldViewControllerOnDirection:PPRevealSideDirectionRight withOffset:OFFSETRIGHT animated:YES];
}

@end