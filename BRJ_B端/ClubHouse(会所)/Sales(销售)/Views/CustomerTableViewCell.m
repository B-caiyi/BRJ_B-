//
//  CustomerTableViewCell.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/7.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "CustomerTableViewCell.h"

@implementation CustomerTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCustomCell];
    }
    return self;
}

- (void)initCustomCell
{
    
    self.nameLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 12, 60, 30)];
    self.nameLab.text = @"黄家驹"; //后台返回
    self.nameLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.nameLab.font = [UIFont systemFontOfSize:16];
    self.nameLab.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.nameLab];
    
    self.intentLab = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.nameLab.frame), 60, 21)];
    self.intentLab.text = @"意向一般"; //后台返回
    self.intentLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.intentLab.font = [UIFont systemFontOfSize:12];
    self.intentLab.adjustsFontSizeToFitWidth = YES;
    self.intentLab.textColor = [UIColor colorWithHexString:@"#34415C"];
    [self addSubview:self.intentLab];
    
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLab.frame)+5, 17, 3, 48)];
    self.ImageView.image = [UIImage imageNamed:@"Line_xuxian"];
    [self addSubview:self.ImageView];
    
    
    self.BornLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10, 10, 50, 21)];
    self.BornLab.text = @"预产期:";
    self.BornLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.BornLab.font = [UIFont systemFontOfSize:14];
    self.BornLab.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.BornLab];
    
    self.BornData = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.BornLab.frame)+5, 10, kWidth-40-80, 21)];
    self.BornData.text = @"2017.08.08";//后台返回
    self.BornData.font = [UIFont systemFontOfSize:14];
    self.BornData.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.BornData];
    
    self.LatestVisit = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10, CGRectGetMaxY(self.BornLab.frame), kWidth/2, 40)];
    self.LatestVisit.text = @"最新拜访: 需要家人陪同来参观才能做决定,8月10号可以再来";//后台返回再拼接
     self.LatestVisit .textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.LatestVisit.font = [UIFont systemFontOfSize:14];
    self.LatestVisit.numberOfLines = 0;
    self.LatestVisit.adjustsFontSizeToFitWidth = YES;
    [self addSubview:self.LatestVisit];
    
    //分隔线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.LatestVisit.frame)+5, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:line];
    
    //    self.VisitDescription = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.LatestVisit.frame)+5, CGRectGetMaxY(self.BornData.frame)+5, kWidth/2, 40)];
    //    self.VisitDescription.text = @"需要家人陪同来参观才能做决定,8月10号可以再来";
    //    self.VisitDescription.font = [UIFont systemFontOfSize:14];
    //    self.VisitDescription.adjustsFontSizeToFitWidth = YES;
    //    self.VisitDescription.numberOfLines = 0;
    //    [self addSubview:self.VisitDescription];
    
    
    self.phoneBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.LatestVisit.frame)+30, 30, 20, 20)];
    [self.phoneBtn setImage:[UIImage imageNamed:@"dianhua-icon"] forState:UIControlStateNormal];
    [self.phoneBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.phoneBtn];
}

- (void)btnClick{
    NSLog(@"拨打电话");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
