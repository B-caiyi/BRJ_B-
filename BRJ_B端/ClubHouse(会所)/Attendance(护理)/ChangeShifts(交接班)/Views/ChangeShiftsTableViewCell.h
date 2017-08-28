//
//  ChangeShiftsTableViewCell.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/22.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeShiftsCollectionViewCell.h"

@interface ChangeShiftsTableViewCell : UITableViewCell <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

//@property (nonatomic,strong) UILabel *UpcomingLab;//待办提醒

@property (nonatomic,strong) UIButton *roomBtn;//房间号

@property (nonatomic,strong) UILabel *contentLab;//房间内信息

@property (nonatomic,strong) UILabel *descripLab;//客户人数

@property (nonatomic,strong) UILabel *descrip;

@property (nonatomic,strong) UIView *line;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *nameArray;

@property (nonatomic,strong) UIView *bgView;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger)type;

- (void)configWithTitle:(NSString *)title contentTitle:(NSString *)contentTitle;

- (void)configWithTextView:(NSString *)title;

- (void) configWithCustomersInformation:(NSString *)title;

@end
