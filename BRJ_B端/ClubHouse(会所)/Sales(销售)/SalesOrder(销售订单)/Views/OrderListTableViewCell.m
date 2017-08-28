//
//  OrderListTableViewCell.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/14.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "OrderListTableViewCell.h"

@implementation OrderListTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  BigImage:(NSString *)bigImage labelImage:(NSString *)labelImage Name:(NSString *)name Status:(NSString *)state orderNum:(NSString *)orderNum orderAmt:(NSString *)orderAmt saleName:(NSString *)saleName salesData:(NSString *)salesData
 {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//     self = [super initWithStyle:style reuseIdentifier:reuseIdentifierWithBigImage];
    if (self) {
        [self customCellWithOrderListWithBigImage:bigImage labelImage:labelImage Name:name Status:state orderNum:orderNum orderAmt:orderAmt saleName:saleName salesData:salesData];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customCellWithOrderListWithBigImage:nil labelImage:nil Name:nil Status:nil orderNum:nil orderAmt:nil saleName:nil salesData:nil];
    }
    return self;
}

- (void)configBigImage:(NSString *)bigImage labelImage:(NSString *)labelImage Name:(NSString *)name Status:(NSString *)state orderNum:(NSString *)orderNum orderAmt:(NSString *)orderAmt saleName:(NSString *)saleName salesData:(NSString *)salesData {
     self.houseImageView.image = [UIImage imageNamed:bigImage];
    self.labelImageView.image = [UIImage imageNamed:labelImage];
    self.nameLabel.text = name;
    self.statusLabel.text = state;
    self.orderNumber.text = orderNum;
    self.orderAmt.text = orderAmt;
    self.saleName.text = saleName;
    self.salesData.text = salesData;
}

- (void)customCellWithOrderListWithBigImage:(NSString *)bigImageStr labelImage:(NSString *)labelImageStr Name:(NSString *)nameStr Status:(NSString *)stateStr orderNum:(NSString *)orderNumStr orderAmt:(NSString *)orderAmtStr saleName:(NSString *)saleNameStr salesData:(NSString *)salesDataStr
{
    //大图
    self.houseImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 12, 108, 107)];
//    self.houseImageView.image = [UIImage imageNamed:bigImageStr];
    [self.contentView addSubview:self.houseImageView];
    //标签图
    self.labelImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-2, -2, 44, 44)];
//    self.labelImageView.image = [UIImage imageNamed:labelImageStr];
    [self.contentView addSubview:self.labelImageView];
    //客户名称
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.houseImageView.frame)+12, 14, 120, 21)];
//    self.nameLabel.text = nameStr;
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [self.contentView addSubview:self.nameLabel];
    
    //状态
    self.statusLabel = [[UILabel alloc]initWithFrame:CGRectMake( kWidth-80, 12, 68, 18)];
//    self.statusLabel.text = stateStr;
    self.statusLabel.font = [UIFont systemFontOfSize:12];
    self.statusLabel.textAlignment = NSTextAlignmentLeft;
    self.statusLabel.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [self.contentView addSubview:self.statusLabel];
    
    
    //订单编号
    self.orderNumber = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.houseImageView.frame)+12, CGRectGetMaxY(self.nameLabel.frame), 150, 18)];
//    self.orderNumber.text = orderNumStr;
    self.orderNumber.font = [UIFont systemFontOfSize:12];
    self.orderNumber.textAlignment = NSTextAlignmentLeft;
    self.orderNumber.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [self.contentView addSubview:self.orderNumber];
    //订单金额
    self.orderAmt = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.houseImageView.frame)+12, CGRectGetMaxY(self.orderNumber.frame), 120, 18)];
//    self.orderAmt.text = orderAmtStr;
    self.orderAmt.font = [UIFont systemFontOfSize:12];
    self.orderAmt.textAlignment = NSTextAlignmentLeft;
    self.orderAmt.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [self.contentView addSubview:self.orderAmt];
    //签单销售
    self.saleName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.houseImageView.frame)+12, CGRectGetMaxY(self.orderAmt.frame)+10, 120, 18)];
//    self.saleName.text = saleNameStr;
    self.saleName.font = [UIFont systemFontOfSize:12];
    self.saleName.textAlignment = NSTextAlignmentLeft;
    self.saleName.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [self.contentView addSubview:self.saleName];
    
    //签单日期
    self.salesData = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.houseImageView.frame)+12, CGRectGetMaxY(self.saleName.frame), 150, 18)];
//    self.salesData.text = salesDataStr;
    self.salesData.font = [UIFont systemFontOfSize:12];
    self.salesData.textAlignment = NSTextAlignmentLeft;
    self.salesData.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [self.contentView addSubview:self.salesData];
    
    //按钮
    self.approvalBtn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth-80, 55, 68, 30)];
    [self.approvalBtn setTitle:@"审批" forState:UIControlStateNormal];
    self.approvalBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.approvalBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.approvalBtn.layer.cornerRadius = 5.0;
//    self.approvalBtn.layer.
    self.approvalBtn .backgroundColor = [UIColor colorWithHexString:@"#159695"];
    [self.approvalBtn addTarget:self action:@selector(approvalAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.approvalBtn];
    
    //分隔线
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.houseImageView.frame)+12, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self.contentView addSubview:self.line];
    
}

- (void)approvalAction{
    NSLog(@"点击审批");
}

- (void)awakeFromNib {
    [super awakeFromNib];
 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
