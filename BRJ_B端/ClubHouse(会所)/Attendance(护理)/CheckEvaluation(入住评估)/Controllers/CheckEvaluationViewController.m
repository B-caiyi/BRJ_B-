//
//  CheckEvaluationViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/24.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "CheckEvaluationViewController.h"
#import "MotherEvaluationViewController.h"
#import "BabyEvaluationViewController.h"


/**
 *  是否是iPhone6的屏幕
 */
#define mt_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  是否是iPhone6_Plus的屏幕
 */
#define mt_iPhone6_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  是否是iPhone4的屏幕
 */
#define mt_iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  是否是iPhone5的屏幕
 */
#define mt_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)



@interface CheckEvaluationViewController ()

@property (nonatomic,strong) UIViewController *motherEvaluationVc;

@property (nonatomic,strong) UIViewController *babyEvaluationVc;

@property (nonatomic,strong) UIViewController *currentVc;

@property (nonatomic,strong) UIView *segMentView;//

@property (nonatomic, assign) NSInteger index;

@end

@implementation CheckEvaluationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNavigation];
    [self initUI];
}

- (void)creatNavigation{
    
    UIView *NavView = [[UIView alloc]initWithFrame:CGRectMake(0,0, kWidth, 64)];
    NavView.backgroundColor = [UIColor colorWithHexString:@"#19233A"];
    [self.view addSubview:NavView];
    
    UILabel *NavTitleLab = [Maker makeLb:CGRectMake(0, 20, kWidth, 44)
                                   title:@"入住评估"
                               alignment:NSTextAlignmentCenter
                                    font:[UIFont systemFontOfSize:18]
                               textColor:[UIColor whiteColor]];
    
    [NavView addSubview:NavTitleLab];
    
    
    //返回按钮
    UIButton *backBtn=[Maker makeBtn:CGRectMake(15, 25, 20, 34)
                               title:nil
                                 img:@"fanhui-icon"
                                font:nil
                              target:self
                              action:@selector(back)];
    [NavView addSubview:backBtn];
    
}
//返回按钮
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initUI{
    self.segMentView = [[UIView alloc]initWithFrame:CGRectMake((kWidth-168)/2, 72, 168, 35)];
    self.segMentView.backgroundColor = [UIColor redColor];
    self.segMentView = [self setupSegment];
    [self.view addSubview:self.segMentView];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 117, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self.view addSubview:line];
    
    self.motherEvaluationVc = [[MotherEvaluationViewController alloc]init];
    self.motherEvaluationVc.view.frame = CGRectMake(0, 118, kWidth, kHeight-118);
    [self addChildViewController:self.motherEvaluationVc];
    
    self.babyEvaluationVc = [[BabyEvaluationViewController alloc]init];
    self.babyEvaluationVc.view.frame = CGRectMake(0, 118, kWidth, kHeight-118);
    [self addChildViewController:self.babyEvaluationVc];
    
    //设置默认控制器为fristVc
    self.currentVc = self.motherEvaluationVc;
    [self.view addSubview:self.motherEvaluationVc.view];
    
}

/**
 *  初始化segmentControl
 */
- (UISegmentedControl *)setupSegment{
    NSArray *items = @[@"妈妈", @"宝宝"];
    UISegmentedControl *sgc = [[UISegmentedControl alloc] initWithItems:items];
    sgc.frame = CGRectMake((kWidth-168)/2, 74, 168, 35);
    sgc.tintColor = [UIColor colorWithHexString:@"#159695"];
    sgc.layer.cornerRadius = 8.0;
//    if (mt_iPhone4 || mt_iPhone5) {
//        [sgc setWidth:60 forSegmentAtIndex:0];
//        [sgc setWidth:60 forSegmentAtIndex:1];
//        NSDictionary *dic = @{
//        NSFontAttributeName:[UIFont systemFontOfSize:16]//1.设置字体样式:例如黑体,和字体大小
//                              };
//        [sgc setTitleTextAttributes:dic forState:UIControlStateNormal];
//    }else if (mt_iPhone6) {
//        [sgc setWidth:70 forSegmentAtIndex:0];
//        [sgc setWidth:70 forSegmentAtIndex:1];
//    }else if (mt_iPhone6_Plus) {
//        [sgc setWidth:80 forSegmentAtIndex:0];
//        [sgc setWidth:80 forSegmentAtIndex:1];
//    }
    
    //默认选中的位置
    sgc.selectedSegmentIndex = 0;
    //监听点击
    [sgc addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
    [self.segMentView addSubview:sgc];
    return sgc;
}

- (void)segmentChange:(UISegmentedControl *)sgc{
    //NSLog(@"%ld", sgc.selectedSegmentIndex);
    self.index = sgc.selectedSegmentIndex;
    switch (sgc.selectedSegmentIndex) {
        case 0:
            [self replaceFromOldViewController:self.babyEvaluationVc toNewViewController:self.motherEvaluationVc];
            break;
        case 1:
            [self replaceFromOldViewController:self.motherEvaluationVc toNewViewController:self.babyEvaluationVc];
            break;
        default:
            break;
    }
}
/**
 *  实现控制器的切换
 *
 *  @param oldVc 当前控制器
 *  @param newVc 要切换到的控制器
 */
- (void)replaceFromOldViewController:(UIViewController *)oldVc toNewViewController:(UIViewController *)newVc{
    /**
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     *  fromViewController    当前显示在父视图控制器中的子视图控制器
     *  toViewController        将要显示的姿势图控制器
     *  duration                动画时间(这个属性,old friend 了 O(∩_∩)O)
     *  options              动画效果(渐变,从下往上等等,具体查看API)UIViewAnimationOptionTransitionCrossDissolve
     *  animations            转换过程中得动画
     *  completion            转换完成
     */
    [self addChildViewController:newVc];
    [self transitionFromViewController:oldVc toViewController:newVc duration:0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newVc didMoveToParentViewController:self];
            [oldVc willMoveToParentViewController:nil];
            [oldVc removeFromParentViewController];
            self.currentVc = newVc;
        }else{
            self.currentVc = oldVc;
        }
    }];
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
