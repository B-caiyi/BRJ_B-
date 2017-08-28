//
//  ClubHouseViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/2.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "ClubHouseViewController.h"
#import "AllFuctionDataViewController.h"
#import "ComplaintsViewController.h"
#import "SalesViewController.h"
#import "AttendanceViewController.h"
#import "CustomerServiceViewController.h"
#import "RoomAffairsViewController.h"



@interface ClubHouseViewController ()


@property (nonatomic,strong) UIPageViewController *pageViewCotroller;



@end

@implementation ClubHouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatNavigation];
    [self creatChildrenCotroller];
}

- (void)creatNavigation{
    
    UIView *NavView = [[UIView alloc]initWithFrame:CGRectMake(0,0, kWidth, 64)];
    NavView.backgroundColor = [UIColor colorWithHexString:@"#19233A"];
    [self.view addSubview:NavView];
    
    UILabel *NavTitleLab = [Maker makeLb:CGRectMake(0, 20, kWidth, 44)
                                   title:@"上海朗悦静安会所"
                               alignment:NSTextAlignmentCenter
                                    font:[UIFont systemFontOfSize:18]
                               textColor:[UIColor whiteColor]];
    
    [NavView addSubview:NavTitleLab];
    
    //分享按钮
    UIButton *ContactsBtn = [Maker makeBtn:CGRectMake(kWidth-15-40, 25, 40, 35) title:nil img:@"tongxunlu-icon" font:nil target:self action:@selector(ContactsBtnAction)];
    [NavView addSubview:ContactsBtn];
    
}

- (void)ContactsBtnAction{
    
    NSLog(@"点击通讯录");

}




- (void)creatChildrenCotroller
{
    self.titleArray = @[@"全部",@"投诉",@"销售",@"护理",@"客服",@"房务"];
    //全部
    AllFuctionDataViewController *AllFuctionDataVc = [[AllFuctionDataViewController alloc]init];
    //投诉
    ComplaintsViewController *ComplaintsVc = [[ComplaintsViewController alloc]init];
    
    //销售
    SalesViewController *SalesVc = [[SalesViewController alloc]init];
    [SalesVc setPushBlock:^(NSInteger index){
        if (index == 0) {
            
        }else if (index == 1){
            OrderListViewController *OrderListVc = [[OrderListViewController alloc]init];
            OrderListVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:OrderListVc animated:YES];
            
        }else if (index == 2){
            CustomerListViewController *CustomerListVc = [[CustomerListViewController alloc]init];
            CustomerListVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:CustomerListVc animated:YES];
            
        }else if (index == 3){
            AddNewCustomerViewController *AddNewCustomerVc = [[AddNewCustomerViewController alloc]init];
            AddNewCustomerVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:AddNewCustomerVc animated:YES];
        }else if (index == 4){
            
            CreateActionViewController *CreateActionVc = [[CreateActionViewController alloc]init];
            CreateActionVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:CreateActionVc animated:YES];
            
        }else if (index == 5){
            NewOrderViewController *NewOrderVc = [[NewOrderViewController alloc]init];
            NewOrderVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:NewOrderVc animated:YES];
            
        }
    }];
    //护理
    AttendanceViewController *AttendanceVc = [[AttendanceViewController alloc]init];
    [AttendanceVc setPushBlock:^(NSInteger index){
        self.navigationController.hidesBottomBarWhenPushed = YES;
        if (index == 0) {
            ServiceRatingViewController *ServiceRatingVc = [[ServiceRatingViewController alloc]init];
            ServiceRatingVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:ServiceRatingVc animated:YES];
            
        }else if (index == 1){
            
            ChangeShiftsViewController *ChangeShiftsVc = [[ChangeShiftsViewController alloc]init];
            ChangeShiftsVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:ChangeShiftsVc animated:YES];
            
        }else if(index == 2){
         NSLog(@"护理模块点击");
            
            CheckEvaluationViewController *CheckEvaluationVc = [[CheckEvaluationViewController alloc]init];
            CheckEvaluationVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:CheckEvaluationVc animated:YES];
//            selectBtnView *bgView = [[selectBtnView alloc]initWithFrame:CGRectMake(0, kHeight/2, kWidth, kHeight/2)];
//            UIWindow *window = [[[UIApplication sharedApplication]windows]objectAtIndex:0];
//            [window addSubview:bgView];
//            [bgView setBtnBlock:^(NSInteger index){
//                if (index == 0) {
//                    ChooseRoomViewController *ChooseRoomVc = [[ChooseRoomViewController alloc]init];
//                    ChooseRoomVc.hidesBottomBarWhenPushed = YES;
//                    [self.navigationController pushViewController:ChooseRoomVc animated:YES];
//                }
//            
//            }];
            
            
        }else if (index == 3){
            ChooseRoomViewController *ChooseRoomVc = [[ChooseRoomViewController alloc]init];
            ChooseRoomVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:ChooseRoomVc animated:YES];
            
        }else if(index == 4){
         NSLog(@"护理模块点击");
        }else if (index == 5){
         NSLog(@"护理模块点击");
        }
    }];
    
    //客服
    CustomerServiceViewController *CustomerServiceVc = [[CustomerServiceViewController alloc]init];
    //房务
    RoomAffairsViewController *RoomAffairsVc = [[RoomAffairsViewController alloc]init];

    //
    self.controllerArray = @[AllFuctionDataVc,ComplaintsVc,SalesVc,AttendanceVc,CustomerServiceVc,RoomAffairsVc];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
