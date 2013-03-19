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

    menuNames = [NSArray arrayWithObjects:@"全部", @"通知公告", @"家庭作业", @"考试成绩", @"在校表现", @"平安校园", @"订阅短信",@"课程表",nil];
    
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

//    cell = [self.tableMenu dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 34;
}
@end
