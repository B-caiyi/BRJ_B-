//
//  OrderProductButton.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/17.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "OrderProductButton.h"

@implementation OrderProductButton

+ (UIButton *)makeButtonWithFrame:(CGRect)frame TitleOne:(NSString *)titleOne TitleTwo:(NSString *)titleTwo
{
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    btn.layer.cornerRadius = 8.0;
    btn.layer.borderColor = [UIColor colorWithHexString:@"#159695"].CGColor;
    btn.layer.borderWidth = 1.0f;
    UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, 73, 21)];
    lab1.text = titleOne;
    lab1.textAlignment = NSTextAlignmentCenter;
    lab1.textColor = [UIColor colorWithHexString:@"#159695"];
    
    
    
    return btn;
}



@end
