//
//  LQMenuViewController.m
//  TestSideView
//
//  Created by M on 13-3-14.
//  Copyright (c) 2013年 M. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "LQMenuViewController.h"
#import "LQViewController.h"
#import "LQHomePageViewController.h"
#import "vars.h"

@interface LQMenuViewController () {
    NSArray *menuNames;
    NSMutableDictionary *classNames;
}

@end

@implementation LQMenuViewController

@synthesize tableMenu = _tableMenu;
@synthesize mainVC = _mainVC;

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
    
    // 初始化班级集合
    classNames = [NSMutableDictionary dictionaryWithCapacity:4];
    
    // 初始化这个view的背景,都是木纹图案
    UIImageView *rightBg;
    if(!iPhone5) {
        rightBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right_bg.png"]];
    } else {
        rightBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right_bg_i5"]];
    }
    [self.view addSubview:rightBg];

    // 初始化页首的班级主页横条
    UIImageView *banjizhuye = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 33)];
    [banjizhuye setImage:[UIImage imageNamed:@"banjizhuye.png"]];
    [self.view addSubview:banjizhuye];
    
    // 初始化班级主页横条刷新按钮
    UIButton *refreshBtn = [[UIButton alloc] initWithFrame:CGRectMake(269, 9, 12, 15)];
    [refreshBtn setImage:[UIImage imageNamed:@"refresh.png"] forState:UIControlStateNormal];
    [refreshBtn addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:refreshBtn];
    
    // 初始化每个班级主页的总按钮
    UIButton *banji_btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 33, 320, 44)];
    [banji_btn1 setImage:[UIImage imageNamed:@"homePage_bg"] forState:UIControlStateNormal];
    UILabel *banji_name1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 150, 24)];
    [banji_name1 setText:@"六年一班主页"];
    [banji_name1 setTextColor:[UIColor whiteColor]];
    [banji_name1 setBackgroundColor:[UIColor clearColor]];
    [banji_name1 setFont:[UIFont fontWithName:[[UIFont fontNamesForFamilyName:@"Heiti SC"] objectAtIndex:1] size:20]];
    [banji_btn1 addSubview:banji_name1];
    [banji_btn1 addTarget:self action:@selector(showClassHomePage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:banji_btn1];
    
    [classNames setObject:banji_btn1 forKey:@"六年一班"];
    
    UIButton *teacherPage1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 77, 320, 44)];
    [teacherPage1 setImage:[UIImage imageNamed:@"teacherPage_bg.png"] forState:UIControlStateNormal];
    [self.view addSubview:teacherPage1];
    
    UIButton *teacherPage2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 121, 320, 44)];
    [teacherPage2 setImage:[UIImage imageNamed:@"teacherPage_bg.png"] forState:UIControlStateNormal];
    [self.view addSubview:teacherPage2];

    // 初始化每个班级主页的总按钮
    UIButton *banji_btn4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 165, 320, 44)];
    [banji_btn4 setImage:[UIImage imageNamed:@"homePage_bg"] forState:UIControlStateNormal];
    UILabel *banji_name4 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 150, 24)];
    [banji_name4 setText:@"六年四班主页"];
    [banji_name4 setTextColor:[UIColor whiteColor]];
    [banji_name4 setBackgroundColor:[UIColor clearColor]];
    [banji_name4 setFont:[UIFont fontWithName:[[UIFont fontNamesForFamilyName:@"Heiti SC"] objectAtIndex:1] size:20]];
    [banji_btn4 addSubview:banji_name4];
    [banji_btn4 addTarget:self action:@selector(showClassHomePage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:banji_btn4];

    [classNames setObject:banji_btn4 forKey:@"六年四班"];
    
    UIButton *teacherPage4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 209, 320, 44)];
    [teacherPage4 setImage:[UIImage imageNamed:@"teacherPage_bg.png"] forState:UIControlStateNormal];
    [self.view addSubview:teacherPage4];
    
    UIButton *teacherPage5 = [[UIButton alloc] initWithFrame:CGRectMake(0, 253, 320, 44)];
    [teacherPage5 setImage:[UIImage imageNamed:@"teacherPage_bg.png"] forState:UIControlStateNormal];
    [self.view addSubview:teacherPage5];
    
    
    
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

- (void) showClassHomePage:(id)sender {
//    LQHomePageViewController *messageController = [[LQHomePageViewController alloc] initWithNibName:@"LQMessageViewController" bundle:nil];
//    [self.navigationController pushViewController:messageController animated:YES];
    NSEnumerator * enumerator = [classNames keyEnumerator];
    id object;
    while(object = [enumerator nextObject])
    {
        //在这里我们得到的是键值，可以通过（1）得到，也可以通过这里得到的键值来得到它对应的value值
        //通过NSDictionary对象的objectForKey方法来得到
        //其实这里定义objectValue这个对象可以直接用NSObject，因为我们已经知道它的类型了，id在不知道类型的情况下使用
        id objectValue = [classNames objectForKey:object];
        if(objectValue == sender) {
            [self.mainVC setHomePageDataSet:0 title:(NSString *)object showMenu:YES];
            [self.mainVC setPageTitle:(NSString *)object];
            NSLog(@"键值为：%@",object);
        }
        
    }  
    [self.revealSideViewController popViewControllerAnimated:YES];
//    [self.mainVC showHomePage:self];
}


@end
