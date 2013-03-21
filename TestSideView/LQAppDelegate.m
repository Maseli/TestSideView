//
//  LQAppDelegate.m
//  TestSideView
//
//  Created by M on 13-3-13.
//  Copyright (c) 2013年 M. All rights reserved.
//

#import "LQAppDelegate.h"
#import "LQViewController.h"
#import "vars.h"

@implementation LQAppDelegate

@synthesize window = _window;
@synthesize revealSideViewController = _revealSideViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    LQViewController *main = [[LQViewController alloc] initWithNibName:@"View" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:main];
    
    self.revealSideViewController = [[PPRevealSideViewController alloc] initWithRootViewController:nav];
    
    [self.revealSideViewController setDirectionsToShowBounce:PPRevealSideDirectionNone];
    [self.revealSideViewController setPanInteractionsWhenClosed:PPRevealSideInteractionContentView | PPRevealSideInteractionNavigationBar];
    
    // 设置左边滑动的Offset值
    [self.revealSideViewController changeOffset:400.0f forDirection:PPRevealSideDirectionLeft];
    // 设置右边滑动的Offset值
    [self.revealSideViewController changeOffset:400.0f forDirection:PPRevealSideDirectionRight];

//    LQExampleViewController *adController = [[LQExampleViewController alloc] initWithNibName:@"LQExampleViewController" bundle:nil];
////    if(!iPhone5) {
////        [adController.view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"adExample_i5.png"]]];
////    } else {
//    
////        [adController.view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"adExample_i5@2x.PNG"]]];
////    }
//    adController.wantsFullScreenLayout = YES;
//    self.window.rootViewController = adController;
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
        
    self.window.rootViewController = self.revealSideViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
