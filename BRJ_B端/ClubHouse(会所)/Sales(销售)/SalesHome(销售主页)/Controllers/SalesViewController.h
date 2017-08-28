//
//  SalesViewController.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/2.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomerListViewController.h"
#import "AddNewCustomerViewController.h"
#import "CreateActionViewController.h"
#import "OrderListViewController.h"
#import "NewOrderViewController.h"

@interface SalesViewController : UIViewController

@property (nonatomic, strong)void (^pushBlock)(NSInteger index);

@end
