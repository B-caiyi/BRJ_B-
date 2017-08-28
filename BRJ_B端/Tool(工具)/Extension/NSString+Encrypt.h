//
//  NSString+Encrypt.h
//  LongChouDai
//
//  Created by 夏桂峰 on 15/8/26.
//  Copyright (c) 2015年 隆筹贷. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用于加密
 */
@interface NSString (Encrypt)

/**
 *  将明文加密成密文：加密算法：
 *  原文：123aBc
 *  密文：0ceB4a53T2Z1
 *  解密：取出密文的偶数位，再倒序。
 *  加密：将原文倒序，再在每一位前面插入0~9,a~z,A~Z的随机值。
 *
 *  @param originString 明文
 *
 *  @return 密文
 */
+(NSString *)secretStringWithString:(NSString *)originString;
/**
 *  将明文解密成明文
 *
 *  @param secretString 密文
 *
 *  @return 明文
 */
+(NSString *)originalStringWithSecretString:(NSString *)secretString;

@end
