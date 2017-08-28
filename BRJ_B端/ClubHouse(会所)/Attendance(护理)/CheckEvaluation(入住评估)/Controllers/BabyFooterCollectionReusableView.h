//
//  BabyFooterCollectionReusableView.h
//  BRJ_B端
//
//  Created by caiyi on 2017/8/25.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BabyFooterCollectionReusableView : UICollectionReusableView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UITextView *textView;

@property (nonatomic,strong) UIButton *saveBtn;

@property (nonatomic,strong) void (^saveBtnBlock)(NSInteger index);

@end
