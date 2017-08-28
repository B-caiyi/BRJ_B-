//
//  BabyEvaluationTableViewCell.h
//  BRJ_B端
//
//  Created by caiyi on 2017/8/24.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BabyEvaluationTableViewCell : UITableViewCell


@property (nonatomic,strong) UILabel *detailLab;

- (void)configCellWithTitle:(NSString *)title;

@end
