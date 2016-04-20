//
//  YAHLogoTableViewCell.m
//  工作计划管理软件
//
//  Created by 杨瑷惠 on 16/4/11.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import "YAHLogoTableViewCell.h"
#import "YAHGoal.h"

@interface YAHLogoTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titieLable;

@property (weak, nonatomic) IBOutlet UILabel *detailLable;

@property (weak, nonatomic) IBOutlet UILabel *begintime;


@property (weak, nonatomic) IBOutlet UILabel *endtime;


@end


@implementation YAHLogoTableViewCell
-(void)awakeFromNib
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setGoal:(YAHGoal *)Goal
{
    _Goal = Goal;
    
    self.titieLable.text = Goal.G_name;
    self.detailLable.text = Goal.G_remarks;
    self.begintime.text = Goal.G_starttime;
    self.endtime.text = Goal.G_endtime;
}
/**
 *  可以在这个方法中监听cell的选中和取消选中
 *
 */
-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
 
    self.backgroundColor = selected?YAHColor(217, 248, 207):[UIColor whiteColor];
    
}

@end
