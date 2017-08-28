//
//  ChooseRoomFooterReusableView.m
//  BRJ_B端
//
//  Created by caiyi on 2017/8/21.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "ChooseRoomFooterReusableView.h"

@implementation ChooseRoomFooterReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customFooterViewImage1:nil title1:nil Image2:nil title2:nil Image3:nil title3:nil];
    }
    return self;
}

- (void)configFooterViewImage1:(NSString *)image1 title1:(NSString *)title1 Image2:(NSString *)image2 title2:(NSString *)title2 Image3:(NSString *)image title3:(NSString *)title3
{
    self.ImageView.image = [UIImage imageNamed:image1];
    self.titleLab.text = title1;
}

- (void)customFooterViewImage1:(NSString *)image1 title1:(NSString *)title1 Image2:(NSString *)image2 title2:(NSString *)title2 Image3:(NSString *)image title3:(NSString *)title3{
    
    //分隔线
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 3)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:self.line];
    
//    self.backgroundColor = [UIColor cyanColor];
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(90, 20, 5, 5)];
    self.ImageView.image = [UIImage imageNamed:@"gangruzhu_icon"];
    [self addSubview:self.ImageView];
    
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+3, 10, 40, 25)];
    self.titleLab.text = @"刚入住";
    self.titleLab.font = [UIFont systemFontOfSize:13];
    self.titleLab.textAlignment = NSTextAlignmentLeft;
    self.titleLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [self addSubview:self.titleLab];
    
    
    self.ImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLab.frame)+15, 20, 5, 5)];
    self.ImageView1.image = [UIImage imageNamed:@"youteshu_icon"];
    [self addSubview:self.ImageView1];
    
    self.titleLab1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView1.frame)+3, 10, 40, 25)];
    self.titleLab1.text = @"有特殊";
    self.titleLab1.font = [UIFont systemFontOfSize:13];
    self.titleLab1.textAlignment = NSTextAlignmentLeft;
    self.titleLab1.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [self addSubview:self.titleLab1];

    
    self.ImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLab1.frame)+15, 20, 5, 5)];
    self.ImageView2.image = [UIImage imageNamed:@"wuteshu_icon"];
    [self addSubview:self.ImageView2];
    
    self.titleLab2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView2.frame)+3, 10, 40, 25)];
    self.titleLab2.text = @"无特殊";
    self.titleLab2.font = [UIFont systemFontOfSize:13];
    self.titleLab2.textAlignment = NSTextAlignmentLeft;
    self.titleLab2.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [self addSubview:self.titleLab2];
    
    
    

    
    
}

@end

