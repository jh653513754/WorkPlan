//
//  TagView.m
//  自定义标签
//
//  Created by danggui on 16/3/23.
//  Copyright © 2016年 danggui. All rights reserved.
//

#import "TagView.h"

@implementation TagView

- (id)initWithArray:(NSMutableArray *)arr
{
    self = [super init];
    if (self) {
//        [self setUI];//
        //NSLog(@"ok");
        //NSLog(@"%@",arr);
        btnX = 10.0;
        btnY = 10.0;
        btnW = 0;
        btnH = 20.0;
        btnLines = 0;
        btnArr = [[NSMutableArray alloc]init];
        viewArr = [[NSMutableArray alloc]init];
        tagsArr = [[NSMutableArray alloc]initWithArray:arr];
        [self addTags:arr];
    }
    return self;
}

- (void)addTags:(NSMutableArray *)arr
{
    for (int i = 0; i<arr.count; i++) {
        CGSize size = [[arr objectAtIndex:i] sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]}];
        CGSize statuseStrSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
        //NSLog(@"%f",statuseStrSize.width);
        
        btnW =  statuseStrSize.width+30;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
        [btn setTitle:[arr objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:1.000 green:0.704 blue:0.247 alpha:1.000] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        
        UIButton *btn1 = [[UIButton alloc]init];
        if (btnArr.count !=0) {
            btn1 = [btnArr objectAtIndex:i-1];
           // NSLog(@"%f,%f,%f",btn1.frame.origin.x,btn1.frame.size.width,320.0);
            if (btn1.frame.origin.x +btn1.frame.size.width +statuseStrSize.width+30 > 320.0-20) {
                btnLines = btnLines +1;
                btnY =  10*(btnLines+1)+btnH*btnLines;
                btnX = 0.0;
            }
            else
            {
                //                btnY =  btnY+btnH*btnLines;
                btnX = btn1.frame.origin.x +btn1.frame.size.width +5;
            }
            
        }
        else
        {
            btnX = 0 ;
            btnY = 10;
        }
        
        CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor orangeColor] CGColor]);
        CGContextFillRect(context, rect);
        UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        
        
        btn.tag = i;
        btn.frame = CGRectMake(10+btnX, btnY, btnW, btnH);
        
        [btn setBackgroundImage:theImage forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(someButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//        btn.enabled = NO;
        [btn.layer setBorderWidth:0.5]; //边框宽度
        [btn.layer setBorderColor:[UIColor colorWithRed:0.564 green:0.817 blue:1.000 alpha:1.000].CGColor];//边框颜

        /**
         *  以下代码是设置标签边框为虚线
         */
//        CGFloat viewWidth = btnW;
//        CGFloat viewHeight = btnH;
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10+btnX, btnY, btnW, btnH)];
//        view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0];
//        //        view.layer.cornerRadius = CGRectGetWidth(view.bounds)/2;
//        CAShapeLayer *borderLayer = [CAShapeLayer layer];
//        borderLayer.bounds = CGRectMake(10, 10, viewWidth, viewHeight);
//        borderLayer.position = CGPointMake(CGRectGetMidX(view.bounds), CGRectGetMidY(view.bounds));
//        
//        //    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
//        borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds cornerRadius:0].CGPath;
//        borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
//        //虚线边框
//        borderLayer.lineDashPattern = @[@9, @3];
//        //实线边框
//        //    borderLayer.lineDashPattern = nil;
//        borderLayer.fillColor = [UIColor clearColor].CGColor;
//        borderLayer.strokeColor = [UIColor grayColor].CGColor;
//        [view.layer addSublayer:borderLayer];
//        [self addSubview:view];
        /**
         *  以上代码是设置标签边框为虚线
         */
        
        [self addSubview:btn];
        [btnArr addObject:btn];
        [self setFrame:CGRectMake(0, 0, 320,  btnY+btnH+10)];

    }
        
}
- (void)someButtonClicked:(UIButton *)btn
{
    for (UIButton *otherbtn in self.subviews) {
        otherbtn.selected=NO;
    }
    
    btn.selected=!btn.selected;
    
}
@end
