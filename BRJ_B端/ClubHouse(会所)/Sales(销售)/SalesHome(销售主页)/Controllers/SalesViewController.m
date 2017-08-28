//
//  SalesViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/2.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "SalesViewController.h"
#import "SalesCollectionViewCell.h"
#import "SalesTableViewCell.h"


@interface SalesViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic,strong) UITableView *SalesTableView;

@property (nonatomic,strong) UICollectionView *SalesCollectionView;

@property (nonatomic,strong) NSMutableArray *dataArray;//数据源



@end

@implementation SalesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatColeectionView];
    [self creatTableView];

}

- (void)creatColeectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    _SalesCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kWidth-10, 180) collectionViewLayout:layout];
    _SalesCollectionView.delegate = self;
    _SalesCollectionView.dataSource = self;
    _SalesCollectionView.backgroundColor = [UIColor whiteColor];
    [_SalesCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    _SalesCollectionView.scrollEnabled = NO;
    [self.view addSubview:_SalesCollectionView];
    
    
}

- (void)creatTableView{
    _SalesTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight-49-64-44) style:UITableViewStylePlain];
    _SalesTableView.backgroundColor = [UIColor whiteColor];
    _SalesTableView.delegate = self;
    _SalesTableView.dataSource = self;
    _SalesTableView.tableHeaderView = _SalesCollectionView;
    _SalesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_SalesTableView];
}


#pragma mark ---UITableView的代理方法


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 44;
    }else if (indexPath.row == 1){
        return 120;
    }
    return 180;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 0) {
       
        static NSString *cellid = @"cellid";
        UITableViewCell *cell = [_SalesTableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[SalesTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellid];
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.userInteractionEnabled = NO;
        return cell;
    }if (indexPath.row == 1) {
        static NSString *cellID = @"cellID";
        UITableViewCell *cell = [_SalesTableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[SalesTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID type:1];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.userInteractionEnabled = NO;
        return cell;
    }if (indexPath.row == 2) {
        static NSString *cellId = @"cellId";
        UITableViewCell *cell = [_SalesTableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[SalesTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId type:2];
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.userInteractionEnabled = NO;
        return cell;
    }
    
    return nil;

}


#pragma mark ---UICollectionView代理

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UINib *nib = [UINib nibWithNibName:@"SalesCollectionViewCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"SalesCollectionViewCell"];
    SalesCollectionViewCell *cell = (SalesCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"SalesCollectionViewCell" forIndexPath:indexPath];
    
    NSArray *titleArr = @[@"销售房态",@"销售订单",@"销售客户",@"新建客户",@"新建行动",@"新建订单"];
    NSArray *imageArray = @[@"xiaoshoufangtai-icon",@"xiaoshoudingdan-icon",@"xiaoshoukehu-icon",@"xinjiankehu-icon",@"xinjianxingdong-icon",@"xinjiandingdan"];
    cell.titleLab.text = titleArr[indexPath.item];
    cell.salesBtn.userInteractionEnabled = NO;
    [cell.salesBtn setImage:[UIImage imageNamed:imageArray[indexPath.item]] forState:UIControlStateNormal];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.item);
    if (_pushBlock) {
        _pushBlock(indexPath.item);
    }
}




- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width-60) /4 ,([UIScreen mainScreen].bounds.size.width-60) /4);
}

//定义每个UICollectionView 的 margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 5, 10, 5);
    
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
