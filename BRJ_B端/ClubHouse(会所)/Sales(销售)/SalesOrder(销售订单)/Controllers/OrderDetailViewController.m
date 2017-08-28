//
//  OrderDetailViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/14.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "OrderDetailTableViewCell.h"


#define cellHeiht 60
@interface OrderDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *orderDetailTableView;

@property (nonatomic,strong) NSArray *titleArr;

@property (nonatomic,strong) NSArray *detailArr;

@property (nonatomic,strong) NSArray *imageArr;

@property (nonatomic,strong) UIView *footerView;

@property (nonatomic,strong) UIButton *saveBtn;

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNavigation];
    [self creatTableView];
}


- (void)creatNavigation{
    
    UIView *NavView = [[UIView alloc]initWithFrame:CGRectMake(0,0, kWidth, 64)];
    NavView.backgroundColor = [UIColor colorWithHexString:@"#19233A"];
    [self.view addSubview:NavView];
    
    UILabel *NavTitleLab = [Maker makeLb:CGRectMake(0, 20, kWidth, 44)
                                   title:@"订单详情"
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

- (void)creatTableView{
    
    self.orderDetailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, cellHeiht*7+174) style:UITableViewStyleGrouped];
    self.orderDetailTableView.backgroundColor = [UIColor whiteColor];
    self.orderDetailTableView.delegate = self;
    self.orderDetailTableView.dataSource = self;
    
    self.orderDetailTableView.scrollEnabled = YES;
    self.orderDetailTableView.contentSize = CGSizeMake(0, cellHeiht*12);
    self.orderDetailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.orderDetailTableView.tableFooterView = self.footerView;
    self.orderDetailTableView.tableFooterView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.orderDetailTableView];
    
    self.titleArr = @[@"客户名称",@"下单日期",@"入住时间",@"入住天数",@"预订房型",@"",@"预定月嫂",@"预定月子餐",@"宝宝游泳",@"无痛开奶",@"订单金额",@"其他",@"备注"];
    self.detailArr = @[@"赵丽颖",@"2017年7月7日",@"2017年7月7日",@"28天",@"B房型10,000.00元",@"",@"金牌月嫂10,000.00元",@"普通套餐10,000.00元",@"8次",@"2次",@"30,000.00元",@"其他标准服务",@"客户比较注重卫生问题"];
}


#pragma mark ---UITableView的代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 5) {
        return 175;
    }
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [self.orderDetailTableView dequeueReusableCellWithIdentifier:cellId];
    if (indexPath.row == 5) {
        cell = [[OrderDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId Image:@"01"];
    }else{
        cell = [[OrderDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId TitleOne:self.titleArr[indexPath.row] TitleTwo:self.detailArr[indexPath.row] type:1];
    }

    if (!cell) {
        if (indexPath.row == 5) {
            cell = [[OrderDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId Image:@"01"];
        }else{
            cell = [[OrderDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId TitleOne:self.titleArr[indexPath.row] TitleTwo:self.detailArr[indexPath.row] type:1];
        }
    }else{//cell滚出页面加载更多cell时--防止cell数据重复
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
     cell.userInteractionEnabled = NO;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    self.footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 50)];
//        self.footerView.backgroundColor = [UIColor colorWithHexString:@"#EAE7E7"];
    self.footerView.backgroundColor = [UIColor whiteColor];
    [self.orderDetailTableView addSubview:self.footerView];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self.footerView addSubview:line];
    
    self.saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/4, 20, 200, 50)];
    [self.saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    self.saveBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.saveBtn setImage:[UIImage imageNamed:@"baocun-icon"] forState:UIControlStateNormal];
    [self.saveBtn addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
    [self.footerView addSubview:self.saveBtn];

    
    return self.footerView;
}
//设置footerview高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 80;
}
//设置headerview高度为0.01
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

//保存按钮
- (void)saveAction
{
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
