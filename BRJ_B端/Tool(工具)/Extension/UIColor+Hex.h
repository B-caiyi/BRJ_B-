//
//  UIColor+Hex.h
//  LCCar
//
//  Created by 夏桂峰 on 15/12/22.
//  Copyright (c) 2015年 夏桂峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+(UIColor *)colorWithHex:(NSUInteger)hex;


// 默认alpha位1
+ (UIColor *)colorWithHexString:(NSString *)hexString;

// 从十六进制字符串获取颜色，
// color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
