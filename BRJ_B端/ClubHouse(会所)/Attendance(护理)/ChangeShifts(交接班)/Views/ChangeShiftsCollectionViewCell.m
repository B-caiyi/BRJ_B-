//
//  ChangeShiftsCollectionViewCell.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/22.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "ChangeShiftsCollectionViewCell.h"

@implementation ChangeShiftsCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.nameBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        [self.nameBtn setTitleColor:[UIColor colorWithHexString:@"#159695"] forState:UIControlStateNormal];
        self.nameBtn.backgroundColor = [UIColor whiteColor];
        self.nameBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        self.nameBtn.layer.cornerRadius = 8.0;
        self.nameBtn.layer.borderWidth = 1.0f;
        self.nameBtn.layer.borderColor = [UIColor colorWithHexString:@"#159695"].CGColor;
//        [self.nameBtn addTarget:self action:@selector(nameBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.nameBtn];
        
    }
    return self;
}

- (void)configItemWithName:(NSString *)name
{
    [self.nameBtn setTitle:name forState:UIControlStateNormal];
}

//- (void)nameBtnClicked
//{
//    NSLog(@"选择交接人");
//}

@end
