//
//  OrderInformationViewController.m
//  BRJ_B端
//
//  Created by caiyi on 2017/8/9.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "OrderInformationViewController.h"
#import "DetailTableViewCell.h"

#define cellKHeight 60
@interface OrderInformationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;



@end

@implementation OrderInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatTableView];
}


-(void)creatTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, cellKHeight*6.55-30) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentSize = CGSizeMake(0, cellKHeight*13);
    [self.view addSubview:self.tableView];
}

#pragma mark ---UITableView代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    NSArray *titleArr = @[@"订单编号",@"签单时间",@"订单金额",@"押金",@"已收款",@"套餐名称",@"选购房型",@"选购月嫂",@"选购月子餐",@"宝宝游泳",@"无痛开奶",@"其他"];
    NSArray *contentArr = @[@"201708101127",@"2017年8月10号",@"58,000元",@"3,000元",@"25,000元",@"豪华精致月子房",@"A级高端豪华套房15,088元",@"B级优质月嫂20,000元",@"C级普通月子餐9,000元",@"6次",@"10次",@"自带增值服务"];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
    
     cell = [[DetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId TitleOne:titleArr[indexPath.row] TitleTwo:contentArr[indexPath.row] TitleThree:@"" type:3];
    
    if (!cell) {
        cell = [[DetailTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId TitleOne:titleArr[indexPath.row] TitleTwo:contentArr[indexPath.row] TitleThree:@"" type:3];
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
