//
//  NSError+Description.m
//  LCCar
//
//  Created by 夏桂峰 on 16/3/10.
//  Copyright © 2016年 夏桂峰. All rights reserved.
//

#import "NSError+Description.h"

@implementation NSError (Description)

-(NSString *)errorDescription
{
    if([self.localizedDescription isEqualToString:@"Could not connect to the server."])
        return @"无法连接至服务器";
    if([self.localizedDescription isEqualToString:@"The Internet connection appears to be offline."])
        return @"网络连接失败";
    return self.localizedDescription;
}

@end
