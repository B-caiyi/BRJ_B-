//
//  DetailTableViewCell.m
//  BRJ_B端
//
//  Created by caiyi on 2017/8/8.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

//客户详情上半部分自定义cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier TitleOne:(NSString *)TitleOne TitleTwo:(NSString *)TitleTwo{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.detailLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 60, 20)];
        self.detailLab.text = TitleOne;
        self.detailLab.textColor = [UIColor colorWithHexString:@"#4D5971"];
        self.detailLab.font = [UIFont systemFontOfSize:14];
        self.detailLab.adjustsFontSizeToFitWidth = YES;
        
        self.detailLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.detailLab];
        
        self.detail = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.detailLab.frame)+8, 0, 180, 20)];
        self.detail.text = TitleTwo;
        self.detail.textColor = [UIColor colorWithHexString:@"#4D5971"];
        self.detail.font = [UIFont systemFontOfSize:14];
        self.detail.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.detail];

        
    }
    return self;

}

//销售记录,基本信息,订单信息cell配置
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier TitleOne:(NSString *)TitleOne TitleTwo:(NSString *)TitleTwo TitleThree:(NSString *)TitleThree type:(NSInteger)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (type == 1) {
            [self CustomCellWithSalesRecordWithTitleOne:TitleOne TitleTwo:TitleTwo TitleThree:TitleThree];
        }if (type == 2) {
            [self CustomCellWithBasicInformationWithTitleOne:TitleOne TitleTwo:TitleTwo TitleThree:@""];
        }if (type == 3) {
            [self CustomCellWithOrderInformationWithTitleOne:TitleOne TitleTwo:TitleTwo TitleThree:@""];
        }
    }
    return self;
}
//销售记录
- (void)CustomCellWithSalesRecordWithTitleOne:(NSString *)Title1 TitleTwo:(NSString *)Title2 TitleThree:(NSString *)Title3
{
    self.dataLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 5, kWidth/2, 20)];
    self.dataLab.text = Title1;
    self.dataLab.textColor = [UIColor colorWithHexString:@"#4D5971"];
    self.dataLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.dataLab];
    
    
    self.detailLab = [[UILabel alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(self.dataLab.frame), kWidth/2, 20)];
    self.detailLab.text = Title2;
    self.detailLab.font = [UIFont systemFontOfSize:14];
    self.detailLab.textColor = [UIColor colorWithHexString:@"#4D5971"];
    [self addSubview:self.detailLab];
    
    self.detail = [[UILabel alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(self.detailLab.frame), kWidth/2, 20)];
    self.detail.text = Title3;
    self.detail.font = [UIFont systemFontOfSize:14];
    self.detail.textColor = [UIColor colorWithHexString:@"#4D5971"];
    [self addSubview:self.detail];
    
}
//基本信息
- (void)CustomCellWithBasicInformationWithTitleOne:(NSString *)TitleOne TitleTwo:(NSString *)TitleTwo TitleThree:(NSString *)TitleThree{
    
    self.detailLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, kWidth/2, 20)];
    self.detailLab.text = TitleOne;
    self.detailLab.font = [UIFont systemFontOfSize:12];
    self.detailLab.textColor = [UIColor colorWithHexString:@"#A1A7B6"];
    [self addSubview:self.detailLab];
    
    self.detail = [[UILabel alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(self.detailLab.frame), kWidth/2, 20)];
    self.detail.text = TitleTwo;
    self.detail.font = [UIFont systemFontOfSize:14];
    self.detail.textColor = [UIColor colorWithHexString:@"#4D5971"];
    [self addSubview:self.detail];

}

//订单信息
- (void)CustomCellWithOrderInformationWithTitleOne:(NSString *)TitleOne TitleTwo:(NSString *)TitleTwo TitleThree:(NSString *)TitleThree{
    
    self.detailLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, kWidth/2, 20)];
    self.detailLab.text = TitleOne;
    self.detailLab.font = [UIFont systemFontOfSize:12];
    self.detailLab.textColor = [UIColor colorWithHexString:@"#A1A7B6"];
    [self addSubview:self.detailLab];
    
    self.detail = [[UILabel alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(self.detailLab.frame), kWidth/2, 20)];
    self.detail.text = TitleTwo;
    self.detail.font = [UIFont systemFontOfSize:14];
    self.detail.textColor = [UIColor colorWithHexString:@"#4D5971"];
    [self addSubview:self.detail];
    
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
