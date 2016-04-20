//
//  YAHLogoViewController.m
//  工作计划管理软件
//
//  Created by 杨瑷惠 on 16/1/31.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import "YAHLogoViewController.h"
#import "YAHGoal.h"
#import "MJExtension.h"
#import "YAHLogoTableViewController.h"
#import "XLPopMenuViewModel.h"
#import "XLPopMenuViewSingleton.h"
#import "customViewController.h"
#import "AlwaysDoViewController.h"
#import "MakeSleepViewController.h"

@interface YAHLogoViewController ()
@property(nonatomic,strong)NSMutableArray *arr;
@end

@implementation YAHLogoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"今日目标" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
    //self.navigationItem.leftBarButtonItem.title = @""
    
     //设置导航栏右边的按钮
    UIBarButtonItem *editplan = [UIBarButtonItem itemWithTarget:self action:@selector(addGoal) image:@"icon_create_goal_blue"];
    UIBarButtonItem *activelist = [UIBarButtonItem itemWithTarget:self action:@selector(showlist) image:@"icons_activity_gray"];
    self.navigationItem.rightBarButtonItems =@[editplan,activelist];
    
    
}


-(void)addGoal
{
    //    [self.navigationController pushViewController:[[MyeditPlanViewController alloc]init] animated:YES];
    if (!_arr) {
        _arr = [[NSMutableArray alloc]init];
        for (int i = 0; i < [self titles].count; i++) {
            XLPopMenuViewModel *model = [[XLPopMenuViewModel alloc] init];
            model.image = [self images][i];
            model.title = [self titles][i];
            [_arr addObject:model];
            
        }
        
    }
    // 弹出框的宽度
    CGFloat menuViewWidth = 150;
    // 弹出框的左上角起点坐标
    CGPoint startPoint = CGPointMake([UIScreen mainScreen].bounds.size.width - menuViewWidth - 10, 64 + 12);
    
    [[XLPopMenuViewSingleton shareManager] creatPopMenuWithFrame:startPoint popMenuWidth:menuViewWidth popMenuItems:_arr action:^(NSInteger index) {
        
        [self chooseCreatePlan:(NSInteger) index];
        
    }];
    
}
/**
 *  选择创建的计划的类型并跳转到相应的计划创建界面
 */
-(void)chooseCreatePlan:(NSInteger) index
{
    if (index == 0) {
        MakeSleepViewController *MySleepVc = [[MakeSleepViewController alloc]init];
        [self.navigationController pushViewController:MySleepVc animated:YES];
    }
    else if (index == 1) {
        AlwaysDoViewController *AlwaysDoVc = [[AlwaysDoViewController alloc]init];
        [self.navigationController pushViewController:AlwaysDoVc animated:YES];
    }
    else if (index == 2) {
        customViewController *mycustomVc = [[customViewController alloc]init];
        [self.navigationController pushViewController:mycustomVc animated:YES];
    }
}

- (NSArray *)titles
{
    return @[@"早睡早起",
             @"习惯计划",
             @"自定义计划"];
}

- (NSArray *) images {
    return @[@"menu_QR",
             @"menu_addFri",
             @"menu_multichat"
             ];
}


-(void)showlist
{
    YAHLog(@"showlist");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
