//
//  customListBtn.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/7.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "customListBtn.h"

@implementation customListBtn

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(NSString *)image target:(id)taget action:(SEL)action
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *btn = [[UIButton alloc]initWithFrame:frame];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"#212F4D"] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn addTarget:taget action:action forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame)-135, 15, 15, 15)];
        imageView.image = [UIImage imageNamed:image];
        [self addSubview:imageView];
    }
    return self;
}

//- (void)btnclick
//{
//    NSLog(@"点击事件");
//}

@end
