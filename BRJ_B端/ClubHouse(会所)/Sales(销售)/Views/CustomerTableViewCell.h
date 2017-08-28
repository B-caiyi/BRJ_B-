//
//  CustomerTableViewCell.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/7.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomerTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *nameLab;//名字

@property (nonatomic,strong) UILabel *intentLab;//意向度

@property (nonatomic,strong) UIImageView *ImageView;//虚线容器

@property (nonatomic,strong) UILabel *BornLab;//预产期

@property (nonatomic,strong) UILabel *BornData;//预产期--后台返回值

@property (nonatomic,strong) UILabel *LatestVisit;//最新拜访

@property (nonatomic,strong) UILabel *VisitDescription;//拜访描述--后台返回

@property (nonatomic,strong) UIButton *phoneBtn;//电话按钮

@end
