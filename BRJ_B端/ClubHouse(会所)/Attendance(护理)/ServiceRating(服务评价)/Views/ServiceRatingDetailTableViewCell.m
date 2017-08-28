//
//  ServiceRatingDetailTableViewCell.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/21.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "ServiceRatingDetailTableViewCell.h"

@implementation ServiceRatingDetailTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (type == 1) {
            [self customCellWithTypeOne];
        }else if (type == 2){
            [self customCellWithTypeTwo];
        }
    }
    return self;
}

- (void)configCellImage:(NSString *)image name:(NSString *)name roomNum:(NSString *)roomNum
{
    
    self.ImageView.image = [UIImage imageNamed:image];
    self.nameLab.text = name;
    self.roomNumLab.text = roomNum;
}

//type1的类型
- (void)customCellWithTypeOne
{
    //图片
    double imageSize = 50;
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 12, imageSize, imageSize)];
    self.ImageView.layer.masksToBounds = YES;
    self.ImageView.layer.cornerRadius = imageSize/2.0;
    self.ImageView.layer.borderWidth = 1.0f;
    self.ImageView.layer.borderColor = [UIColor colorWithHexString:@"#212F4D"].CGColor;
    [self addSubview:self.ImageView];
    
    self.nameLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+12, 10, 150, 21)];
    self.nameLab.font = [UIFont systemFontOfSize:14];
    self.nameLab.textColor = [UIColor colorWithHexString:@"#19233A"];
    self.nameLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.nameLab];
    
    //五角星
    for (NSInteger i = 0; i<5; i++) {
        self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.selectBtn.frame = CGRectMake(CGRectGetMaxX(self.ImageView.frame)+12+i*20, CGRectGetMaxY(self.nameLab.frame), 15, 15);
        
        [self.selectBtn setImage:[UIImage imageNamed:@"star_Highlighted"] forState:UIControlStateNormal];
        
        //        [self.selectBtn setImage:[UIImage imageNamed:@"star_Highlighted"] forState:UIControlStateHighlighted];
        
        [self.selectBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.selectBtn];
    }
    
    //房间号
    self.roomNumLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+12, CGRectGetMaxY(self.selectBtn.frame)-10, kWidth-100, 44)];
    self.roomNumLab.textColor = [UIColor colorWithHexString:@"#8F96A6"];
    self.roomNumLab.font = [UIFont systemFontOfSize:12];
    self.roomNumLab.numberOfLines = 3;
    self.roomNumLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.roomNumLab];

}


- (void)btnClicked{
    NSLog(@"好评!");
}

- (void)configImage:(NSString *)image
{
    self.ImageView.image = [UIImage imageNamed:image];
}

//type2的类型
- (void)customCellWithTypeTwo
{
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 10, kWidth-24, (kWidth-24)/1.78)];
    [self addSubview:self.ImageView];
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
