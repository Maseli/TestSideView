//
//  LQSetupViewController.m
//  TestSideView
//
//  Created by M on 13-3-14.
//  Copyright (c) 2013年 M. All rights reserved.
//

#import "LQSetupViewController.h"
#import "vars.h"

@interface LQSetupViewController () {
    NSArray *menuNames;
}

@end

@implementation LQSetupViewController

@synthesize menuTable = _menuTable;

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
    // 初始化菜单列表名称
    menuNames = [NSArray arrayWithObjects:@"班级留言",@"在线交流",@"教育动态",@"我的账号", nil];
    // 去掉UITableView的分隔线
    [self.menuTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* UITableView */

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
    
    [cell addSubview:label];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 34;
}
@end
