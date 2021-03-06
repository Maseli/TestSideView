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

@property (strong, nonatomic) UITableView *newsTable;

@property (strong, nonatomic) NSString *pageTitle;

- (void)setHomePageDataSet:(int)idx title:(NSString *)title showMenu:(BOOL)isShowMenu;

- (void)addNewMessage:(int)idx message:(NSString *)message;
@end
