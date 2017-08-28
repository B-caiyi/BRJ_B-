//
//  BabyFooterCollectionReusableView.m
//  BRJ_B端
//
//  Created by caiyi on 2017/8/25.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "BabyFooterCollectionReusableView.h"

@implementation BabyFooterCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customFooterView];
    }
    return self;
}


- (void)customFooterView
{
    
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, kWidth-24, 30)];
    self.titleLab.text = @"添加备注信息";
    self.titleLab.font = [UIFont systemFontOfSize:12];
    self.titleLab.textColor = [UIColor colorWithHexString:@"#8F96A6"];
    [self addSubview:self.titleLab];
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(self.titleLab.frame), kWidth-24, 90)];
    self.textView.backgroundColor = [UIColor colorWithHexString:@"#FAFAFA"];
    [self addSubview:self.textView];
    
    self.saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(self.textView.frame)+20, kWidth-24, 50)];
    self.saveBtn.tag = 101;
    [self.saveBtn setImage:[UIImage imageNamed:@"tijiaojilu_icon"] forState:UIControlStateNormal];
    [self.saveBtn addTarget:self action:@selector(saveBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.saveBtn];
}

- (void)saveBtnClicked
{
    NSLog(@"点击提交");
    self.saveBtnBlock(self.saveBtn.tag-101);
}


@end
