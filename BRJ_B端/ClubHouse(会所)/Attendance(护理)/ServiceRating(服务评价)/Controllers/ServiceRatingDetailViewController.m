//
//  ServiceRatingDetailViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/21.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "ServiceRatingDetailViewController.h"
#import "ServiceRatingDetailTableViewCell.h"

@interface ServiceRatingDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSString *imageStr;//图片

@property (nonatomic,strong) NSString *nameStr;//名字

@property (nonatomic,strong) NSString *roomNumStr;//房间号

@end

@implementation ServiceRatingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNavigation];
    [self creatTableView];
    [self dataSource];
}

- (void)creatNavigation{
    
    UIView *NavView = [[UIView alloc]initWithFrame:CGRectMake(0,0, kWidth, 64)];
    NavView.backgroundColor = [UIColor colorWithHexString:@"#19233A"];
    [self.view addSubview:NavView];
    
    UILabel *NavTitleLab = [Maker makeLb:CGRectMake(0, 20, kWidth, 44)
                                   title:@"评价详情"
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


- (void)creatTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
}

- (void)dataSource{

    self.imageStr = @"01";
    NSString *name = @"赵丽颖";
    self.nameStr = [NSString stringWithFormat:@"评价人:%@",name];
    NSString *roomNum = @"201";
    self.roomNumStr = [NSString stringWithFormat:@"房间号:%@",roomNum];

}

#pragma mark ---UITableView代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return (kWidth-24)/1.78+20;
    }
    return 85;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    ServiceRatingDetailTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
    if (indexPath.section == 0) {
        if (!cell) {
            cell = [[ServiceRatingDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId type:2];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell configImage:@"01"];
        return cell;
    }else if (indexPath.section == 1){
        if (!cell) {
            cell = [[ServiceRatingDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId type:1];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell configCellImage:self.imageStr name:self.nameStr roomNum:self.roomNumStr];
        return cell;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 50;
    }
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 50)];
        headerView.backgroundColor = [UIColor whiteColor];
        [self.tableView addSubview:headerView];
        
        UILabel*titleLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, kWidth-24, 30)];
        titleLab.text = @"护理师24小时1对1服务";
        titleLab.font = [UIFont systemFontOfSize:14];
        titleLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
        [headerView addSubview:titleLab];
        
        return headerView;
    }else if (section == 1){
        
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 80;
    }
    return 120;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(12, 10, kWidth-24, 120)];
    footerView.backgroundColor = [UIColor whiteColor];
    [self.tableView addSubview:footerView];
    if (section == 0) {
        UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 3, kWidth-24, 30)];
        titleLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
        titleLab.text = @"服务内容";
        titleLab.font = [UIFont systemFontOfSize:14];
        [footerView addSubview:titleLab];
        
        UILabel *contentLab = [[UILabel alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(titleLab.frame)-3, kWidth-24, 44)];
        contentLab.text = @"一对一的母婴护理师负责照顾宝宝和妈妈的日常生活需要,提供24小时的全方位贴身服务";
        contentLab.numberOfLines = 2;
        contentLab.textColor = [UIColor colorWithHexString:@"#8F96A6"];
        contentLab.font = [UIFont systemFontOfSize:12];
        [footerView addSubview:contentLab];
    }else if (section == 1){
        UILabel *contentLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 0, kWidth-24, 70)];
        contentLab.textColor = [UIColor colorWithHexString:@"#8F96A6"];
        contentLab.text = @"已经给客户道歉并更换已经给客户道歉并更换已经给客户道歉并更换已经给客户道歉并更换已经给客户道歉并更换已经给客户道歉并更换已经给客户道歉并更换已经给客户道歉并更换已经给客户道歉并更换已经给客户道歉并更换已经给客户道歉并更换";
        contentLab.font = [UIFont systemFontOfSize:12];
        contentLab.numberOfLines = 4;
        [footerView addSubview:contentLab];
        
        UILabel *dateLab = [[UILabel alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(contentLab.frame)+10, kWidth-24, 50)];
        dateLab.text = @"2017年8月21日";
        dateLab.numberOfLines = 2;
        dateLab.textColor = [UIColor colorWithHexString:@"#8F96A6"];
        dateLab.font = [UIFont systemFontOfSize:12];
        [footerView addSubview:dateLab];
    
    }
    return footerView;

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
