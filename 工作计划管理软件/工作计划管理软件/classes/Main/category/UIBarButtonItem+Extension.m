//
//  UIBarButtonItem+Extension.m
//  
//
//  Created by 杨瑷惠 on 16/1/2.
//  Copyright © 2016年 杨瑷惠. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的那个方法
 *  @param image     图片
 *
 *
 *  @return 创建完的item
 */
+(UIBarButtonItem*)itemWithTarget:(id)target action:(SEL)action image:(NSString*)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    //设置尺寸
    btn.size = btn.currentBackgroundImage.size;
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
