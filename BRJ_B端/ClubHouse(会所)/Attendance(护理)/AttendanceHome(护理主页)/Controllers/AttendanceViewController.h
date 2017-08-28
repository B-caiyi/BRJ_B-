//
//  AttendanceViewController.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/2.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseRoomViewController.h"
#import "ServiceRatingViewController.h"
#import "ChangeShiftsViewController.h"
#import "selectBtnView.h"
#import "CheckEvaluationViewController.h"
#import "NursesRecordViewController.h"

@interface AttendanceViewController : UIViewController

@property (nonatomic,strong) void (^pushBlock)(NSInteger index);

@end
