//
//  ChooseRoomCollectionViewCell.m
//  BRJ_B端
//
//  Created by caiyi on 2017/8/19.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "ChooseRoomCollectionViewCell.h"

@implementation ChooseRoomCollectionViewCell



- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
        [self customCellWitnHomeInformation];
    }
    return self;
}


- (void)customCellWitnHomeInformation
{
    self.homeNumLab = [[UILabel alloc]initWithFrame:CGRectMake( 0, 10, 60, 25)];
    self.homeNumLab.text = @"8201";
    self.homeNumLab.font = [UIFont systemFontOfSize:16];
    self.homeNumLab.textAlignment = NSTextAlignmentCenter;
    self.homeNumLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [self addSubview:self.homeNumLab];
    
    self.nameLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.homeNumLab.frame), 60, 25)];
    self.nameLab.textColor = [UIColor colorWithHexString:@"#8F96A6"];
    self.nameLab.text = @"赵丽颖";
    self.nameLab.textAlignment = NSTextAlignmentCenter;
    self.nameLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.nameLab];
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
