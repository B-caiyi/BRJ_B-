//
//  ChangeShiftsViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/22.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "ChangeShiftsViewController.h"
#import "ChangeShiftsCollectionViewCell.h"
#import "ChangeShiftsTableViewCell.h"
#import "ConditionCell.h"

@interface ChangeShiftsViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *changeShiftsCollectionView;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *nameArr;

@property (nonatomic,strong) NSArray *roomNumArr;//房间号

@property (nonatomic,strong) NSArray *contentArr;//房间内人员信息

@property (nonatomic,strong) NSArray *descripArr;//

@property (nonatomic,strong) UIView *headerView;//头视图

@property (nonatomic,strong) UIView *footerView;//尾视图

@property (nonatomic,strong) UIButton *nameBtn;

@property (nonatomic,strong) UITextView *textView;

@property (nonatomic,strong) UIButton *saveBtn;

@property (nonatomic,assign) BOOL isSelect;

@end

@implementation ChangeShiftsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNavigation];
//    [self creatCollectionView];
    [self dataSource];
    [self creatTableView];
}

- (void)creatNavigation{
    
    UIView *NavView = [[UIView alloc]initWithFrame:CGRectMake(0,0, kWidth, 64)];
    NavView.backgroundColor = [UIColor colorWithHexString:@"#19233A"];
    [self.view addSubview:NavView];
    
    UILabel *NavTitleLab = [Maker makeLb:CGRectMake(0, 20, kWidth, 44)
                                   title:@"交接班"
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

//创建tableView
- (void)creatTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight-64) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = self.footerView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}
- (void)dataSource
{
    self.nameArr = [NSArray array];
    self.roomNumArr = [NSArray array];
    self.contentArr = [NSArray array];
    self.descripArr = [NSArray array];
    
    self.nameArr = @[@"赵丽颖",@"杨幂",@"古力娜扎",@"迪丽热巴",@"刘诗诗",@"赵丽颖",@"杨幂",@"古力娜扎"];
    self.roomNumArr = @[@"8201",@"8203"];
    self.contentArr = @[@"宝宝脐带渗血",@"妈妈伤口有感染状况,请注意!"];
    self.descripArr = @[@"妈妈10人,宝宝10人"];
    
}

#pragma mark ---UITableView代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        _isSelect = !_isSelect;
        if (_isSelect) {
            return 1;
        }else{
            return 0;
        }
    }
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 60;
    }else if (indexPath.section == 1 && indexPath.row == 1){
        return 60;
    }
    else if (indexPath.section == 1 && indexPath.row == 2) {
        return 160;
    }
    ConditionCell *cell = (ConditionCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    ChangeShiftsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
    if (indexPath.section == 0) {
        if (!cell) {
            cell = [[ChangeShiftsTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId type:1];
            [cell configWithTitle:self.roomNumArr[indexPath.row] contentTitle:self.contentArr[indexPath.row]];
        }
        return cell;
    }else if (indexPath.section == 1){
        
        if (!cell) {
            if (indexPath.row == 0) {
                ConditionCell *cell = [ConditionCell conditionCellWithTableView:tableView];
                [cell configWithConditions:@[
                                             @{@"num": @"8201", @"condition": @"宝宝脐部渗血"},
                                             @{@"num": @"8201", @"condition": @"宝宝脐部渗血"},
                                             @{@"num": @"8201", @"condition": @"宝宝脐部渗血"},
                                             @{@"num": @"8201", @"condition": @"宝宝脐部渗血"},
                                             @{@"num": @"8201", @"condition": @"宝宝脐部渗血"},
                                             @{@"num": @"8201", @"condition": @"宝宝脐部渗血"},]];
                return cell;
            }
            
            else if (indexPath.row == 1){
                cell = [[ChangeShiftsTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId type:2];
                cell.descrip.text = @"妈妈10人,宝宝10人";
                return cell;
            }
            else if(indexPath.row == 2){
                cell = [[ChangeShiftsTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId type:3];
                cell.nameArray = self.nameArr;
                return cell;
            }
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
//头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    [self.tableView addSubview:self.headerView];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 44)];
    view.backgroundColor = [UIColor whiteColor];
    [self.tableView addSubview:view];
    self.headerView = view;
    if (section == 0) {
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
        line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
        [view addSubview:line];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(12, 1, kWidth-37, 59)];
        btn.backgroundColor = [UIColor whiteColor];
        
        NSString *title = [NSString stringWithFormat:@"护理异常消息共%li项", self.nameArr.count];
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:[UIColor colorWithHexString:@"#212F4D"] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
        _isSelect = !_isSelect;
        [view addSubview:btn];
        
    }
    return self.headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 60;
    }
    return 0.01;
}
//尾视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    [self.tableView addSubview:self.footerView];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 10, kWidth, 44)];
    view.backgroundColor = [UIColor whiteColor];
    [self.tableView addSubview:view];
    self.footerView = view;
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [view addSubview:line];
    
    if (section == 1) {
        
        UILabel *remarkLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, kWidth-24, 30)];
        remarkLab.text = @"添加其他备注信息";
        remarkLab.font = [UIFont systemFontOfSize:14];
        remarkLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
        [view addSubview:remarkLab];
        
        self.textView = [[UITextView alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(remarkLab.frame)+5, kWidth-24, 93)];
        self.textView.font = [UIFont systemFontOfSize:14];
        self.textView.backgroundColor = [UIColor colorWithHexString:@"#FAFAFA"];
        [view addSubview:self.textView];
        
        //分隔线
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textView.frame)+10, kWidth, 1)];
        line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
        [view addSubview:line];
        
        self.saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(line.frame)+10, kWidth-24, 50)];
        [self.saveBtn setImage:[UIImage imageNamed:@"jiaojieban_icon copy"] forState:UIControlStateNormal];
        [self.saveBtn addTarget:self action:@selector(saveBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:self.saveBtn];
    }
    return self.footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.01;
    }
    return 230;
}
//护理消息异常按钮
- (void)btnClicked{
    NSLog(@"点击展开列表");
    _isSelect = !_isSelect;
    
    [self.tableView reloadData];
}

//保存按钮
- (void)saveBtnClicked{
    NSLog(@"点击保存");
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
