//
//  YAHLogoTableViewCell.h
//  工作计划管理软件
//
//  Created by 杨瑷惠 on 16/4/11.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YAHGoal;

@interface YAHLogoTableViewCell : UITableViewCell

/**
 *  计划模型
 */
@property(nonatomic,strong) YAHGoal *Goal;

@end
