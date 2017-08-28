//
//  UIButton+ImageTitle.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/4.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger,MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左

};

@interface UIButton (ImageTitle)

@end
