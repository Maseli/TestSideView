//
//  LQMenuViewController.h
//  TestSideView
//
//  Created by M on 13-3-14.
//  Copyright (c) 2013年 M. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LQViewController;

@interface LQMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableMenu;

@property (strong, nonatomic) LQViewController *mainVC;

@end
