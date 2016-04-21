//
//  TimeNotification.h
//  工作计划管理软件
//
//  Created by 蒋豪 on 16/4/21.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeNotification : NSObject
+ (void)registerLocalNotification:(NSInteger)alertTime;
+ (void)cancelLocalNotificationWithKey:(NSString *)key;

@end
