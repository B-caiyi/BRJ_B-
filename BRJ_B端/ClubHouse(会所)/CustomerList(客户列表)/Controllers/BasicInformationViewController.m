//
//  BasicInformationViewController.m
//  BRJ_B端
//
//  Created by caiyi on 2017/8/9.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "BasicInformationViewController.h"
#import "DetailTableViewCell.h"


#define cellKHeight 60
@interface BasicInformationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;


@end

@implementation BasicInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatTableView];
}

- (void)creatTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, cellKHeight*6.55-30) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentSize = CGSizeMake(0, cellKHeight*13);
    [self.view addSubview:self.tableView];
    
}

#pragma mark ---UITableView代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 13;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellId";
    NSArray *titleArr = @[@"客户名称",@"联系电话",@"客户年龄",@"客户预产期",@"客户意向",@"备注信息",@"客户来源",@"生产医院",@"住院房间",@"家庭住址",@"微信号",@"邮箱号",@"紧急联系人"];
    NSArray *contentArr = @[@"黄家驹",@"13888888888",@"38",@"2017年8月21日",@"意向一般",@"妈妈比较爱干净",@"大众点评",@"上海妇产医院",@"产科201室",@"上海市黄浦区208弄",@"13888888888",@"13888888888@qq.com",@"18999999999"];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
    
    cell = [[DetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId TitleOne:titleArr[indexPath.row] TitleTwo:contentArr[indexPath.row] TitleThree:@"" type:2];
    
    if (!cell) {
        cell = [[DetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId TitleOne:titleArr[indexPath.row] TitleTwo:contentArr[indexPath.row] TitleThree:@"" type:2];
    }else{//cell滚出页面加载更多cell时--防止cell数据重复
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
