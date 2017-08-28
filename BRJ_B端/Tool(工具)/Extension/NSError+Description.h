//
//  NSError+Description.h
//  LCCar
//
//  Created by 夏桂峰 on 16/3/10.
//  Copyright © 2016年 夏桂峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Description)

@property(nonatomic,copy,readonly)NSString *errorDescription;

@end
