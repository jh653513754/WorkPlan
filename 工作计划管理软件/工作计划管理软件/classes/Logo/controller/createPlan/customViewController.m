//
//  customViewController.m
//  工作计划管理软件
//
//  Created by 杨瑷惠 on 16/4/11.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import "customViewController.h"
#import "FDAlertView.h"
#import "RBCustomDatePickerView.h"
#import "TagView.h"
#import "YAHGoal.h"
#import "TimeNotification.h"
@interface customViewController ()<sendTheValueDelegate,UITextFieldDelegate,UITextViewDelegate>

//时间开始的label
@property (weak, nonatomic) IBOutlet UITextField *timerAlert;
//时间开始的btn（透明的）
@property (weak, nonatomic) IBOutlet UIButton *timerbtn;
//时间结束的label
@property (weak, nonatomic) IBOutlet UIButton *endtimebtn;
//时间结束的label
@property (weak, nonatomic) IBOutlet UITextField *endtimefield;
//当前的一个textfiled
@property (strong,nonatomic)UITextField *currentfield;
//装标签的view
@property (weak, nonatomic) IBOutlet UIView *tagView;
//备注的内容
@property (weak, nonatomic) IBOutlet UITextField *remarksfield;
//正文内容
@property (weak, nonatomic) IBOutlet UITextView *myPlantextview;

@property(nonatomic,copy)NSString *string;
@end

@implementation customViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"自定义计划";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    
    self.view.backgroundColor = YAHColor(224, 224, 224);
    
    //添加标签的内容
    NSMutableArray *arr = [[NSMutableArray alloc]initWithObjects:@"工作", @"生活",@"学习",@"其他",nil];
    TagView *tag = [[TagView alloc]initWithArray:arr];
//    tag.delegate = self;
    [self.tagView addSubview:tag];
    
    //监听事件设定的开始时间和结束时间
    [self.timerbtn  addTarget:self action:@selector(timerbtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.endtimebtn addTarget:self action:@selector(endtimebtnClick) forControlEvents:UIControlEventTouchUpInside];
    
//    YAHLog(@"%@,%@",self.remarksfield.text,self.myPlantextField.text);
    self.remarksfield.delegate = self;
    self.myPlantextview.delegate = self;
    
    
    
}

-(void)showtags
{
    for (UIView *view in self.tagView.subviews)
    {
        if ([view isKindOfClass:[UIView class]]) {
            for (UIButton *btn in view.subviews) {
                if (btn.selected ==YES)
                {
                    self.string = btn.titleLabel.text;
                    YAHLog(@"%@",self.string);
                }
            }
        }
    }
}
-(void)endtimebtnClick
{
    FDAlertView *alert = [[FDAlertView alloc] init];
    
    RBCustomDatePickerView * contentView=[[RBCustomDatePickerView alloc]init];
    contentView.delegate=self;
    contentView.frame = CGRectMake(0, 0, 320, 300);
    alert.contentView = contentView;
    [alert show];
    self.currentfield = self.endtimefield;
}

-(void)timerbtnClick
{
    FDAlertView *alert = [[FDAlertView alloc] init];
    
    RBCustomDatePickerView * contentView=[[RBCustomDatePickerView alloc]init];
    contentView.delegate=self;
    contentView.frame = CGRectMake(0, 0, 320, 300);
    alert.contentView = contentView;
    [alert show];
    self.currentfield= self.timerAlert;
    
}

//UITextFieldDelegate代理方法

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.remarksfield.text = textField.text;
    YAHLog(@"%@",self.remarksfield.text);
}

//UITextViewDelegate代理方法
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    self.myPlantextview.text = textView.text;
    YAHLog(@"%@",self.myPlantextview.text);
    return YES;
}
/**
 *  点击了保存按钮后要做的事情
 */
-(void)save
{
    
    //获取应用程序沙盒的Documents目录
    NSString *paths=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    //得到完整的文件名
    NSString *filename=[paths stringByAppendingPathComponent:@"test.plist"];
   // NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filename];
    
    NSArray *temp = [[NSArray alloc] initWithContentsOfFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)objectAtIndex:0]stringByAppendingPathComponent:@"test.plist"]];
    NSMutableArray *data=[NSMutableArray arrayWithArray:temp];
    //YAHLog(@"%@",data);
    //添加内容
    [data addObject:[NSDictionary dictionaryWithObjectsAndKeys:self.myPlantextview.text,@"G_name",self.remarksfield.text,@"G_remarks",self.timerAlert.text,@"G_starttime",self.endtimefield.text,@"G_endtime",self.string,@"G_tag", nil]];
    if ([self.myPlantextview.text isEqualToString:@""]||[self.timerAlert.text isEqualToString:@""]||[self.endtimefield.text isEqualToString:@""]) {
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
    YAHLog(@"%@",paths);
    [self showtags];
    
    [TimeNotification registerLocalNotification:10];
    
    
    
}

/**
 *  sendTheValueDelegate代理方法
 */
-(void)getTimeToValue:(NSString *)theTimeStr
{
    //NSLog(@"我获取到时间了，时间是===%@",theTimeStr);
    self.currentfield.text = theTimeStr;
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
