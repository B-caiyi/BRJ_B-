//
//  ServiceRatingDetailTableViewCell.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/21.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiceRatingDetailTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *ImageView;//头像图片

@property (nonatomic,strong) UILabel *nameLab;//客户名称

@property (nonatomic,strong) UILabel *roomNumLab;//房间号

@property (nonatomic,strong) UIButton *selectBtn;



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger)type;

- (void)configCellImage:(NSString *)image name:(NSString *)name roomNum:(NSString *)roomNum;

- (void)configImage:(NSString *)image;



@end
