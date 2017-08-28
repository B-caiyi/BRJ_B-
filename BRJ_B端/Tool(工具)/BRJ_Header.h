//
//  BRJ_Header.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/2.
//  Copyright © 2017年 方溯. All rights reserved.
//

#ifndef BRJ_Header_h
#define BRJ_Header_h



/**屏幕尺寸-宽度*/
#define kWidth ([UIScreen mainScreen].bounds.size.width)
/**屏幕尺寸-高度*/
#define kHeight ([UIScreen mainScreen].bounds.size.height)
/**颜色RGB*/
#define RGB(r,g,b) ([UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f])
/**颜色RGBA*/
#define RGBA(r,g,b,a) ([UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)])
/**十六进制色值*/
#define hexColor(hex) [UIColor colorWithHex:hex]




#endif /* BRJ_Header_h */
