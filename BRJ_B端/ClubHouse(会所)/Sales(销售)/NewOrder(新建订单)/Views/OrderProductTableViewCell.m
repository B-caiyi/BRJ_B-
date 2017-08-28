//
//  OrderProductTableViewCell.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/17.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "OrderProductTableViewCell.h"

@implementation OrderProductTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger)type
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (type == 1) {
            [self initCellCustomWithButton];
        }if(type == 2){
            
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title placeholder:(NSString *)holderTitle DetailTitle:(NSString *)detailTitle image:(NSString *)image type:(NSInteger)type{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (type == 1) {
            [self initCellCustomWithOneTitle:title placeholder:holderTitle image:image];
        }if(type == 2){
            [self initCellSectionTreeWithTitle:title placeholder:holderTitle DetailTitle:detailTitle image:image];
        }
        
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier Title:(NSString *)title ProductTitle:(NSString *)productTitle NumTitle:(NSString *)numTitle
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCellSectionTwoCellTitle:title ProductTitle:productTitle NumTitle:numTitle];
    }
    return self;
}

#pragma mark ---第一个分区
//带输入框的cell
- (void)initCellCustomWithOneTitle:(NSString *)title placeholder:(NSString *)holderTitle image:(NSString *)image
{
    //分隔线
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textField.frame)+1, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:self.line];
    //标题
    self.commonLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 90, 60)];
    self.commonLab.text = title;
    self.commonLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.commonLab.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.commonLab];
    //竖线--分隔线
    self.ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.commonLab.frame), 16.5, 3, 27)];
    self.ImageView.image = [UIImage imageNamed:@"xuxian_line"];
    [self addSubview:self.ImageView];
    //输入框
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10, 0, kWidth/2+30, 60)];
    self.textField.placeholder = holderTitle;
    [self.textField setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    [self addSubview:self.textField];
    //清除按钮
    self.clearBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.textField.frame)+5, 20, 20, 20)];
    [self.clearBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self addSubview:self.clearBtn];
    //分隔线
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textField.frame)+1, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:self.line];
}

//新建订单--选择天数
- (void)initCellCustomWithButton
{
    UIView *behindView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 60)];
    behindView.backgroundColor = [UIColor whiteColor];
    [self addSubview:behindView];
    
    
    self.intentLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 90, 60)];
    self.intentLab.text = @"入住天数";
    self.intentLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.intentLab.font = [UIFont systemFontOfSize:16];
    self.intentLab.textAlignment = NSTextAlignmentLeft;
    [behindView addSubview:self.intentLab];
    
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.intentLab.frame), 16.5, 3, 27)];
    self.ImageView.image = [UIImage imageNamed:@"xuxian_line"];
    [self addSubview:self.ImageView];
    
    NSArray *titleArr = @[@"28天",@"56天",@"84天"];
    for (NSInteger i = 0; i<3; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10+62*i, 18.5, 50, 23)];
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
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [behindView addSubview:self.line];
    
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


#pragma mark ---第二个分区
- (void)initCellSectionTwoCellTitle:(NSString *)title ProductTitle:(NSString *)productTitle NumTitle:(NSString *)numTitle
{
    
    //标题
    self.commonLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 90, 60)];
    self.commonLab.text = title;
    self.commonLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.commonLab.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.commonLab];
    
    
    //竖线--分隔线
    self.ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.commonLab.frame), 16.5, 3, 27)];
    self.ImageView.image = [UIImage imageNamed:@"xuxian_line"];
    [self addSubview:self.ImageView];
    //产品名称
    self.productLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10, 0, 80, 60)];
    self.productLab.text = productTitle;
    self.productLab.font = [UIFont systemFontOfSize:14];
    self.productLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [self addSubview:self.productLab];
    //减号
    self.minBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.productLab.frame), 10, 40, 35)];
    [self.minBtn setTitle:@"-" forState:UIControlStateNormal];
    [self.minBtn setTitleColor:[UIColor colorWithHexString:@"#159695"] forState:UIControlStateNormal];
    self.minBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    self.minBtn.layer.cornerRadius = 8.0;
    self.minBtn.layer.borderColor = [UIColor colorWithHexString:@"#159695"].CGColor;
    self.minBtn.layer.borderWidth = 1.0f;
    [self.minBtn addTarget:self action:@selector(minBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.minBtn];
    //数字
    self.numLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.minBtn.frame), 10, 40, 35)];
    self.numLab.text = numTitle;
    self.numLab.textAlignment = NSTextAlignmentCenter;
    self.numLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.numLab];
    //加号
    self.addBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.numLab.frame),10, 40, 35)];
    [self.addBtn setTitle:@"+" forState:UIControlStateNormal];
    [self.addBtn setTitleColor:[UIColor colorWithHexString:@"#159695"] forState:UIControlStateNormal];
    self.addBtn.titleLabel.font = [UIFont systemFontOfSize:24];
    self.addBtn.layer.cornerRadius = 8.0;
    self.addBtn.layer.borderColor = [UIColor colorWithHexString:@"#159695"].CGColor;
    self.addBtn.layer.borderWidth = 1.0f;
    [self.addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.addBtn];

    

}

- (void)minBtnClick
{
    NSLog(@"点击减号");
}

- (void)addBtnClick
{
    NSLog(@"点击加号");
}


#pragma mark ---第三个分区

- (void)initCellSectionTreeWithTitle:(NSString *)title placeholder:(NSString *)holderTitle DetailTitle:(NSString *)detailTitle image:(NSString *)image
{
    
    //标题
    self.commonLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 90, 60)];
    self.commonLab.text = title;
    self.commonLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.commonLab.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.commonLab];
    //竖线--分隔线
    self.ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.commonLab.frame), 16.5, 3, 27)];
    self.ImageView.image = [UIImage imageNamed:@"xuxian_line"];
    [self addSubview:self.ImageView];
    //输入框
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+10, 0, kWidth/2+30, 60)];
    self.textField.placeholder = holderTitle;
    [self.textField setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    [self addSubview:self.textField];
    //清除按钮
    self.clearBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.textField.frame)+5, 20, 20, 20)];
    [self.clearBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self addSubview:self.clearBtn];
    //右侧标注文字
    self.SuffixLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.textField.frame)+5, 12, 20, 20)];
    self.SuffixLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.SuffixLab.text = detailTitle;
    self.SuffixLab.font = [UIFont systemFontOfSize:13];
    self.SuffixLab.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.SuffixLab];
    
    //分隔线
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:self.line];

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
