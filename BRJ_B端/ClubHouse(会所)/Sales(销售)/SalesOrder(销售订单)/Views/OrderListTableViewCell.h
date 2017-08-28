//
//  OrderListTableViewCell.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/14.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderListTableViewCell : UITableViewCell


@property (nonatomic,strong) UIImageView *houseImageView;//大图

@property (nonatomic,strong) UIImageView *labelImageView;//标签

@property (nonatomic,strong) UILabel *nameLabel;//名字

@property (nonatomic,strong) UILabel *statusLabel;//状态

@property (nonatomic,strong) UILabel *orderNumber;//订单编号

@property (nonatomic,strong) UILabel *orderAmt;//订单金额

@property (nonatomic,strong) UILabel *saleName;//签单销售

@property (nonatomic,strong) UILabel *salesData;//签单日期

@property (nonatomic,strong) UIButton *approvalBtn;//审批按钮

@property (nonatomic,strong) UIView *line;//分隔线



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  BigImage:(NSString *)bigImage labelImage:(NSString *)labelImage Name:(NSString *)name Status:(NSString *)state orderNum:(NSString *)orderNum orderAmt:(NSString *)orderAmt saleName:(NSString *)saleName salesData:(NSString *)salesData;

- (void)configBigImage:(NSString *)bigImage labelImage:(NSString *)labelImage Name:(NSString *)name Status:(NSString *)state orderNum:(NSString *)orderNum orderAmt:(NSString *)orderAmt saleName:(NSString *)saleName salesData:(NSString *)salesData;

@end
