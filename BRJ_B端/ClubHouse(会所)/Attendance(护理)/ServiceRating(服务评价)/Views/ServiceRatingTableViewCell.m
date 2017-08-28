//
//  ServiceRatingTableViewCell.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/21.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "ServiceRatingTableViewCell.h"

@implementation ServiceRatingTableViewCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customCellWithServiceRatingList];
    }
    return self;
}


- (void)configCellDataWithImage:(NSString *)image name:(NSString *)name content:(NSString *)content date:(NSString *)date
{
    self.ImageView.image = [UIImage imageNamed:image];
    self.nameLab.text = name;
    self.contLab.text = content;
    self.dateLab.text = date;
}

//评价列表
- (void)customCellWithServiceRatingList
{
    double imageSize = 50;
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, imageSize, imageSize)];
    self.ImageView.layer.masksToBounds = YES;
    self.ImageView.layer.cornerRadius = imageSize/2.0;
    self.ImageView.layer.borderWidth = 1.0f;
    self.ImageView.layer.borderColor = [UIColor colorWithHexString:@"#212F4D"].CGColor;
    [self addSubview:self.ImageView];
    
    self.nameLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10, 10, 150, 21)];
    self.nameLab.font = [UIFont systemFontOfSize:14];
    self.nameLab.textColor = [UIColor colorWithHexString:@"#19233A"];
    self.nameLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.nameLab];
    
    for (NSInteger i = 0; i<5; i++) {
        self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.selectBtn.frame = CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10+i*20, CGRectGetMaxY(self.nameLab.frame), 15, 15);
        
        [self.selectBtn setImage:[UIImage imageNamed:@"star_Highlighted"] forState:UIControlStateNormal];
        
//        [self.selectBtn setImage:[UIImage imageNamed:@"star_Highlighted"] forState:UIControlStateHighlighted];
        
        [self.selectBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.selectBtn];
    }
    self.contLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10, CGRectGetMaxY(self.selectBtn.frame), kWidth-100, 44)];
    self.contLab.textColor = [UIColor colorWithHexString:@"#8F96A6"];
    self.contLab.font = [UIFont systemFontOfSize:12];
    self.contLab.numberOfLines = 3;
    self.contLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.contLab];
    
    self.dateLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10, CGRectGetMaxY(self.contLab.frame), 150, 20)];
    self.dateLab.textAlignment = NSTextAlignmentLeft;
    self.dateLab.text = @"2017年8月21日";
    self.dateLab.textColor = [UIColor colorWithHexString:@"#8F96A6"];
    self.dateLab.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.dateLab];
    
    //分隔线
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.dateLab.frame)+9, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:self.line];
    
}

- (void)btnClicked{
    NSLog(@"好评!");
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
