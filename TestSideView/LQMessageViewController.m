//
//  LQMessageViewController.m
//  TestSideView
//
//  Created by M on 13-3-16.
//  Copyright (c) 2013年 M. All rights reserved.
//

#import "LQViewController.h"
#import "LQMessageViewController.h"

@interface LQMessageViewController () {
    UILabel *uilabel;
}

@end

@implementation LQMessageViewController

@synthesize cuntomTitle = _cuntomTitle;

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
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [navBar setBackgroundImage:[UIImage imageNamed:@"banner.png"]forBarMetrics:UIControlStateNormal];
    
    UINavigationItem *items = [[UINavigationItem alloc] init];
    // 设置UINavigationBar的items
    [navBar setItems:[NSArray arrayWithObject:items]];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(backToMainView:)];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(backToMainView:)];
    
    items.leftBarButtonItem = leftBtn;
    items.rightBarButtonItem = rightBtn;

    [items setTitle:self.cuntomTitle];
    
    [self.view addSubview:navBar];
    
    //首先定义UITextView
    UITextView *textView = [[UITextView alloc] init];
    textView.font = [UIFont systemFontOfSize:14];
    textView.frame =CGRectMake(66, 68, 200, 60);
//    textView.autoresizingMask = UIViewAuto11122resizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    textView.backgroundColor = [UIColor clearColor];
    textView.delegate = self;
    [self.view addSubview:textView];
    
    uilabel = [[UILabel alloc] init];
    //其次在UITextView上面覆盖个UILable,UILable设置为全局变量。
    uilabel.frame =CGRectMake(74, 76, 100, 20);
    [uilabel setFont:[UIFont fontWithName:[[UIFont fontNamesForFamilyName:@"Heiti SC"] objectAtIndex:1] size:14]];
    uilabel.text = @"请填写审批意见...";
    uilabel.enabled = NO;//lable必须设置为不可用
    uilabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:uilabel];
    
    [textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

-(void) backToMainView:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

-(void) saveMessage:(id)sender {
    // 保存信息到首页
    LQViewController *mainVC = [[LQViewController alloc] initWithNibName:@"LQViewController" bundle:nil];
    
    [self dismissModalViewControllerAnimated:YES];
}


-(void) textViewDidChange:(UITextView *)textView {
//    self.examineText =  textView.text;
    if (textView.text.length == 0) {
        uilabel.text = @"请填写审批意见...";
    }else{
        uilabel.text = @"";
    }
}


@end
