//
//  UIColor+Hex.m
//  LCCar
//
//  Created by 夏桂峰 on 15/12/22.
//  Copyright (c) 2015年 夏桂峰. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+(UIColor *)colorWithHex:(NSUInteger)hex
{
    float b=(hex&0xFF)/255.f;
    float g=((hex>>8) & 0xFF)/255.f;
    float r=((hex >> 16) & 0xFF)/255.f;
    float a=hex> 0xFFFFFF ? ((hex>>24)& 0xFF)/255.f : 1.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}



+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    // 删除字符串中的空格
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    // 如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    
    // 如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    // r
    NSString *rString = [cString substringWithRange:range];
    
    // g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    // b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:alpha];
}

// 默认 alpha 值为1
+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    return [self colorWithHexString:hexString alpha:1.0f];
}
@end
