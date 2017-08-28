//
//  CustomTabBarViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/2.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "CustomTabBarViewController.h"

@interface CustomTabBarViewController ()

@end

@implementation CustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self creatControllers];
    
}

- (void)creatControllers
{
    
    NSArray *controllerNames = @[@"DailyViewController",
                                 @"ClubHouseViewController",
                                 @"AddFunctionViewController",
                                 @"ClientViewController",
                                 @"MyAboutViewController"];
    
    NSArray *names = @[@"",@"",@"",@"",@""];
    NSArray *tabBarImages = @[@"home_normal",@"huisuo_icon_normal",@"jiahao_icon_highlight",@"kehuzhonxin_icon_normal",@"account_normal"];
    NSArray *tabBarImages_s = @[@"home_highlight",@"huisuo_icon_highlight",@"jiahao_icon_highlight",@"kehuzhonxin_icon_highlight",@"account_highlight"];
    
   
    NSDictionary *dict=@{NSFontAttributeName:[UIFont systemFontOfSize:12],
                         NSForegroundColorAttributeName:[UIColor colorWithHex:0x999999]};
    NSDictionary *dict_s=@{NSFontAttributeName:[UIFont systemFontOfSize:12],
                           NSForegroundColorAttributeName:[UIColor colorWithHex:0x0285f0]};
    
    NSMutableArray *controllerArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < controllerNames.count; i ++ ) {
        Class class = NSClassFromString(controllerNames[i]);
        UIViewController *controller = [[class alloc]init];
        controller.automaticallyAdjustsScrollViewInsets = NO;
        controller.view.backgroundColor = [UIColor whiteColor];
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];
        controller.title = names[i];
        controller.tabBarItem.image = [[UIImage imageNamed:tabBarImages[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        controller.tabBarItem.selectedImage = [[UIImage imageNamed:tabBarImages_s[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [controller.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
        [controller.tabBarItem setTitleTextAttributes:dict_s forState:UIControlStateSelected];
        
        nav.navigationBarHidden = YES;
        [controllerArray addObject:nav];
        
    }
    self.viewControllers = controllerArray;
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
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
