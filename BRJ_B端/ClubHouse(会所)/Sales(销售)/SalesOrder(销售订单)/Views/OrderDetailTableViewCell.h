//
//  OrderDetailTableViewCell.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/15.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *detailLab;//名称

@property (nonatomic,strong) UILabel *detail;//名称 -- 后台返回值


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier TitleOne:(NSString *)TitleOne TitleTwo:(NSString *)TitleTwo type:(NSInteger)type;
//自定义图片cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier Image:(NSString *)image;

@end
