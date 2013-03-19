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
    
    // 初始化这个view的背景,都是木纹图案
    UIImageView *rightBg;
    if(!iPhone5) {
        rightBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right_bg.png"]];
    } else {
        rightBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right_bg_i5"]];
    }
    [self.view addSubview:rightBg];
    
    // 设置NavigatonBar
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"banner.png"] forBarMetrics:UIBarMetricsDefault];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [title setText:@"测 试"];	
    [title setFont:[UIFont fontWithName:@"Arial Rounded MT Bold" size:(22)]];
    title.textColor = [UIColor whiteColor];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setCenter:CGPointMake(160, 22)];
    title.adjustsFontSizeToFitWidth = YES;
    [self.navigationController.navigationBar addSubview:title];
    
    
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    [leftButton setTitle:[super navigationController].title forState:UIControlEventTouchUpInside];
    [leftButton setImage:[UIImage imageNamed:@"left_navItem"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"_left_navItem.png"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(showLeft:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    [rightButton setImage:[UIImage imageNamed:@"right_navItem.png"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"_right_navItem.png"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(showRight:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    // 初始化主页的数据表格
    UITableView *mainTable;
    // 分辨率差别导致表格的高度是不同的
    if(!iPhone5) {
        mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
    } else {
        mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 505)];
    }
    self.newsTable = mainTable;
    [self.newsTable setDataSource:self];
    [self.newsTable setDelegate:self];
    // 隐藏UITableView的默认分隔线
    [self.newsTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.newsTable setBackgroundView:rightBg];
    [self.view addSubview:self.newsTable];
        
    /* 初始化AwesomeMenu */
    UIImage *storyMenuItemImage = [UIImage imageNamed:@"bg-menuitem.png"];
    UIImage *storyMenuItemImagePressed = [UIImage imageNamed:@"bg-menuitem-highlighted.png"];
    
//    UIImage *starImage = [UIImage imageNamed:@"icon-star.png"];

    AwesomeMenuItem *starMenuItem1 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed:@"roundIcon1.png"] highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem2 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed:@"roundIcon2.png"] highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem3 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed:@"roundIcon3.png"] highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem4 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed:@"roundIcon4.png"] highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem5 = [[AwesomeMenuItem alloc] initWithImage:storyMenuItemImage highlightedImage:storyMenuItemImagePressed ContentImage:[UIImage imageNamed:@"roundIcon5.png"] highlightedContentImage:nil];
    
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, nil];
    
    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:self.view.bounds menus:menus];
	menu.menuWholeAngle = M_PI/2*1.25;// 5个分布在PI/2
    
	// customize menu
	/*
     menu.rotateAngle = M_PI/3;
     menu.menuWholeAngle = M_PI;
     menu.timeOffset = 0.2f;
     menu.farRadius = 180.0f;
     menu.endRadius = 100.0f;
     menu.nearRadius = 50.0f;
     */
    
    if(iPhone5)
        menu.startPoint = CGPointMake(30, 471.0);
    else
        menu.startPoint = CGPointMake(30, 391.0);
	
    menu.delegate = self;
    
    [self.view addSubview:menu];

    /* AwesomeMenu实例结束 */
    
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

#pragma mark TableView datas

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 16;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    if(indexPath.row == 0) {
        // 如果是第一行,则显示图片一张
        UIImageView *cover = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 119)];
        [cover setImage:[UIImage imageNamed:@"mainCover.png"]];
        [cell addSubview:cover];
    } else {
        // 如果不是第一行,加载该行的背景
        UIImageView *cellBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"indexCell_bg.png"]];
        [cell addSubview:cellBg];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(95, 13, 180, 33)];
        [label setFont:[UIFont fontWithName:@"Arial Rounded" size:32]];
        [label setText:@"明天下午召开家长会，请家长务必......"];
        [label setBackgroundColor:[UIColor clearColor]];
        [cell addSubview:label];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0)
        return 119;
    else
        return 57;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"1111111111111111111111------%d",indexPath.row);
}

#pragma mark -
/* AwesomeMenu */
- (void)AwesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx {
    
}
@end