//
//  AddNewCustomerViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/7.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "AddNewCustomerViewController.h"
#import "AddNewCustomerTableViewCell.h"


#define BtnkHeight 44
@interface AddNewCustomerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *titleArr;

@property (nonatomic,strong) NSArray *holderTitleArr;

@property (nonatomic,strong) UIView *footerView;

@property (nonatomic,strong) UIButton *saveBtn;

@property (nonatomic,strong) UIButton *moreBtn;

@property (nonatomic,assign) BOOL isOpen;

@property (nonatomic,assign) NSInteger titleNum;

@end

@implementation AddNewCustomerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatNavigation];
    [self creatTableView];
//    [self creatFooterView];
    
    
}

- (void)creatNavigation{
    
    UIView *NavView = [[UIView alloc]initWithFrame:CGRectMake(0,0, kWidth, 64)];
    NavView.backgroundColor = [UIColor colorWithHexString:@"#19233A"];
    [self.view addSubview:NavView];
    
    UILabel *NavTitleLab = [Maker makeLb:CGRectMake(0, 20, kWidth, 44)
                                   title:@"新建客户"
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
   
    
    self.tabBarController.tabBar.hidden = YES;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, BtnkHeight*12+84) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = YES;
    self.tableView.contentSize = CGSizeMake(0, BtnkHeight*18);
    [self.view addSubview:self.tableView];
    
    //分隔线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self.tableView addSubview:line];
    
    self.titleArr = @[@"客户名称*",@"联系电话",@"客户年龄",@"预产期",@"",@"备注信息",@"客户来源",@"生产医院",@"住院房间",@"家庭住址",@"微信号",@"邮箱号",@"QQ号",@"紧急联系人"];
    self.holderTitleArr = @[@"必填",@"必填",@"必填",@"必填",@"必填",@"必填",@"必填",@"选填",@"选填",@"选填",@"选填",@"选填",@"选填",@"选填",@"选填"];
    self.tableView.tableFooterView = self.footerView;
    
    
}

//- (void)creatFooterView{
//
//    self.footerView = [[UIView alloc]initWithFrame:CGRectMake(0, BtnkHeight*10+3, kWidth, BtnkHeight*4+20)];
//    self.footerView.backgroundColor = [UIColor colorWithHexString:@"#EAE7E7"];
//    [self.tableView addSubview:self.footerView];
//    
//    self.moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth-72, 16, 60, 30)];
//    [self.moreBtn setTitle:@"显示更多" forState:UIControlStateNormal];
//    [self.moreBtn setTitleColor:[UIColor colorWithHexString:@"#159695"] forState:UIControlStateNormal];
//    self.moreBtn.titleLabel.font = [UIFont systemFontOfSize:12];
//    self.moreBtn.backgroundColor = [UIColor colorWithHexString:@"#EAE7E7"];
//    [self.moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.footerView addSubview:self.moreBtn];
//    
//    self.saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/4, BtnkHeight*2, 200, 50)];
//    [self.saveBtn setTitle:@"保存" forState:UIControlStateNormal];
//    self.saveBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//    [self.saveBtn setImage:[UIImage imageNamed:@"baocun-icon"] forState:UIControlStateNormal];
//    [self.saveBtn addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.footerView addSubview:self.saveBtn];
//    
//}

- (void)moreBtnClick:(UIButton *)sender{
    
    NSLog(@"点击展开更多或者收回");
    
    _isOpen = !_isOpen;
    if (_isOpen) {
        [sender setTitle:@"收起" forState:(UIControlStateNormal)];
    }else{
        self.titleNum = _titleArr.count;
        [sender setTitle:@"显示更多" forState:(UIControlStateNormal)];
    }
    [self.tableView reloadData];
//    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:(UITableViewRowAnimationAutomatic)];
}

- (void)saveAction
{
    NSLog(@"点击保存");
}

#pragma mark ---UITableView的代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_isOpen) {
        return self.titleArr.count;
    }
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (indexPath.row == 4) {
        cell = [[AddNewCustomerTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId type:1];
    }else {
        cell = [[AddNewCustomerTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId title:self.titleArr[indexPath.row] placeholder:self.holderTitleArr[indexPath.row] type:1];
    }


    if (!cell) {
        if (indexPath.row == 4) {
            cell = [[AddNewCustomerTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId type:1];
        }else {
            cell = [[AddNewCustomerTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId title:self.titleArr[indexPath.row] placeholder:self.holderTitleArr[indexPath.row] type:1];
        }
        
    }else{
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
    //显示更多
    self.moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth-72, 16, 60, 30)];
    if (_isOpen) {
        [self.moreBtn setTitle:@"收起" forState:UIControlStateNormal];
    }else{
        [self.moreBtn setTitle:@"显示更多" forState:UIControlStateNormal];
    }
    
    [self.moreBtn setTitleColor:[UIColor colorWithHexString:@"#159695"] forState:UIControlStateNormal];
    self.moreBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.footerView addSubview:self.moreBtn];

    
    self.saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/4, 60, 200, 50)];
    [self.saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    self.saveBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.saveBtn setImage:[UIImage imageNamed:@"baocun-icon"] forState:UIControlStateNormal];
    [self.saveBtn addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
    [self.footerView addSubview:self.saveBtn];
    return self.footerView;
}

//设置footerview高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 140;
}

//设置headerview高度为0.01
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
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
