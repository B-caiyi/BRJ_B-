//
//  BabyEvaluationCollectionViewCell.m
//  BRJ_B端
//
//  Created by caiyi on 2017/8/25.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "BabyEvaluationCollectionViewCell.h"

@implementation BabyEvaluationCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        [self addSubview:self.ImageView];
    }
    return self;
}


- (void)configCellWithImage:(NSString *)image
{
    self.ImageView.image = [UIImage imageNamed:image];

}


@end
