//
//  MakeSleepViewController.m
//  工作计划管理软件
//
//  Created by 杨瑷惠 on 16/4/17.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import "MakeSleepViewController.h"

@interface MakeSleepViewController ()
@property (weak, nonatomic) IBOutlet UITextField *Name;
@property (weak, nonatomic) IBOutlet UITextField *SleepTime;

@property (weak, nonatomic) IBOutlet UITextField *GetupTime;
@property (weak, nonatomic) IBOutlet UITextField *SleepDes;


@end

@implementation MakeSleepViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"早睡早起";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];

}


-(void)save
{
    //获取应用程序沙盒的Documents目录
    NSString *paths=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    //得到完整的文件名
    NSString *filename=[paths stringByAppendingPathComponent:@"SleepPlan.plist"];
    // NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filename];
    
    NSArray *temp = [[NSArray alloc] initWithContentsOfFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)objectAtIndex:0]stringByAppendingPathComponent:@"SleepPlan.plist"]];
    NSMutableArray *data=[NSMutableArray arrayWithArray:temp];
    YAHLog(@"%@",data);
    //添加内容
    [data addObject:[NSDictionary dictionaryWithObjectsAndKeys:self.Name.text,@"SleepName",self.SleepTime.text,@"SleepStrTime",self.GetupTime.text,@"SleepEndTime",self.SleepDes.text,@"SleepDes", nil]];
    if ([self.Name.text isEqualToString:@""]||[self.SleepTime.text isEqualToString:@""]||[self.SleepDes.text isEqualToString:@""]) {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"失败" message:@"数据编辑不完整！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alter show];
    }
    //输入写入
    else
    {
        UIAlertView *alter =[[UIAlertView alloc]initWithTitle:@"成功" message:@"数据保存成功！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alter show];
        [data writeToFile:filename atomically:YES];
    }
    //那怎么证明我的数据写入了呢？读出来看看
    NSMutableArray *data1 = [[NSMutableArray alloc] initWithContentsOfFile:filename];
    YAHLog(@"=======%@", data1);
    //YAHLog(@"%@",paths);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
