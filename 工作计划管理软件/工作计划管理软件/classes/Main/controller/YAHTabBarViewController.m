//
//  YAHTabBarViewController.m
//  工作计划管理软件
//
//  Created by 杨瑷惠 on 16/1/31.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import "YAHTabBarViewController.h"
#import "YAHNavigationViewController.h"
#import "YAHOwnViewController.h"
#import "YAHLogoViewController.h"
#import "YAHTrendsViewController.h"
#import "YAHFindViewController.h"
#import "YAHTimeShowController.h"
#import "YAHLogoTableViewController.h"
#import "YAHGoal.h"
#import "HJTestViewController.h"

@interface YAHTabBarViewController ()
@property(nonatomic,strong)NSMutableArray *goallist;
@end

@implementation YAHTabBarViewController
-(NSMutableArray*)goallist
{
    if (!_goallist) {
        _goallist = [NSMutableArray array];
    }
    return _goallist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    // 1.初始化子控制器
    YAHTrendsViewController *trends = [[YAHTrendsViewController alloc] init];
    [self addChildVc:trends title:@"动态" image:@"tab_item_1_white" selectedImage:@"tab_item_1_grey"];
    
    YAHFindViewController *find = [[YAHFindViewController alloc] init];
    [self addChildVc:find title:@"发现" image:@"tab_item_2_white" selectedImage:@"tab_item_2_grey"];
    
    
    
    self.goallist = YAHGoallist;
    //YAHLog(@"%@",YAHGoallist);
    //YAHLog(@"%@",self.goallist);
    if (self.goallist){
        HJTestViewController *Logo = [[HJTestViewController alloc] init];
        Logo.tabBarItem.imageInsets = UIEdgeInsetsMake(5.0, 0, -5.0, 0);
        Logo.tabBarItem.image = [UIImage imageNamed:@"tab_item_5_white"];
        Logo.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_item_5_grey"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        YAHNavigationViewController  *nav = [[YAHNavigationViewController alloc] initWithRootViewController:Logo];
        [self addChildViewController:nav];

    }
    else
    {
        YAHLogoViewController *Logo = [[YAHLogoViewController alloc]init];
        Logo.tabBarItem.imageInsets = UIEdgeInsetsMake(5.0, 0, -5.0, 0);
        Logo.tabBarItem.image = [UIImage imageNamed:@"tab_item_5_white"];
        Logo.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_item_5_grey"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        YAHNavigationViewController  *nav = [[YAHNavigationViewController alloc] initWithRootViewController:Logo];
        [self addChildViewController:nav];


    }
    
    
    
    YAHTimeShowController *time = [[YAHTimeShowController alloc] init];
    [self addChildVc:time title:@"时间轴" image:@"tab_item_6_white" selectedImage:@"tab_item_6_grey"];
    
    YAHOwnViewController *own = [[YAHOwnViewController alloc] init];
    [self addChildVc:own title:@"个人" image:@"tab_item_4_white" selectedImage:@"tab_item_4_grey"];
    

}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    childVc.tabBarItem.title = title;
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = YAHColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = YAHColor(230, 89, 37);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];

    // 先给外面传进来的小控制器 包装 一个导航控制器
    YAHNavigationViewController  *nav = [[YAHNavigationViewController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}





@end
