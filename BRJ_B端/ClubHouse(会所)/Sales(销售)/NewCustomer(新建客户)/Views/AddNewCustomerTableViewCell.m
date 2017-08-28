//
//  AddNewCustomerTableViewCell.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/7.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "AddNewCustomerTableViewCell.h"


@implementation AddNewCustomerTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (type == 1) {
            [self initCellCustomWithButton];
        }if(type == 2){
            [self initCellCustomWithButtonTwo];
        }
    }
    return self;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title placeholder:(NSString *)holderTitle type:(NSInteger)type{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (type == 1) {
            [self initCellCustomWithOneTitle:title placeholder:holderTitle];
        }if(type == 2){
            [self initCellCustomWithTwoTitle:title placeholder:holderTitle];
        }
        
    }
    return self;
}

- (void)initCellCustomWithOneTitle:(NSString *)title placeholder:(NSString *)holderTitle
{
    
    
    self.commonLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 90, 44)];
    self.commonLab.text = title;
    self.commonLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.commonLab.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.commonLab];
    
    self.ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.commonLab.frame), 7, 3, 30)];
    self.ImageView.image = [UIImage imageNamed:@"Line_xuxian"];
    [self addSubview:self.ImageView];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10, 0, kWidth/2+30, 44)];
    self.textField.placeholder = holderTitle;
    [self.textField setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    [self addSubview:self.textField];
    
    self.clearBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.textField.frame)+5, 12, 20, 20)];
    [self.clearBtn setImage:[UIImage imageNamed:@"qingkongshuru-icon"] forState:UIControlStateNormal];
    [self addSubview:self.clearBtn];
    //分隔线
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textField.frame)+1, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:self.line];
}

- (void)initCellCustomWithTwoTitle:(NSString *)title placeholder:(NSString *)holderTitle
{
    //分隔线
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:self.line];
    
    self.commonLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 90, 60)];
    self.commonLab.text = title;
    self.commonLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.commonLab.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.commonLab];
    
    self.ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.commonLab.frame), 10, 3, 40)];
    self.ImageView.image = [UIImage imageNamed:@"Line_xuxian"];
    [self addSubview:self.ImageView];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10, 0, kWidth/2+30, 60)];
    self.textField.placeholder = holderTitle;
    [self.textField setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    [self addSubview:self.textField];
    
    self.clearBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.textField.frame)+5, 20, 20, 20)];
    [self.clearBtn setImage:[UIImage imageNamed:@"qingkongshuru-icon"] forState:UIControlStateNormal];
    
    [self addSubview:self.clearBtn];
}

//新建客户之--客户意向cell配置
- (void)initCellCustomWithButton
{
    UIView *behindView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 44)];
    behindView.backgroundColor = [UIColor whiteColor];
    [self addSubview:behindView];
   
    
    self.intentLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 90, 44)];
    self.intentLab.text = @"客户意向";
    self.intentLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.intentLab.font = [UIFont systemFontOfSize:16];
    self.intentLab.textAlignment = NSTextAlignmentLeft;
    [behindView addSubview:self.intentLab];
    
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.intentLab.frame), 7, 3, 30)];
    self.ImageView.image = [UIImage imageNamed:@"Line_xuxian"];
    [self addSubview:self.ImageView];
    
    NSArray *titleArr = @[@"意向强烈",@"意向一般",@"意向微弱"];
    for (NSInteger i = 0; i<3; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10+kWidth/5*i, 7, kWidth/5-5, 30)];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"#159695"] forState:UIControlStateNormal];
        btn.tag = 100+i;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.layer.cornerRadius = 8.0;
        btn.layer.borderColor = [UIColor colorWithHexString:@"#159695"].CGColor;
        btn.layer.borderWidth = 1.0f;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
    }
    //分隔线
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.intentLab.frame), kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [behindView addSubview:self.line];
    
}

- (void)initCellCustomWithButtonTwo
{
    UIView *behindView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 60)];
    behindView.backgroundColor = [UIColor whiteColor];
    [self addSubview:behindView];
    //分隔线
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [behindView addSubview:self.line];
    
    self.intentLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 90, 60)];
    self.intentLab.text = @"行动类型";
    self.intentLab.font = [UIFont systemFontOfSize:16];
    self.intentLab.textAlignment = NSTextAlignmentLeft;
    [behindView addSubview:self.intentLab];
    
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.intentLab.frame), 10, 3, 40)];
    self.ImageView.image = [UIImage imageNamed:@"Line_xuxian"];
    [self addSubview:self.ImageView];
    
    NSArray *titleArr = @[@"参观会所",@"试吃月子",@"上门拜访"];
    for (NSInteger i = 0; i<3; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10+kWidth/5*i, 15, kWidth/5-5, 30)];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"#159695"] forState:UIControlStateNormal];
        btn.tag = 100+i;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.layer.cornerRadius = 8.0;
        btn.layer.borderColor = [UIColor colorWithHexString:@"#159695"].CGColor;
        btn.layer.borderWidth = 1.0f;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
}

- (void)btnClicked:(UIButton *)btn
{
    if (btn.tag == 100) {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor colorWithHexString:@"#159695"];
    }else if (btn.tag == 101){
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor colorWithHexString:@"#159695"];
    }else if (btn.tag == 102){
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor colorWithHexString:@"#159695"];
    }
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
