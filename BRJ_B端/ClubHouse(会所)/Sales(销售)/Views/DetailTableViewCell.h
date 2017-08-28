//
//  DetailTableViewCell.h
//  BRJ_B端
//
//  Created by caiyi on 2017/8/8.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *detailLab;//名称

@property (nonatomic,strong) UILabel *detail;//名称 -- 后台返回值

@property (nonatomic,strong) UILabel *dataLab;//销售记录中--时间


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier TitleOne:(NSString *)TitleOne TitleTwo:(NSString *)TitleTwo;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier TitleOne:(NSString *)TitleOne TitleTwo:(NSString *)TitleTwo TitleThree:(NSString *)TitleThree type:(NSInteger)type;

@end
