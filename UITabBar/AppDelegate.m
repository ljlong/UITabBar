//
//  AppDelegate.m
//  UITabBar
//
//  Created by lijunlong on 12-10-16.
//  Copyright (c) 2012年 lijunlong. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TowViewController.h"
#import "ThreeViewController.h"
#import "FiveViewController.h"
#import "FourViewController.h"
#import "SixViewController.h"


@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    OneViewController *oneControl = [[OneViewController alloc] init];
    TowViewController *twoControl = [[TowViewController alloc] init];
    ThreeViewController *threeControl = [[ThreeViewController alloc] init];
    FourViewController *fourControl = [[FourViewController alloc] init];
    FiveViewController *fiveControl = [[FiveViewController alloc] init];
    SixViewController *sixControl = [[SixViewController alloc] init];
    
    oneControl.tabBarItem.title = @"one";
    oneControl.tabBarItem.image = [UIImage imageNamed:@"icon_home.png"];
    
    threeControl.tabBarItem.title = @"three";
    threeControl.tabBarItem.image = [UIImage imageNamed:@"icon_home.png"];
    
    fourControl.tabBarItem.title = @"four";
    fourControl.tabBarItem.image = [UIImage imageNamed:@"icon_home.png"];
    
    fiveControl.tabBarItem.title = @"five";
    fiveControl.tabBarItem.image = [UIImage imageNamed:@"icon_home.png"];
    //UISearchDisplayController
    
    sixControl.tabBarItem.title = @"six";
    sixControl.tabBarItem.image = [UIImage imageNamed:@"icon_home.png"];
    
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:twoControl];//将第二个控制器放入导航控制器
    nav.tabBarItem.title = @"two";//设置的控制器是放入是数组中的
    nav.tabBarItem.image = [UIImage imageNamed:@"icon_meassage.png"];
    
    
    
    //twoControl.tabBarItem.title = @"two";
    NSArray *ary = [[NSArray alloc] initWithObjects:oneControl,nav,threeControl,fourControl,fiveControl,sixControl, nil];//tab提供的viewControl的容器
    UITabBarController *tavBarController = [[UITabBarController alloc] init];
    tavBarController.delegate = self;
    tavBarController.viewControllers = ary;//设置位显示容器
    self.window.rootViewController = tavBarController;
    [tavBarController release];
    [ary release];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

//点击对应选项卡时进入
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if (tabBarController.selectedIndex == 0) {//判断点选的索引标记
        int num = 0;
      num = [viewController.tabBarItem.badgeValue intValue] ;
        num++;
        viewController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",num];//设置标志值
    }
}
//点击编辑后，点击done的代理方法
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed{
    tabBarController.viewControllers = [NSArray arrayWithObjects:[tabBarController.viewControllers objectAtIndex:0],[tabBarController.viewControllers objectAtIndex:2],[tabBarController.viewControllers objectAtIndex:1],[tabBarController.viewControllers objectAtIndex:5],[tabBarController.viewControllers objectAtIndex:4], nil];
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
