//
//  SelectBtnViewController.h
//  SelectBtnViewController
//
//  Created by dyso on 16/8/1.
//  Copyright © 2016年 yangzhicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectBtnViewController : UIViewController

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *controllerArray;

@property (nonatomic, strong)void (^pushToTargetController)();

@end
