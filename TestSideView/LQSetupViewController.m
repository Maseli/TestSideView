//
//  LQSetupViewController.m
//  TestSideView
//
//  Created by M on 13-3-14.
//  Copyright (c) 2013年 M. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "LQSetupViewController.h"
#import "vars.h"
#import "LQMessageViewController.h"

@interface LQSetupViewController () {
    NSArray *menuNames;
}

@end

@implementation LQSetupViewController

@synthesize menuTable = _menuTable;
@synthesize searchText = _searchText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    
    // 初始化顶部搜索栏目
    UIImageView * topSearchImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 43)];
    [topSearchImg setImage:[UIImage imageNamed:@"rightTopSearch.png"]];
    [self.view addSubview:topSearchImg];
    
    // 初始化搜索文本框,配合背景调整好位置和效果
    UITextField *searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(70, 10, 185, 30)];
    [self setSearchText:searchTextField];
    [self.searchText setFont:[UIFont fontWithName:@"Arial Rounded" size:25]];
    [self.searchText setTextColor:[UIColor whiteColor]];
    [self.searchText setBackgroundColor:[UIColor clearColor]];
    [self.searchText setBorderStyle:UITextBorderStyleNone];
    [self.searchText setPlaceholder:@"搜索"];
    [self.view addSubview:self.searchText];
    
    // 初始化右上角的输入按钮
    UIButton *right_inputBtn = [[UIButton alloc] initWithFrame:CGRectMake(270, 7, 44, 29)];
    [right_inputBtn setImage:[UIImage imageNamed:@"right_inputBtn.png"] forState:UIControlStateNormal];
    [right_inputBtn setImage:[UIImage imageNamed:@"_right_inputBtn.png"] forState:UIControlStateHighlighted];
    // TODO 添加按钮事件
    [right_inputBtn addTarget:self action:@selector(testBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:right_inputBtn];
    
    // 我的账号按钮
    UIButton *myUsername = [[UIButton alloc] initWithFrame:CGRectMake(0, 43, 320, 43)];
    [myUsername setBackgroundColor:[UIColor clearColor]];
    [myUsername setImage:[UIImage imageNamed:@"myUsername_btn.png"] forState:UIControlStateNormal];
    [myUsername addTarget:self action:@selector(myUsername:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myUsername];
    
    
    // 初始化菜单列表名称
    menuNames = [NSArray arrayWithObjects:@"班级留言",@"在线交流",@"教育动态",@"我的账号", nil];
    // 去掉UITableView的分隔线
    [self.menuTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // 初始化班级成员一横条
    UIImageView *banjichengyuan = [[UIImageView alloc] initWithFrame:CGRectMake(0, 86, 320, 33)];
    [banjichengyuan setImage:[UIImage imageNamed:@"banjichengyuan.png"]];
    [self.view addSubview:banjichengyuan];
    
    // 初始化刷新按钮
    UIButton *refreshBtn = [[UIButton alloc] initWithFrame:CGRectMake(297, 95, 12, 15)];
    [refreshBtn setImage:[UIImage imageNamed:@"refresh.png"] forState:UIControlStateNormal];
    [refreshBtn addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:refreshBtn];
    
    // 初始化班级按钮s
    UIButton *banji_btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 119, 320, 44)];
    [banji_btn1 setImage:[UIImage imageNamed:@"banji_bg.png"] forState:UIControlStateNormal];
    UILabel *btnName1 = [[UILabel alloc] initWithFrame:CGRectMake(48, 6, 150, 30)];
    [btnName1 setText:@"六年一班成员"];
//    [btnName1 setFont:[UIFont fontWithName:@"Heiti SC" size:14]];
    [btnName1 setFont:[UIFont fontWithName:[[UIFont fontNamesForFamilyName:@"Heiti SC"] objectAtIndex:1] size:16]];
    [btnName1 setBackgroundColor:[UIColor clearColor]];
    [btnName1 setTextColor:[UIColor whiteColor]];
    [banji_btn1 addSubview:btnName1];
    
    // 初始化班级设置按钮
    UIButton *setupUIButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 10, 23, 23)];
    [setupUIButton setImage:[UIImage imageNamed:@"setup.png"] forState:UIControlStateNormal];
    [setupUIButton addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [banji_btn1 addSubview:setupUIButton];
    
    [self.view addSubview:banji_btn1];
    
    
    UIButton *banji_btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 163, 320, 44)];
    [banji_btn2 setImage:[UIImage imageNamed:@"banji_bg.png"] forState:UIControlStateNormal];
    UILabel *btnName2 = [[UILabel alloc] initWithFrame:CGRectMake(48, 6, 150, 30)];
    [btnName2 setText:@"六年四班成员  "];
    [btnName2 setFont:[UIFont fontWithName:[[UIFont fontNamesForFamilyName:@"Heiti SC"] objectAtIndex:1] size:16]];
    [btnName2 setBackgroundColor:[UIColor clearColor]];
    [btnName2 setTextColor:[UIColor whiteColor]];
    [banji_btn2 addSubview:btnName2];
    [self.view addSubview:banji_btn2];    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) testBtn:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"测试" message:@"跳转聊天测试" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

#pragma mark tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menuNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(OFFSETRIGHT+15, 2, 100, 28)];
    [label setText:[menuNames objectAtIndex:indexPath.row]];
    
    // 如果不是最末一个菜单标题,就添加一个分隔线
    if(indexPath.row != [menuNames count]-1) {
        UIImageView *separator = [[UIImageView alloc] initWithFrame:CGRectMake(OFFSETRIGHT+10, 33, 90, 1)];
        [separator setImage:[UIImage imageNamed:@"menuCell_separator.png"]];
        [cell addSubview:separator];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell addSubview:label];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 34;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LQMessageViewController *messageVC = [[LQMessageViewController alloc] init];
//    UINavigationController *nav = [self.revealSideViewController rootViewController];
//    [self.revealSideViewController popViewControllerAnimated:YES];
//    [nav pushViewController:messageVC animated:YES];

}

#pragma mark -

- (void)startAnimation:(UIButton *)button {
    button.userInteractionEnabled = NO;
    
    CABasicAnimation* rotationAnimation;
    // transform.rotation.z是垂直与平面的轴即z轴
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];///* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    // 转6圈
    rotationAnimation.repeatCount = 6;
    
    [button.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    button.userInteractionEnabled = YES;
}

- (void) myUsername:(UIButton *)button {
    LQMessageViewController *mCon = [[LQMessageViewController alloc] initWithNibName:@"LQMessageViewController" bundle:nil];
//    [self.revealSideViewController popViewControllerWithNewCenterController:mCon animated:YES];
    [mCon setCuntomTitle:@"我的账号"];
    mCon.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:mCon animated:YES];
    
}

@end
