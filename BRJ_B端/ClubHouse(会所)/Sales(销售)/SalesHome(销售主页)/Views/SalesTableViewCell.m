//
//  SalesTableViewCell.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/3.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "SalesTableViewCell.h"

@implementation SalesTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        NSInteger type = 1;
        if (type == 1) {
            [self customCellSectionTwo];
        }else 
        {
            [self customCellSectionThree];
        }
        
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customCellSectionOne];
    }
    return self;
}

- (void)customCellSectionOne
{
    //分隔线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 5, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:line];
    
    self.dateLab = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/2-60, 5, 100, 44)];
    self.dateLab.text = @"2017年8月";
    self.dateLab.font = [UIFont systemFontOfSize:18];
    self.dateLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.dateLab];
    
    self.dateBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.dateLab.frame)+3, 15, 20, 20)];
    [self.dateBtn setImage:[UIImage imageNamed:@"xiaoshou-riqisanjiao-icon"] forState:UIControlStateNormal];
    [self.dateBtn addTarget:self action:@selector(dateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.dateBtn];
    
}

- (void)customCellSectionTwo
{
    //分隔线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 5, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:line];
    
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 17, kWidth-24, 30)];
    self.titleLab.text = @"会所销售统计";
    [self addSubview:self.titleLab];
    
    NSArray *imageArr = @[@"red",@"blue",@"green",@"yellow"];
    NSArray *subTitleArr = @[@"目标金额",@"会所签单",@"我的签单",@"我的回款"];
    NSArray *numTitleArr = @[@"50,0000",@"60,0000",@"30,0000",@"20,0000"];
    for (NSInteger i = 0; i < 4; i++) {
        self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12+(kWidth/4)*i, CGRectGetMaxY(self.titleLab.frame)+20, 4, 4)];
        self.ImageView.image = [UIImage imageNamed:imageArr[i]];
        [self addSubview:self.ImageView];
        
        self.SubtitleLab = [[UILabel alloc]initWithFrame:CGRectMake(19+(kWidth/4)*i, CGRectGetMaxY(self.titleLab.frame)+13, kWidth/4, 21)];
        self.SubtitleLab.text = subTitleArr[i];
        self.SubtitleLab.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.SubtitleLab];
        
        self.numLab = [[UILabel alloc]initWithFrame:CGRectMake(19+(kWidth/4)*i, CGRectGetMaxY(self.SubtitleLab.frame)+5, kWidth/4, 21)];
        self.numLab.text = numTitleArr[i];
        self.numLab.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.numLab];
        
    }
    
}

- (void)customCellSectionThree{
    //分隔线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:line];
    
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 12, kWidth-24, 30)];
    self.titleLab.text = @"个人销售简报";
    [self addSubview:self.titleLab];
    
    //新增客户
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(self.titleLab.frame)+17, 16, 15)];
    self.ImageView.image = [UIImage imageNamed:@"xinzengkehu-icon"];
    [self addSubview:self.ImageView];
    
    self.SubtitleLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10, CGRectGetMaxY(self.titleLab.frame)+15, 100, 21)];
    self.SubtitleLab.text = @"新增销售客户:";
    self.SubtitleLab.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.SubtitleLab];
    
    self.numLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.SubtitleLab.frame)+5, CGRectGetMaxY(self.titleLab.frame)+16, 40, 21)];
    self.numLab.text = @"3个";
    self.numLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.numLab];
    
    //新增订单
    self.ImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(self.ImageView.frame)+17, 16, 15)];
    self.ImageView1.image = [UIImage imageNamed:@"xinzengdingdan-icon"];
    [self addSubview:self.ImageView1];
    
    self.SubTitleLab1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView1.frame)+10, CGRectGetMaxY(self.SubtitleLab.frame)+10, 70, 21)];
    self.SubTitleLab1.text = @"新增订单:";
    self.SubTitleLab1.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.SubTitleLab1];
    
    self.numLab1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.SubTitleLab1.frame)+5, CGRectGetMaxY(self.numLab.frame)+10, 40, 21)];
    self.numLab1.text = @"1个";
    self.numLab1.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.numLab1];
    
    //拜访客户
    self.ImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(self.ImageView1.frame)+17, 16, 15)];
    self.ImageView2.image = [UIImage imageNamed:@"baifangkehu-icon"];
    [self addSubview:self.ImageView2];
    
    self.SubTitleLab2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView2.frame)+10, CGRectGetMaxY(self.SubTitleLab1.frame)+10, 70, 21)];
    self.SubTitleLab2.text = @"拜访客户:";
    self.SubTitleLab2.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.SubTitleLab2];
    
    self.numLab2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.SubTitleLab2.frame)+5, CGRectGetMaxY(self.numLab1.frame)+10, 40, 21)];
    self.numLab2.text = @"3个";
    self.numLab2.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.numLab2];

    
    
//    NSArray *imageArr = @[@"xinzengkehu-icon",@"xinzengdingdan-icon",@"baifangkehu-icon"];
//    NSArray *subTitleArr = @[@"新增销售客户",@"新增订单",@"拜访客户"];
//    NSArray *numTitleArr = @[@"3个",@"1个",@"3个"];
//    
//    for (NSInteger i = 0; i < 4; i ++) {
//        self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, (CGRectGetMaxY(self.titleLab.frame)+13)*i, 16, 16)];
//        self.ImageView.image = [UIImage imageNamed:imageArr[i]];
//        [self addSubview:self.ImageView];
//        
//        self.SubtitleLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxY(self.ImageView.frame)+10, (CGRectGetMaxY(self.titleLab.frame)+13)*i, 80, 21)];
//        self.SubtitleLab.text = subTitleArr[i];
//        self.SubtitleLab.font = [UIFont systemFontOfSize:14];
//        [self addSubview:self.SubtitleLab];
//        
//        self.numLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxY(self.ImageView.frame)+10, (CGRectGetMaxY(self.titleLab.frame)+13)*i, 40, 21)];
//        self.numLab.text = numTitleArr[i];
//        self.numLab.font = [UIFont systemFontOfSize:14];
//        [self addSubview:self.numLab];
//    }
    
}
- (void)dateBtnClick{
    
    NSLog(@"点击选择日期");

}

- (void)awakeFromNib {
    [super awakeFromNib];
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
