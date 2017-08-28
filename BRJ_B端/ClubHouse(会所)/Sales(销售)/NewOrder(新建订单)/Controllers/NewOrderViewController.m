//
//  NewOrderViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/14.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "NewOrderViewController.h"
#import "OrderProductCollectionViewCell.h"
#import "OrderProductTableViewCell.h"

#define cellHeight 44
@interface NewOrderViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UICollectionView *NewOrderCollectionView;

@property (nonatomic,strong) UIView *orderProductView;

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *sectionOneArr;
@property (nonatomic,strong) NSArray *sectionOneArr1;
@property (nonatomic,strong) NSArray *sectionOneArr2;

@property(nonatomic,strong) NSArray *sectionTwoArr;
@property(nonatomic,strong) NSArray *sectionTwoArr1;
@property(nonatomic,strong) NSArray *sectionTwoArr2;

@property (nonatomic,strong) NSArray *sectionThirdArr;
@property (nonatomic,strong) NSArray *sectionThirdArr1;
@property (nonatomic,strong) NSArray *sectionThirdArr2;

@property (nonatomic,strong) NSArray *sectionFourArr;

@property (nonatomic,strong) NSArray *sectionFiveArr;

@property (nonatomic,strong) NSArray *titleArr;//标题

@property (nonatomic,strong) NSArray *holderTitleArr;//背景文字

@property (nonatomic,strong) NSArray *productNameArr;

@property (nonatomic,strong) NSArray *numberArr;

@property (nonatomic,strong) UIView *footerView;//尾视图

@property (nonatomic,strong) UIButton *saveBtn;

@property (nonatomic,strong) UIImageView *ImageView;

@end

@implementation NewOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNavigation];
    [self creatCollectionView];
    [self creatTableView];
}


- (void)creatNavigation{
    
    UIView *NavView = [[UIView alloc]initWithFrame:CGRectMake(0,0, kWidth, 64)];
    NavView.backgroundColor = [UIColor colorWithHexString:@"#19233A"];
    [self.view addSubview:NavView];
    
    UILabel *NavTitleLab = [Maker makeLb:CGRectMake(0, 20, kWidth, 44)
                                   title:@"新建订单"
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

- (void)creatTableView{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight-64) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = YES;
    self.tableView.contentSize = CGSizeMake(0, kHeight*2);
//    self.tableView.tableHeaderView = self.tableView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    
}

#pragma mark ---UITableView代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }if (section == 1) {
        return 2;
    }
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (indexPath.section == 0) {
        self.titleArr = @[@"客户名称",@"下单日期",@"入住时间"];
        self.holderTitleArr = @[@"必填",@"必填",@"选填",@""];
        if (indexPath.row == 3) {
            cell = [[OrderProductTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId type:1];
            if (!cell) {
                cell = [[OrderProductTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId type:1];
            }
        }else{
            cell = [[OrderProductTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId title:self.titleArr[indexPath.row] placeholder:self.holderTitleArr[indexPath.row] DetailTitle:nil image:@"qingkongshuru-icon" type:1];
            if (cell == nil) {
                cell = [[OrderProductTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId title:self.titleArr[indexPath.row] placeholder:self.holderTitleArr[indexPath.row] DetailTitle:nil image:@"qingkongshuru-icon" type:1];
            }
        }
    }
    if (indexPath.section == 1) {
        self.titleArr = @[@"增值产品",@""];
        self.productNameArr = @[@"宝宝游泳",@"无痛开奶"];
        self.numberArr = @[@"8",@"2"];
        cell = [[OrderProductTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId Title:self.titleArr[indexPath.row] ProductTitle:self.productNameArr[indexPath.row] NumTitle:self.numberArr[indexPath.row]];
        if (!cell) {
            cell = [[OrderProductTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId Title:self.titleArr[indexPath.row] ProductTitle:self.productNameArr[indexPath.row] NumTitle:self.numberArr[indexPath.row]];
        }
    }if (indexPath.section == 2) {
        
        self.titleArr = @[@"订单金额",@"备注信息"];
        self.holderTitleArr = @[@"必填",@"必填"];
        
        if (indexPath.row == 0) {
            cell = [[OrderProductTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId title:self.titleArr[indexPath.row] placeholder:self.holderTitleArr[indexPath.row] DetailTitle:@"元" image:nil type:2];
            if (!cell) {
                cell = [[OrderProductTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId title:self.titleArr[indexPath.row] placeholder:self.holderTitleArr[indexPath.row] DetailTitle:@"元" image:nil type:2];
            }
        }else{
            
            cell = [[OrderProductTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId title:self.titleArr[indexPath.row] placeholder:self.holderTitleArr[indexPath.row] DetailTitle:nil image:nil type:2];
            if (!cell) {
                cell = [[OrderProductTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId title:self.titleArr[indexPath.row] placeholder:self.holderTitleArr[indexPath.row] DetailTitle:nil image:nil type:2];

            }
        
        }
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    if (section == 0) {
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, cellHeight*6, kWidth, 1)];
        line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
        [self.orderProductView addSubview:line];
        return self.orderProductView;

    }if (section == 1) {
        
    }
    
    if (section == 2) {
        self.footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 50)];
        //        self.footerView.backgroundColor = [UIColor colorWithHexString:@"#EAE7E7"];
        self.footerView.backgroundColor = [UIColor whiteColor];
        [self.tableView addSubview:self.footerView];
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
        line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
        [self.footerView addSubview:line];
        
        
        self.saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth/4, 60, 200, 50)];
        [self.saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        self.saveBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.saveBtn setImage:[UIImage imageNamed:@"baocun-icon"] forState:UIControlStateNormal];
        [self.saveBtn addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
        [self.footerView addSubview:self.saveBtn];
        
        return self.footerView;
        
    }
    
    
    return nil;
}

//设置footerview高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 280;
    }if (section == 1) {
        return 0.01;
    }
    return 140;
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

#pragma mark ---创建UICollectionView
//创建collectionView
- (void)creatCollectionView{
    
    self.orderProductView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 250)];
    self.orderProductView.backgroundColor = [UIColor whiteColor];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self.orderProductView addSubview:line];
    
    UILabel *productNameLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 85, 60)];
    productNameLab.text = @"订单产品";
    productNameLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    productNameLab.font = [UIFont systemFontOfSize:16];
    [self.orderProductView addSubview:productNameLab];
    
    self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(productNameLab.frame)+5, 16.5, 3, 27)];
    self.ImageView.image = [UIImage imageNamed:@"xuxian_line"];
    [self.orderProductView addSubview:self.ImageView];

    
//    for (NSInteger i = 0; i < 6; i++) {
//       self.ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(productNameLab.frame)+5, 44*i+10, 3, 24)];
//        self.ImageView.image = [UIImage imageNamed:@"xuxian_line"];
//        [self.orderProductView addSubview:self.ImageView];
//    }
    
    
    
    [self.view addSubview:self.orderProductView];
    
    //collectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.NewOrderCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImageView.frame)+1, 1, kWidth-100, cellHeight*6.5) collectionViewLayout:layout];
    self.NewOrderCollectionView.backgroundColor = [UIColor whiteColor];
    self.NewOrderCollectionView.delegate = self;
    self.NewOrderCollectionView.dataSource = self;
    self.NewOrderCollectionView.userInteractionEnabled = YES;
    self.NewOrderCollectionView.scrollEnabled = NO;
    [self.NewOrderCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [self.orderProductView addSubview:self.NewOrderCollectionView];
    
    self.sectionOneArr = @[@"房型",@"",@"",@"月嫂",@"",@"",@"月子餐",@"",@""];
    self.sectionOneArr1 = @[@"A房型",@"B房型",@"C房型",@"金牌月嫂",@"高级月嫂",@"经济月嫂",@"豪华餐",@"精致餐",@"普通餐"];
    self.sectionOneArr2 = @[@"10,000",@"10,110",@"12,110",@"10,000",@"10,110",@"12,110",@"10,000",@"10,110",@"12,110"];
    
    self.sectionTwoArr = @[@"月嫂",@"",@""];
    self.sectionTwoArr1 = @[@"金牌月嫂",@"高级月嫂",@"经济月嫂"];
    self.sectionTwoArr2 = @[@"10,000",@"10,110",@"12,110"];
    
    self.sectionThirdArr = @[@"月子餐",@"",@""];
    self.sectionThirdArr1 = @[@"豪华餐",@"精致餐",@"普通餐"];
    self.sectionThirdArr2 = @[@"10,000",@"10,110",@"12,110"];

}



#pragma mark ---collectionView代理方法

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.sectionOneArr1.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UINib *nib = [UINib nibWithNibName:@"OrderProductCollectionViewCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"OrderProductCollectionViewCell"];
    OrderProductCollectionViewCell *cell = (OrderProductCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"OrderProductCollectionViewCell" forIndexPath:indexPath];
//    if (indexPath.section == 0) {
        cell.titleLab.text = self.sectionOneArr[indexPath.item];
        cell.titleLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
        cell.contentLab.text = self.sectionOneArr1[indexPath.item];
        cell.contentLab.textColor = [UIColor colorWithHexString:@"#159695"];
        cell.priceLab.text = self.sectionOneArr2[indexPath.item];
        cell.priceLab.textColor = [UIColor colorWithHexString:@"#159695"];
        cell.selectBtn.layer.cornerRadius = 8.0;
        cell.selectBtn.layer.borderColor = [UIColor colorWithHexString:@"#159695"].CGColor;
        cell.selectBtn.layer.borderWidth = 1.0f;
    

    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width-150) /3 ,([UIScreen mainScreen].bounds.size.width-150) /3);
}

//定义每个UICollectionView 的 margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(12, 12, 12, 12);
    
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
