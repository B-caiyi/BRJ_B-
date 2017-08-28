//
//  NSString+Encrypt.m
//  LongChouDai
//
//  Created by 夏桂峰 on 15/8/26.
//  Copyright (c) 2015年 隆筹贷. All rights reserved.
//

#import "NSString+Encrypt.h"

@implementation NSString (Encrypt)

/*
 加密算法：
 原文：123aBc
 密文：0ceB4a53T2Z1
 解密：取出密文的偶数位，再倒序。
 加密：将原文倒序，再在每一位前面插入0~9,a~z,A~Z的随机值。
 */

+(NSString *)secretStringWithString:(NSString *)originString
{
    if(originString.length>0)
    {
        NSMutableString *mutable=[[NSMutableString alloc] init];
        //构造一个0～9，a~z,A~Z的array
        NSArray *array=@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",
                         @"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",
                         @"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",
                         @"u",@"v",@"w",@"x",@"y",@"z",
                         @"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",
                         @"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",
                         @"U",@"V",@"W",@"X",@"Y",@"Z"];
//        NSMutableArray *array=[NSMutableArray array];
//        for(char value='0';value<='9';value++)
//        {
//            [array addObject:@(value)];
//            
//        }
//        for(char value='A';value<='Z';value++)
//        {
//            [array addObject:@(value)];
//        }
//        for(char value='a';value<'z';value++)
//        {
//            [array addObject:@(value)];
//        }
        for(NSInteger i=originString.length-1;i>=0;i--)
        {
            NSInteger index=arc4random()%array.count;
//            [mutable appendFormat:@"%c",[[array objectAtIndex:index] charValue]];
            [mutable appendString:[array objectAtIndex:index]];
            [mutable appendFormat:@"%C",[originString characterAtIndex:i]];
        }
        return mutable;
    }
    else
        return nil;
}
/**
 *  解密
 *
 *  @param secretString 密文
 *
 *  @return 明文
 */
+(NSString *)originalStringWithSecretString:(NSString *)secretString
{
    if(secretString.length>0)
    {
        NSMutableString *originString=[[NSMutableString alloc] init];
        for(NSInteger i=secretString.length-1;i>=0;i-=2)
        {
            [originString appendFormat:@"%C",[secretString characterAtIndex:i]];
        }
        return originString;
    }
    else
        return nil;
}
@end
