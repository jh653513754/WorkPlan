//
//  HJTestViewController.m
//  分页控制器
//

//

#import "HJTestViewController.h"
#import "YAHLogoTableViewController.h"
#import "HJMiddleViewController.h"
#import "HJRightViewController.h"
#import "XLPopMenuViewModel.h"
#import "XLPopMenuViewSingleton.h"
#import "customViewController.h"
#import "AlwaysDoViewController.h"
#import "MakeSleepViewController.h"


@interface HJTestViewController ()
@property(nonatomic,strong)NSMutableArray *arr;
@end

@implementation HJTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationItem.title = @"分页控制器";
    UILabel *titleView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
    titleView.text = @"今日目标";
    titleView.font =[UIFont systemFontOfSize:14];
    titleView.textColor = [UIColor orangeColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:titleView];
    
    
    //设置导航栏右边的按钮
    UIBarButtonItem *editplan = [UIBarButtonItem itemWithTarget:self action:@selector(addGoal) image:@"icon_create_goal_blue"];
    UIBarButtonItem *activelist = [UIBarButtonItem itemWithTarget:self action:@selector(showlist) image:@"icons_activity_gray"];
    self.navigationItem.rightBarButtonItems =@[editplan,activelist];
    
    

    self.leftController = [[YAHLogoTableViewController alloc] init];
    self.leftMenuTitle = @"自定义计划";
    
    self.rightController = [[HJRightViewController alloc] init];
    self.rightMuneTitle = @"习惯性计划";
    
    self.middleController = [[HJMiddleViewController alloc] init];
    self.middleMuneTitle = @"早睡早起";
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

@end
