//
//  RecordDocumentsTableViewCell.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/25.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "RecordDocumentsTableViewCell.h"

@implementation RecordDocumentsTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger )type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (type == 1) {
            [self customCellWithTypeOne];
        }else if (type == 2){
            [self customCellWithTypeTwo];
        }else if (type == 3){
            [self customCellWithTypeThree];
        }else if (type == 4){
        
        }
    }
    return self;
}
//第一种类型的cell 配置信息(title 输入框 输入框背景色 后缀lab)
- (void)customCellWithTypeOne
{
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 60)];
    [self addSubview:self.bgView];
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 15, 80, 30)];
    self.titleLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.titleLab.font = [UIFont systemFontOfSize:14];
    [self.bgView addSubview:self.titleLab];
    
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLab.frame)+5, 15, 3, 30)];
    self.ImageView.image = [UIImage imageNamed:@"shuxuxian_icon"];
    [self.bgView addSubview:self.ImageView];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+5, 15, kWidth-150, 30)];
    [self.bgView addSubview:self.textField];
    
    self.suffixLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.textField.frame)+5, 15, 50, 30)];
    self.suffixLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.suffixLab.font = [UIFont systemFontOfSize:14];
    [self.bgView addSubview:self.suffixLab];
   
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 59, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:self.line];
    
}

//第二种类型的cell 配置信息(title 两个输入框 输入框背提示文字 后缀lab)
- (void)customCellWithTypeTwo
{
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 60)];
    [self addSubview:self.bgView];
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 15, 80, 30)];
    self.titleLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.titleLab.font = [UIFont systemFontOfSize:14];
    [self.bgView addSubview:self.titleLab];
    
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLab.frame)+5, 15, 3, 30)];
    self.ImageView.image = [UIImage imageNamed:@"shuxuxian_icon"];
    [self.bgView addSubview:self.ImageView];
 
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+5, 15, (kWidth-150)/2-30, 30)];
    [self.bgView addSubview:self.textField];
    
    self.middleLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.textField.frame), 15, 30, 30)];
    self.middleLab.text = @"-";
    self.middleLab.textColor = [UIColor colorWithHexString:@"#8F96A6"];
    self.middleLab.textAlignment = NSTextAlignmentCenter;
    self.middleLab.font = [UIFont systemFontOfSize:14];
    [self.bgView addSubview:self.middleLab];
    
    self.secondTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.middleLab.frame), 15, (kWidth-150)/2-30, 30)];

    [self.bgView addSubview:self.secondTextField];
    
    self.suffixLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.secondTextField.frame)+5, 15, 50, 30)];
    self.suffixLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.suffixLab.font = [UIFont systemFontOfSize:14];
    [self.bgView addSubview:self.suffixLab];
    
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 59, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:self.line];

}
//第三种类型的cell 配置信息(title 输入框 输入框背提示内容)
- (void)customCellWithTypeThree
{
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 60)];
    [self addSubview:self.bgView];
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 15, 80, 30)];
    self.titleLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.titleLab.font = [UIFont systemFontOfSize:14];
    [self.bgView addSubview:self.titleLab];
    
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLab.frame)+5, 15, 3, 30)];
    self.ImageView.image = [UIImage imageNamed:@"shuxuxian_icon"];
    [self.bgView addSubview:self.ImageView];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+5, 15, kWidth-150, 30)];
    [self.bgView addSubview:self.textField];
    
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 59, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:self.line];
    
}

//第一种类型的cell 配置信息(title 输入框 输入框背提示内容 后缀lab)
- (void)configCellTypeOneWithTitle:(NSString *)title placeholder:(NSString *)placeholder suffixTitle:(NSString *)suffixtitle
{
    self.titleLab.text = title;
    self.textField.placeholder = placeholder;
    [self.textField setValue:[UIFont boldSystemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    self.textField.backgroundColor = [UIColor colorWithHexString:@"#FAFAFA"];
    self.suffixLab.text = suffixtitle;
}
//第二种类型的cell 配置信息(title 两个输入框 输入框背提示文字 后缀lab)
- (void)configCellTypeTwoWithTitle:(NSString *)title firstPlaceholder:(NSString *)firstPlaceholder secondPlaceholder:(NSString *)secondPlaceholder suffixTitle:(NSString *)suffixTitle
{
    self.titleLab.text = title;
    self.textField.placeholder = firstPlaceholder;
    [self.textField setValue:[UIFont boldSystemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    self.textField.backgroundColor = [UIColor colorWithHexString:@"#FAFAFA"];
    
    self.secondTextField.placeholder = secondPlaceholder;
    [self.secondTextField setValue:[UIFont boldSystemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    self.secondTextField.backgroundColor = [UIColor colorWithHexString:@"#FAFAFA"];
    self.suffixLab.text = suffixTitle;
}
//第三种类型的cell 配置信息(title 输入框 输入框背提示内容)
- (void)configCellTypeThreeWithTitle:(NSString *)title placeholder:(NSString *)placeholder
{
    self.titleLab.text = title;
    self.textField.placeholder = placeholder;
    [self.textField setValue:[UIFont boldSystemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
    self.textField.backgroundColor = [UIColor colorWithHexString:@"#FAFAFA"];
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
