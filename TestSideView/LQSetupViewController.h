//
//  LQSetupViewController.h
//  TestSideView
//
//  Created by M on 13-3-14.
//  Copyright (c) 2013年 M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQViewController.h"

@interface LQSetupViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *menuTable;

@property (strong, nonatomic) UITextField *searchText;

@end
