//
//  ServiceRatingViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/21.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "ServiceRatingViewController.h"
#import "customListBtn.h"
#import "ServiceRatingTableViewCell.h"
#import "ServiceRatingDetailViewController.h"

@interface ServiceRatingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *imageArr;//图片数组

@property (nonatomic,strong) NSArray *nameArr;//客户名称数组

@property (nonatomic,strong) NSArray *contentArr;//内容数组

@property (nonatomic,strong) NSArray *dateArr;//日期数组

@end

@implementation ServiceRatingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNavigation];
    [self MakeUIWithSequenceAndSelect];
    [self creatTableView];
    [self dataSource];
    
}

- (void)creatNavigation{
    
    UIView *NavView = [[UIView alloc]initWithFrame:CGRectMake(0,0, kWidth, 64)];
    NavView.backgroundColor = [UIColor colorWithHexString:@"#19233A"];
    [self.view addSubview:NavView];
    
    UILabel *NavTitleLab = [Maker makeLb:CGRectMake(0, 20, kWidth, 44)
                                   title:@"服务评价"
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

//排序和筛选按钮
- (void)MakeUIWithSequenceAndSelect{
    
    UIView *btnView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kWidth, 44)];
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

//创建UITableView
- (void)creatTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 108, kWidth, kHeight-108) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}

- (void)dataSource
{
    self.imageArr = @[@"01",@"02",@"03",@"04",@"01",@"02"];
    self.nameArr = @[@"赵丽颖",@"赵丽颖",@"杨幂",@"迪丽热巴",@"古力娜扎",@"刘诗诗"];
    self.contentArr = @[@"服务很到位,不过希望下次能准时过来服务.服务很到位,不过希望下次能准时过来服务.",@"服务很到位,不过希望下次能准时过来服务.服务很到位,不过希望下次能准时过来服务.",@"服务很到位,不过希望下次能准时过来服务.服务很到位,不过希望下次能准时过来服务.",@"服务很到位,不过希望下次能准时过来服务.服务很到位,不过希望下次能准时过来服务.服务很到位,不过希望下次能准时过来服务.",@"服务很到位,不过希望下次能准时过来服务.服务很到位,不过希望下次能准时过来服务.",@"服务很到位,不过希望下次能准时过来服务."];
    self.dateArr = @[@"2017年8月18日",@"2017年8月18日",@"2017年8月18日",@"2017年8月18日",@"2017年8月18日",@"2017年8月18日"];
}
#pragma mark ---UITableView的代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"cellId";
    
    ServiceRatingTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[ServiceRatingTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellid];
    }
    
    [cell configCellDataWithImage:self.imageArr[indexPath.row] name:self.nameArr[indexPath.row] content:self.contentArr[indexPath.row] date:self.dateArr[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ServiceRatingDetailViewController *ServiceRatingDetailVc = [[ServiceRatingDetailViewController alloc]init];
    ServiceRatingDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ServiceRatingDetailVc animated:YES];
    
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
