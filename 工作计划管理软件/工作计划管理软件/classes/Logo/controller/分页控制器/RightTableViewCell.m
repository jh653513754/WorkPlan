//
//  RightTableViewCell.m
//  工作计划管理软件
//
//  Created by 杨瑷惠 on 16/4/18.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import "RightTableViewCell.h"
#import "AlwaysDoGoal.h"

@interface RightTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *startTime;
@property (weak, nonatomic) IBOutlet UILabel *endTime;
@property (weak, nonatomic) IBOutlet UILabel *Dsc;
@end

@implementation RightTableViewCell

-(void)setDoGoal:(AlwaysDoGoal *)DoGoal
{
    _DoGoal = DoGoal;
    self.Name.text = DoGoal.AlwaysName;
    self.startTime.text =DoGoal.awakeTime;
    self.endTime.text = DoGoal.endTime;
    self.Dsc.text = DoGoal.AlwaysDes;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
