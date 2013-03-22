//
//  LQViewController.h
//  TestSideView
//
//  Created by M on 13-3-13.
//  Copyright (c) 2013年 M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AwesomeMenu.h"

@interface LQViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, AwesomeMenuDelegate>

@property (strong, nonatomic) IBOutlet UITableView *newsTable;

@property (strong, nonatomic) NSString *pageTitle;

// 废弃
- (void)showHomePage:(id)sender;

@end
