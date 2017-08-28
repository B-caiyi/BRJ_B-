//
//  CustomLableWithImage.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/18.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "CustomLableWithImage.h"

@implementation CustomLableWithImage


+(UILabel *)makerLableWithFrame:(CGRect)frame WithImage:(NSString *)image WithTitle:(NSString *)title
{
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
    lab.text = title;
    lab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    lab.font = [UIFont systemFontOfSize:14];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(lab.frame)-10, 0, 7, 7)];
    imageView.image = [UIImage imageNamed:image];
    
    return lab;
}




@end
