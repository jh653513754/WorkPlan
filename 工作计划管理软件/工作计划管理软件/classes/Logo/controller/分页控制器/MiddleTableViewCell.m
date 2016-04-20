//
//  MiddleTableViewCell.m
//  工作计划管理软件
//
//  Created by 杨瑷惠 on 16/4/18.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import "MiddleTableViewCell.h"
#import "SleepPlan.h"

@interface MiddleTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *GetupTime;
@property (weak, nonatomic) IBOutlet UILabel *SleepTime;
@property (weak, nonatomic) IBOutlet UILabel *Des;

@end

@implementation MiddleTableViewCell
-(void)setSleepPlan:(SleepPlan *)sleepPlan
{
    _sleepPlan = sleepPlan;
    self.Name.text = sleepPlan.SleepName;
    self.SleepTime.text = sleepPlan.SleepStrTime;
    self.GetupTime.text = sleepPlan.SleepEndTime;
    self.Des.text = sleepPlan.SleepDes;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
