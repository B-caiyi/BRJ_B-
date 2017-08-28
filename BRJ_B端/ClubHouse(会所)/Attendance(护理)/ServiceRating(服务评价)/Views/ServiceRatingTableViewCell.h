//
//  ServiceRatingTableViewCell.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/21.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceRatingTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *ImageView;//头像图片

@property (nonatomic,strong) UILabel *nameLab;//名字

@property (nonatomic,strong) UIButton *selectBtn;//五角星

@property (nonatomic,strong) UIButton *selectBtn2;//五角星

@property (nonatomic,strong) UIButton *selectBtn3;//五角星

@property (nonatomic,strong) UIButton *selectBtn4;//五角星

@property (nonatomic,strong) UIButton *selectBtn5;//五角星

@property (nonatomic,strong) UILabel *contLab;//内容

@property (nonatomic,strong) UILabel *dateLab;//日期

@property (nonatomic,strong) UIView *line;//分隔线


- (void)configCellDataWithImage:(NSString *)image name:(NSString *)name content:(NSString *)content date:(NSString *)date;

@end
