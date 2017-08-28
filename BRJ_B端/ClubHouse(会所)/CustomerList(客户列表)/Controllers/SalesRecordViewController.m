//
//  SalesRecordViewController.m
//  BRJ_B端
//
//  Created by caiyi on 2017/8/9.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "SalesRecordViewController.h"
#import "DetailTableViewCell.h"
#import "customListBtn.h"
#import "CreateActionViewController.h"

#define cellKHeight 70
@interface SalesRecordViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIView *headerView;

@property (nonatomic,strong) UIButton *NewActionBtn;//新建行动按钮

@property (nonatomic,strong) UIImageView *ImageView;//新建行动"+"图片容器

@end

@implementation SalesRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initHeaderView];
    [self creatTableView];
}

- (void)creatTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.contentSize = CGSizeMake(0, cellKHeight*5);
    [self.view addSubview:self.tableView];
}

- (void)initHeaderView
{
    //"+"号图片
    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, cellKHeight-26)];
    self.headerView.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self.view addSubview:self.headerView];
    
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth/3+20, 15, 12, 12)];
    self.ImageView.image = [UIImage imageNamed:@"NewAction_jiahao"];
    [self.headerView addSubview:self.ImageView];
    //新建行动按钮
    self.NewActionBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)-20, 0, kWidth/3-12, cellKHeight-26)];
    [self.NewActionBtn setTitle:@"新建行动" forState:UIControlStateNormal];
    [self.NewActionBtn setTitleColor:[UIColor colorWithHexString:@"#212F4D"] forState:UIControlStateNormal];
    self.NewActionBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.NewActionBtn addTarget:self action:@selector(NewAction) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:self.NewActionBtn];
    
}

- (void)NewAction{
    NSLog(@"新建行动");
    CreateActionViewController *CreateActionVc = [[CreateActionViewController alloc]init];
    CreateActionVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:CreateActionVc animated:YES];
    
}
#pragma mark ---UITableView代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellId = @"cellId";
    NSArray *dataArr = @[@"7月12日 12:00",@"7月12日 12:00",@"7月12日 12:00",@"7月12日 12:00"];
    NSArray *titleArr = @[@"参观会所",@"试吃月子餐",@"电话沟通",@"电话沟通"];
    NSArray *detailArr = @[@"在会所成功签单",@"第一次参观会所",@"",@""];
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
    
    cell = [[DetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId TitleOne:dataArr[indexPath.row] TitleTwo:titleArr[indexPath.row] TitleThree:detailArr[indexPath.row] type:1];
    if (!cell) {
        cell = [[DetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId TitleOne:dataArr[indexPath.row] TitleTwo:titleArr[indexPath.row] TitleThree:detailArr[indexPath.row] type:1];
        
    }else{
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
