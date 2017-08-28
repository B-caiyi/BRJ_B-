//
//  SalesTableViewCell.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/3.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalesTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *titleLab;//大标题

@property(nonatomic,strong) UILabel *SubtitleLab;//子标题

@property (nonatomic,strong) UIImageView *ImageView;//图片

@property (nonatomic,strong) UILabel *numLab;//个数

@property (nonatomic,strong) UILabel *dateLab;//时间

@property (nonatomic,strong) UIButton *dateBtn;//日期选择按钮

@property (nonatomic,strong) UIImageView *ImageView1;//图片

@property (nonatomic,strong) UIImageView *ImageView2;//图片

@property (nonatomic,strong) UILabel *SubTitleLab1;

@property (nonatomic,strong) UILabel *SubTitleLab2;

@property (nonatomic,strong) UILabel *numLab1;//个数

@property (nonatomic,strong) UILabel *numLab2;//个数


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger)type;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
