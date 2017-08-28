//
//  CreateActionViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/8.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "CreateActionViewController.h"
#import "AddNewCustomerTableViewCell.h"

#define cellKHeight 60
@interface CreateActionViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIButton *saveBtn;

@property (nonatomic,strong) UIView *footerView;

@end

@implementation CreateActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNavigation];
    [self initUI];
}

- (void)creatNavigation{
    
    UIView *NavView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    NavView.backgroundColor = [UIColor colorWithHexString:@"#19233A"];
    [self.view addSubview:NavView];
    
    UILabel *NavTitleLab = [Maker makeLb:CGRectMake(0, 20, kWidth, 44)
                                   title:@"创建行动"
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

- (void)initUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight-64) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];

//    CAGradientLayer *layerRGB = [CAGradientLayer layer];
//    layerRGB.frame = btnView.frame;
//    layerRGB.startPoint = CGPointMake(0, 0);
//    layerRGB.endPoint = CGPointMake(1, 0);
//    layerRGB.colors = @[(__bridge id)[UIColor colorWithRed:86/255.0 green:194/255.0 blue:187/255.0 alpha:1].CGColor,(__bridge id)[UIColor colorWithRed:47/255.0 green:191/255.0 blue:215/255.0 alpha:1].CGColor];
//    [btnView.layer addSublayer:layerRGB];

}
#pragma mark ---UITableView代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *titleArr = @[@"客户名称",@"",@"行动时间",@"行动内容"];
    NSArray *holderTitleArr = @[@"必填",@"",@"必填",@"必填"];
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (indexPath.row == 1) {
        cell = [[AddNewCustomerTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId type:2];
    }else{
        cell = [[AddNewCustomerTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId title:titleArr[indexPath.row] placeholder:holderTitleArr[indexPath.row] type:2];
        
    }
    if (!cell) {
        
        if (indexPath.row == 1) {
            cell = [[AddNewCustomerTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId type:2];
        }else{
            cell = [[AddNewCustomerTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId title:titleArr[indexPath.row] placeholder:holderTitleArr[indexPath.row] type:2];
            
        }
    }else{//cell滚出页面加载更多cell时--防止cell数据重复
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    self.footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 50)];
    //        self.footerView.backgroundColor = [UIColor colorWithHexString:@"#EAE7E7"];
    self.footerView.backgroundColor = [UIColor whiteColor];
    [self.tableView addSubview:self.footerView];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self.footerView addSubview:line];
    
    self.saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/4, cellKHeight*5, 200, 50)];
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
    return cellKHeight*6;
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
