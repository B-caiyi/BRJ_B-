//
//  selectBtnView.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/24.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "selectBtnView.h"


@interface CustomButton : UIControl

@end


@implementation CustomButton

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title image:(NSString *)image font:(UIFont *)font{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height-20)];
        imgView.image = [UIImage imageNamed:image];
        [self addSubview:imgView];
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, height-15, width, height - width)];
        lbl.text = title;
        lbl.font = font;
        lbl.textColor = [UIColor colorWithHexString:@"#212F4D"];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.adjustsFontSizeToFitWidth = YES;
        [self addSubview:lbl];
    }
    return self;
}

@end


@interface selectBtnView()


@end


@implementation selectBtnView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    UIView *bgView = [[UIView alloc] initWithFrame:frame];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0.9;
    [self addSubview:bgView];
    
    
    return self;
}


- (void)initUI{
    
    CGFloat width = kWidth/2;
    CustomButton *selectRoomBtn = [[CustomButton alloc]initWithFrame:CGRectMake(width/3, width, width/2, width/2+20) Title:@"选房间" image:@"fuwupingjia_icon" font:[UIFont systemFontOfSize:13]];
    selectRoomBtn.tag = 124;
    selectRoomBtn.layer.cornerRadius = width/4;
    [selectRoomBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:selectRoomBtn];
    
    CustomButton *scanBtn = [[CustomButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(selectRoomBtn.frame)+10, width, width/2, width/2+20) Title:@"扫一扫" image:@"fuwupingjia_icon" font:[UIFont systemFontOfSize:13]];
    scanBtn.tag = 125;
    scanBtn.layer.cornerRadius = width/4;
    [scanBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:scanBtn];
}


- (void)btnClicked:(UIButton *)sender
{
    NSLog(@"点击选择按钮");
    _btnBlock(sender.tag-124);
    [self removeFromSuperview];
}


@end









