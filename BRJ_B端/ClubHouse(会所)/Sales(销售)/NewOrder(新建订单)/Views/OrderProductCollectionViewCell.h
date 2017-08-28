//
//  OrderProductCollectionViewCell.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/17.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderProductCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UILabel *titleLab;//标题

@property (weak, nonatomic) IBOutlet UILabel *contentLab;

@property (weak, nonatomic) IBOutlet UILabel *priceLab;//价格 

@property (weak, nonatomic) IBOutlet UIButton *selectBtn;//按钮


@end
