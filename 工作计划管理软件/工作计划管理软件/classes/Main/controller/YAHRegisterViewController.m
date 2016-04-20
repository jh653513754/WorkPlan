//
//  YAHRegisterViewController.m
//  工作计划管理软件
//
//  Created by 杨瑷惠 on 16/1/31.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import "YAHRegisterViewController.h"
#import "AFNetworking.h"
@interface YAHRegisterViewController ()
- (IBAction)registerAction;
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@end

@implementation YAHRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*http://127.0.0.1:8080/llsApp/UserRegistServlet?userName=lulu&password=jianghao123*/
- (IBAction)registerAction
{
    NSString *Username = self.UserName.text;
    NSString *password = self.password.text;
    //NSLog(@"%@,%@",Username,password);
    // 1.请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    // 2.拼接请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userName"] = Username;
    params[@"password"] = password;
    
    // 3.发送请求
//    [mgr GET:@"http://127.0.0.1:8080/llsApp/UserRegistServlet" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"请求成功,%@",responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"请求失败,%@",error);
//    }];
    [mgr GET:@"http://127.0.0.1:8080/llsApp/UserRegistServlet" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
         NSLog(@"请求成功,%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"请求失败,%@",error);
    }];
}
@end
