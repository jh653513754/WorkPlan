//
//  AppDelegate.m
//  工作计划管理软件
//
//  Created by 杨瑷惠 on 16/1/31.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import "YAHAppDelegate.h"
#import "YAHRegisterViewController.h"
#import "YAHTabBarViewController.h"
#import "TimeNotification.h"

@interface YAHAppDelegate ()

@end

@implementation YAHAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //1.创建窗口
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    //2.设置根控制器
   // self.window.rootViewController = [[YAHRegisterViewController alloc]init];
    
    //默认选中主页的TabBarItem
    YAHTabBarViewController *tabvc= [[YAHTabBarViewController alloc]init];
    tabvc.selectedIndex = 2;
    self.window.rootViewController = tabvc;
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// 本地通知回调函数，当应用程序在前台时调用
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"noti:%@",notification);
    
    // 这里真实需要处理交互的地方
    // 获取通知所带的数据
    NSString *notMess = [notification.userInfo objectForKey:@"key"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"本地通知(前台)" message:notMess delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil];
    [alert show];
    
    // 更新显示的徽章个数
    NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
    badge--;
    badge = badge >= 0 ? badge : 0;
    [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
    
    // 在不需要再推送时，可以取消推送
    [TimeNotification cancelLocalNotificationWithKey:@"key"];
}

@end
