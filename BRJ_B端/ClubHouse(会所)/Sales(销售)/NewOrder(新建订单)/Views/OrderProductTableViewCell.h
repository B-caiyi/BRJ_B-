//
//  OrderProductTableViewCell.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/17.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderProductTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *commonLab;//lable

@property (nonatomic,strong) UITextField *textField;//输入框

@property (nonatomic,strong) UIButton *clearBtn;//清除按钮

@property (nonatomic,strong) UIImageView *ImageView;//虚线容器

@property (nonatomic,strong) UIView *line;//分隔线

@property (nonatomic,strong) UILabel *intentLab;//入住天数

@property (nonatomic,strong) UIButton *dateBtn1;//天数1

@property (nonatomic,strong) UIButton *dateBtn2;//天数2

@property (nonatomic,strong) UIButton *dateBtn3;//天数3

@property (nonatomic,strong) UILabel *orderProductLab;//订单产品

@property (nonatomic,strong) UILabel *productLab;//产品名称

@property (nonatomic,strong) UIButton *selectBtn;//产品选择按钮

@property (nonatomic,strong) UIButton *addBtn;//加好按钮

@property (nonatomic,strong) UIButton *minBtn;//减号按钮

@property (nonatomic,strong) UILabel *numLab;//数量lab

@property (nonatomic,strong) UILabel *SuffixLab;//尾缀--例如"元"


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger)type;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title placeholder:(NSString *)holderTitle DetailTitle:(NSString *)detailTitle image:(NSString *)image type:(NSInteger)type;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier Title:(NSString *)title ProductTitle:(NSString *)productTitle NumTitle:(NSString *)numTitle;

@end
