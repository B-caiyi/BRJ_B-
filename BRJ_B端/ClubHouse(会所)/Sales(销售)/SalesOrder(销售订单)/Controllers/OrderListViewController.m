//
//  OrderListViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/14.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "OrderListViewController.h"
#import "customListBtn.h"
#import "OrderListTableViewCell.h"
#import "OrderDetailViewController.h"
#import "NewOrderViewController.h"

@interface OrderListViewController ()<UISearchBarDelegate,UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UISearchBar *searchBar;

@property (nonatomic,strong) UISearchController *searchController;

@property (nonatomic,strong) UITableView *orderTableView;

@property (nonatomic,strong) NSArray *bigImageArr;

@property (nonatomic,strong) NSArray *labelImageArr;

@property (nonatomic,strong) NSArray *nameArr;

@property (nonatomic,strong) NSArray *stataArr;

@property (nonatomic,strong) NSArray *orderNumArr;

@property (nonatomic,strong) NSArray *orderAmtAtr;

@property (nonatomic,strong) NSArray *salesNameAtr;

@property (nonatomic,strong) NSArray *salesDataAtr;


@end

@implementation OrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNavigationWithSearchBar];
    [self MakeUIWithSequenceAndSelect];
    [self creatTableView];
    
    [self dataSource];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.orderTableView reloadData];
}

#pragma mark ---创建搜索框
- (void)creatNavigationWithSearchBar
{
    //背景
    UIView *NavView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    NavView.backgroundColor = [UIColor colorWithHexString:@"#19233A"];
    [self.view addSubview:NavView];
    
    CGFloat width=kWidth-100;
    //搜索框
    self.searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(50, 20, width, 44)];
    self.searchBar.barStyle=UISearchBarStyleDefault;
    self.searchBar.layer.cornerRadius = 5;
    self.searchBar.clipsToBounds = YES;
    self.searchBar.placeholder=@"搜索客户";
    self.searchBar.barTintColor=[UIColor whiteColor];
    self.searchBar.delegate=self;
    //返回按钮
    UIButton *backBtn=[Maker makeBtn:CGRectMake(15, 25, 20, 34)
                               title:nil
                                 img:@"fanhui-icon"
                                font:nil
                              target:self
                              action:@selector(back)];
    [NavView addSubview:backBtn];
    
    //新建客户
    UIButton *ContactsBtn = [Maker makeBtn:CGRectMake(kWidth-15-40, 25, 40, 35) title:nil img:@"xinjian-icon" font:nil target:self action:@selector(NewOrderAction)];
    [NavView addSubview:ContactsBtn];
    
    //去掉UISearchBar的背景视图
    UIView *sub=[[[_searchBar.subviews firstObject] subviews] firstObject];
    [sub removeFromSuperview];
    //改变输入框颜色
    UITextField *searchTextField =(UITextField *)[[[_searchBar.subviews firstObject] subviews] lastObject];
    searchTextField.font=[UIFont systemFontOfSize:13];
    _searchController = [[UISearchController alloc]init];
    _searchController.searchResultsUpdater = self;
    [NavView addSubview:_searchBar];
}

//返回按钮
- (void)back
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

//新建客户按钮
- (void)NewOrderAction{
    NewOrderViewController *NewOrderVc = [[NewOrderViewController alloc]init];
    NewOrderVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:NewOrderVc animated:YES];
    
}


//排序和筛选按钮
- (void)MakeUIWithSequenceAndSelect{
    
    UIView *btnView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kWidth, 45)];
    btnView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btnView];
    
    UIButton *sequenBtn = [[customListBtn alloc]initWithFrame:CGRectMake(0, 0, kWidth/2, 44) title:@"排序" image:@"paixu-icon" target:self action:@selector(sequenAction)];
    sequenBtn.tag = 1001;
    sequenBtn.userInteractionEnabled = YES;
    [btnView addSubview:sequenBtn];
    
    UIButton *filterBtn = [[customListBtn alloc]initWithFrame:CGRectMake(kWidth/2-90, 0, kWidth/2, 44) title:@"筛选" image:@"shaixuan-icon" target:self action:@selector(filterAction)];
    filterBtn.tag = 1002;
    filterBtn.userInteractionEnabled = YES;
    [btnView addSubview:filterBtn];
   
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 43, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [btnView addSubview:line];
}
//排序点击事件
- (void)sequenAction{
    NSLog(@"点击排序");
}
//筛选点击事件
- (void)filterAction{
    NSLog(@"点击筛选");
}


#pragma mark ---创建tableView
- (void)creatTableView{
    
    self.orderTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 108, kWidth, kHeight-108) style:UITableViewStylePlain];
    self.orderTableView.backgroundColor = [UIColor whiteColor];
    self.orderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.orderTableView.dataSource = self;
    self.orderTableView.delegate = self;
    [self.view addSubview:self.orderTableView];
}

- (void)dataSource {
    self.bigImageArr = @[@"01",@"02",@"03",@"04",@"05",@"06"];
    self.labelImageArr = @[@"tejiafang_biaoqian",@"",@"tejiafang_biaoqian",@"",@"tejiafang_biaoqian",@"tejiafang_biaoqian"];
    self.nameArr = @[@"客户名称:赵丽颖",@"客户名称:赵丽颖",@"客户名称:赵丽颖",@"客户名称:赵丽颖",@"客户名称:赵丽颖",@"客户名称:赵丽颖"];
    self.stataArr = @[@"状态:已创建",@"状态:已审批",@"状态:已创建",@"状态:已拒绝",@"状态:已审批",@"状态:已创建"];
    self.orderNumArr = @[@"订单编号:20170814185412",@"订单编号:20170814185413",@"订单编号:20170814185414",@"订单编号:20170814185415",@"订单编号:20170814185416",@"订单编号:20170814185412"];
    self.orderAmtAtr = @[@"订单金额:11210元",@"订单金额:10886元",@"订单金额:100870元",@"订单金额:9600元",@"订单金额:11210元",@"订单金额:11210元"];
    self.salesNameAtr = @[@"签单销售:陈伟霆",@"签单销售:陈伟霆",@"签单销售:陈伟霆",@"签单销售:陈伟霆",@"签单销售:陈伟霆",@"签单销售:陈伟霆"];
    self.salesDataAtr = @[@"签单日期:2017年7月17日",@"签单日期:2017年7月17日",@"签单日期:2017年7月17日",@"签单日期:2017年7月17日",@"签单日期:2017年7月17日",@"签单日期:2017年7月17日"];
    [self.orderTableView reloadData];
}

#pragma mark ---UITableView的代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 132;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    OrderListTableViewCell *cell = [self.orderTableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[OrderListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell configBigImage:self.bigImageArr[indexPath.row] labelImage:self.labelImageArr[indexPath.row] Name:self.nameArr[indexPath.row] Status:self.stataArr[indexPath.row] orderNum:self.orderNumArr[indexPath.row] orderAmt:self.orderAmtAtr[indexPath.row] saleName:self.salesNameAtr[indexPath.row] salesData:self.salesDataAtr[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderDetailViewController *OrderDetailVc = [[OrderDetailViewController alloc]init];
    OrderDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:OrderDetailVc animated:YES];
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
