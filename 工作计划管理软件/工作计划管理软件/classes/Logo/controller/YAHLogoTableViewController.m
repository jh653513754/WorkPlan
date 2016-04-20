//
//  YAHLogoTableViewController.m
//  工作计划管理软件
//
//  Created by 杨瑷惠 on 16/4/7.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import "YAHLogoTableViewController.h"
#import "YAHLogoTableViewCell.h"
#import "YAHGoal.h"



@interface YAHLogoTableViewController ()
@property(nonatomic,strong)NSArray *Goallist;
@property(nonatomic,strong)NSMutableArray *arr;
@end

@implementation YAHLogoTableViewController
-(NSArray*)Goallist
{
    if (!_Goallist) {
        _Goallist = [NSArray array];
    }
    return _Goallist;
}

-(void)viewWillAppear:(BOOL)animated
{
    //////之所以在viewDidAppear中来设置某个cell被初始选中，目的是要在uitableview加载出来以后再做
    [super viewWillAppear:animated];
    //刷新数据列表
    self.Goallist=YAHGoallist;
    [self.tableView reloadData];
    //////这里假设你初始要选中的是第一行
    NSIndexPath *indexPath =[NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
  

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YAHLogoTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = 100;
    self.view.backgroundColor = YAHGlobalBg;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.Goallist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YAHLogoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.Goal = self.Goallist[indexPath.row];
    return cell;
}


@end
