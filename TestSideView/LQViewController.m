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
    
    /* 初始化AwesomeMenu */
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
    UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];
    
    AwesomeMenuItem *starMenuItem1 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:starImage highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem2 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:starImage highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem3 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:starImage highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem4 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:starImage highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem5 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:starImage highlightedContentImage:nil];
    
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, nil];
    
    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:self.view.bounds menus:menus];
	menu.menuWholeAngle = M_PI/2*1.25;
    
	// customize menu
	/*
     menu.rotateAngle = M_PI/3;
     menu.menuWholeAngle = M_PI;
     menu.timeOffset = 0.2f;
     menu.farRadius = 180.0f;
     menu.endRadius = 100.0f;
     menu.nearRadius = 50.0f;
     */
    
    menu.startPoint = CGPointMake(30, 386.0);
	
    menu.delegate = self;
    
    [self.view addSubview:menu];


    
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

/* Table */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 16;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if(indexPath.row == 0) {
        // 如果是第一行,则显示图片一张
        UIImageView *cover = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
        [cover setImage:[UIImage imageNamed:@"cover.png"]];
        [cell addSubview:cover];
    } else {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 100, 28)];
        [label setText:@"测试"];
        [cell addSubview:label];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0)
        return 150;
    else
        return 34;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"1111111111111111111111------%d",indexPath.row);
    UITableViewCell *cell = [self.newsTable cellForRowAtIndexPath:indexPath];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(140, 2, 100, 28)];
    [label setText:@"测试"];
    
    [cell addSubview:label];

}

/* AwesomeMenu */
- (void)AwesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx {
    
}
@end