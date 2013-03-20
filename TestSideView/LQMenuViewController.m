//
//  LQMenuViewController.m
//  TestSideView
//
//  Created by M on 13-3-14.
//  Copyright (c) 2013年 M. All rights reserved.
//

#import "LQMenuViewController.h"
#import "vars.h"

@interface LQMenuViewController () {
    NSArray *menuNames;
}

@end

@implementation LQMenuViewController

@synthesize tableMenu = _tableMenu;

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

    UIImageView *banjizhuye = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 33)];
    [banjizhuye setImage:[UIImage imageNamed:@"banjizhuye.png"]];
    [self.view addSubview:banjizhuye];
    
    // 初始化每个班级主页的总按钮
    UIButton *banji_btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 33, 320, 44)];
    [banji_btn1 setImage:[UIImage imageNamed:@"homePage_bg"] forState:UIControlStateNormal];
    UILabel *banji_name1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 150, 24)];
    [banji_name1 setText:@"六年一班主页"];
    [banji_name1 setTextColor:[UIColor whiteColor]];
    [banji_name1 setBackgroundColor:[UIColor clearColor]];
    [banji_name1 setFont:[UIFont fontWithName:[[UIFont fontNamesForFamilyName:@"Heiti SC"] objectAtIndex:1] size:20]];
    [banji_btn1 addSubview:banji_name1];
    [self.view addSubview:banji_btn1];
    
    UIButton *teacherPage1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 77, 320, 44)];
    [teacherPage1 setImage:[UIImage imageNamed:@"teacherPage_bg.png"] forState:UIControlStateNormal];
    [self.view addSubview:teacherPage1];
    
    UIButton *teacherPage2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 121, 320, 44)];
    [teacherPage2 setImage:[UIImage imageNamed:@"teacherPage_bg.png"] forState:UIControlStateNormal];
    [self.view addSubview:teacherPage2];

// 废弃代码
//    menuNames = [NSArray arrayWithObjects:@"全部", @"通知公告", @"家庭作业", @"考试成绩", @"在校表现", @"平安校园", @"订阅短信",@"课程表",nil];
    
    // 隐藏UITableView的默认分隔线
    [self.tableMenu setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menuNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell = [[UITableViewCell alloc] init];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(48, 2, 100, 28)];
    [label setText: [menuNames objectAtIndex:indexPath.row]];
    label.backgroundColor = [UIColor clearColor];
    
    // 被选中的行标记为不同的背景
    if(indexPath.row == 0) {
        UIImage *bg = [UIImage imageNamed:@"menuCell_bg.png"];
        [cell addSubview:[[UIImageView alloc] initWithImage:bg]];
    } else {
        // 绘制行分隔线,被选中的行不使用
        NSLog(@"准备绘制分隔线,这个是第%d",indexPath.row);
        if(indexPath.row != [menuNames count]-1) {
            UIImage *separator = [UIImage imageNamed:@"menuCell_separator.png"];
            UIImageView *separatorView = [[UIImageView alloc] initWithFrame:CGRectMake(4.0f, 33.0, 132, 1)];
            separatorView.image = separator;
            [cell addSubview:separatorView];
        }
    }
    
    // label左侧的图标
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 24, 24)];
    [icon setImage:[UIImage imageNamed:@"cell_icon.png"]];
    [cell addSubview:icon];
    [cell addSubview:label];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 34;
}
@end
