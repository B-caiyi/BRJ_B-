//
//  OrderDetailTableViewCell.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/15.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "OrderDetailTableViewCell.h"

@implementation OrderDetailTableViewCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier TitleOne:(NSString *)TitleOne TitleTwo:(NSString *)TitleTwo type:(NSInteger)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (type == 1) {
            [self customCellWithDetailInformationWithTiele:TitleOne TitleTwo:TitleTwo];
        }else{
            
        }
    }
    return self;
}

- (void)customCellWithDetailInformationWithTiele:(NSString *)Title1 TitleTwo:(NSString *)Title2{
    
    //分隔线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:line];
    
    //title label
    self.detailLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, kWidth/2, 20)];
    self.detailLab.text = Title1;
    self.detailLab.font = [UIFont systemFontOfSize:12];
    self.detailLab.textColor = [UIColor colorWithHexString:@"#A1A7B6"];
    [self addSubview:self.detailLab];
    //详细信息
    self.detail = [[UILabel alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(self.detailLab.frame), kWidth/2, 20)];
    self.detail.text = Title2;
    self.detail.font = [UIFont systemFontOfSize:14];
    self.detail.textColor = [UIColor colorWithHexString:@"#4D5971"];
    [self addSubview:self.detail];
    
   

}

//自定义图片cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier Image:(NSString *)image
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customCellWithImage:image];
    }
    return self;
}


- (void)customCellWithImage:(NSString *)image
{
    UIImageView *ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 0, kWidth-24, 174)];
    ImageView.image = [UIImage imageNamed:image];
    [self addSubview:ImageView];
    
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
