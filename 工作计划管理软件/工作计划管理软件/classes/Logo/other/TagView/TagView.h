//
//  TagView.h
//  自定义标签
//
//  Created by danggui on 16/3/23.
//  Copyright © 2016年 danggui. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TagView;

//@protocol TagViewDelegate <NSObject>
//@required
//- (void)clickedButton:(UIButton*)btn str:(NSString*)str;
//@end





@interface TagView : UIView
{
    float btnX;
    float btnY;
    float btnW;
    float btnH;
    float btnLines;
    NSMutableArray *btnArr;
    NSMutableArray *viewArr;
    NSMutableArray *tagsArr;
}

- (id)initWithArray:(NSMutableArray *)array;

@end