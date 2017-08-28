//
//  CustomerDetailViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/8.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "CustomerDetailViewController.h"
#import "DetailTableViewCell.h"
#import "SalesRecordViewController.h"
#import "BasicInformationViewController.h"
#import "OrderInformationViewController.h"

#define detailKHeight  20
@interface CustomerDetailViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,strong) UITableView *DetailTableView;//客户详情tableView

@property (nonatomic,strong) UIScrollView *scrollView;


@end

@implementation CustomerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatNavigation];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatScrollView];
    [self creatTableView];
    [self creatChildrenCotroller];
    
}

- (void)creatNavigation{
    
    UIView *NavView = [[UIView alloc]initWithFrame:CGRectMake(0,0, kWidth, 64)];
    NavView.backgroundColor = [UIColor colorWithHexString:@"#19233A"];
    [self.view addSubview:NavView];
    
    UILabel *NavTitleLab = [Maker makeLb:CGRectMake(0, 20, kWidth, 44)
                                   title:@"客户详情"
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
    
    
    //新建客户
    UIButton *ContactsBtn = [Maker makeBtn:CGRectMake(kWidth-15-40, 25, 40, 35) title:nil img:@"bianjianniu" font:nil target:self action:@selector(EditAction)];
    [NavView addSubview:ContactsBtn];
    
}
//返回按钮
- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

//编辑按钮
- (void)EditAction{
    NSLog(@"点击编辑");
}


- (void)creatScrollView{
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight)];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.delegate = self;
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    [self.view addSubview:self.scrollView];
    
    

}

- (void)creatTableView
{
    self.DetailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 10, kWidth, detailKHeight*8.5)];
    self.DetailTableView.backgroundColor = [UIColor whiteColor];
    self.DetailTableView.delegate = self;
    self.DetailTableView.dataSource = self;
    self.DetailTableView.scrollEnabled = NO;
    self.DetailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollView addSubview:self.DetailTableView];
    
    //分隔线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.DetailTableView.frame)+10, kWidth, 6)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self.scrollView addSubview:line];

}

- (void)creatChildrenCotroller
{
    self.titleArray = @[@"销售记录",@"基本信息",@"订单信息"];
    
    SalesRecordViewController *SalesRecordVc = [[SalesRecordViewController alloc]init];
    BasicInformationViewController *BasicInformationVc = [[BasicInformationViewController alloc]init];
    OrderInformationViewController *OrderInformationVc = [[OrderInformationViewController alloc]init];
    self.controllerArray = @[SalesRecordVc,BasicInformationVc,OrderInformationVc];
    
}

#pragma mark ---UITableView代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 6) {
        return 10;
    }
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *titleArr = @[@"客户名称:",@"联系电话:",@"客户年龄:",@"预产期:",@"客户意向:",@"备注信息:",@"",@"跟进销售:",@"跟进时间:"];
    NSArray *titleArray = @[@"黄家驹",@"13888888888",@"38",@"2017年8月8日",@"意向一般",@"妈妈很爱干净",@"",@"李丽丽",@"2017年7月12日"];
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[DetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId TitleOne:titleArr[indexPath.row] TitleTwo:titleArray[indexPath.row]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.userInteractionEnabled = NO;
    return cell;
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
