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

@interface LQViewController ()

@end

@implementation LQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Test" style:UIBarButtonItemStylePlain target:self action:@selector(showLeft:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Setup" style:UIBarButtonItemStylePlain target:self action:@selector(showRight:)];
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
}

- (void)showLeft:(id)sender {
    [self.revealSideViewController pushOldViewControllerOnDirection:PPRevealSideDirectionLeft animated:YES];
}

- (void)showRight:(id)sender {
    [self.revealSideViewController pushOldViewControllerOnDirection:PPRevealSideDirectionRight animated:YES];
}

@end