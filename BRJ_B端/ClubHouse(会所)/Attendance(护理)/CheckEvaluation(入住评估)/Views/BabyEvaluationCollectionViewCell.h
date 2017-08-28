//
//  BabyEvaluationCollectionViewCell.h
//  BRJ_B端
//
//  Created by caiyi on 2017/8/25.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BabyEvaluationCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *ImageView;

- (void)configCellWithImage:(NSString *)image;

@end
