//
//  LQMenuViewController.m
//  TestSideView
//
//  Created by M on 13-3-14.
//  Copyright (c) 2013年 M. All rights reserved.
//

#import "LQMenuViewController.h"

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
    menuNames = [NSArray arrayWithObjects:@"通知公告", @"家庭作业", @"考试成绩", @"在校表现", @"平安校园", @"订阅短信",@"课程表",nil];
    
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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = @"cellIdentifier";
    UITableViewCell *cell;
    cell = [[UITableViewCell alloc] init];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 2, 100, 28)];
    [label setText: [menuNames objectAtIndex:indexPath.row]];
    label.backgroundColor = [UIColor clearColor];
    
    if(indexPath.row == 0) {
        UIImage *bg = [UIImage imageNamed:@"menuCell_bg.png"];
        [cell addSubview:[[UIImageView alloc] initWithImage:bg]];
    }
    
    UIImage *separator = [UIImage imageNamed:@"menuCell_separator.png"];
    UIImageView *separatorView = [[UIImageView alloc] initWithFrame:CGRectMake(4.0f, 33.0, 132, 1)];
    separatorView.image = separator;
    [cell addSubview:separatorView];
    
    [cell addSubview:label];

//    cell = [self.tableMenu dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 34;
}
@end
