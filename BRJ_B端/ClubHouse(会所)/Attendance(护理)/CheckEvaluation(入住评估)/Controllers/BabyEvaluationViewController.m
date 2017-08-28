//
//  BabyEvaluationViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/24.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "BabyEvaluationViewController.h"
#import "BabyEvaluationTableViewCell.h"
#import "BabyEvaluationCollectionViewCell.h"
#import "BabyFooterCollectionReusableView.h"

#define cellKHeight 50

@interface BabyEvaluationViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIView *headerView;

@property (nonatomic,strong) UIView *footerView;

@property (nonatomic,strong) NSArray *dataArr;

@property (nonatomic,strong) NSArray *imageArr;


@end

@implementation BabyEvaluationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    [self dataSource];
    
    [self creatTableView];
    
    
}

- (void)initUI{
    
    UIView *infoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 60)];
    infoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:infoView];
    
    NSArray *titleArr = @[@"乳名:",@"性别:",@"宝宝年龄:",@"生日:",@"出生身高:",@"出生体重:"];
    NSArray *titleAarray = @[@"小糯米",@"女",@"10天",@"2017.06.01",@"55cm",@"3.7kg"];
    CGFloat width = (kWidth-24)/3;
    for (NSInteger i = 0; i < 3; i ++) {
        for (NSInteger j = 0; j < 2; j ++ ) {
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(12+width*i, 20*j+10, width, 20)];
            if (j == 0) {
                lab.text = [NSString stringWithFormat:@"%@%@",titleArr[i],titleAarray[i]];
            }else{
                lab.text = [NSString stringWithFormat:@"%@%@",titleArr[i+3],titleAarray[i+3]];
            }
            lab.font = [UIFont systemFontOfSize:12];
            lab.textColor = [UIColor colorWithHexString:@"#8F96A6"];
            [infoView addSubview:lab];
        }
        
    }
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 59, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self.view addSubview:line];
    
    
}
- (void)dataSource
{
    self.dataArr = [NSArray array];
    self.dataArr = @[@"宝宝脐带有渗血",@"宝宝脸部起痘痘",@"宝宝脐带出血"];
    self.imageArr = @[@"tianjiazhaopian_icon",@"01"];
    [self.tableView reloadData];
}

- (void)creatTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, kWidth, kHeight-178) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = YES;
    self.tableView.contentSize = CGSizeMake(0, (kHeight-118)*2);
    [self.view addSubview:self.tableView];
}



#pragma mark ---UITableView的代理方法

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    BabyEvaluationTableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[BabyEvaluationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell configCellWithTitle:self.dataArr[indexPath.row]];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 50)];
    self.headerView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 10, 30, 30)];
    ImageView.image = [UIImage imageNamed:@"yichangxiaoxi_icon"];
    [self.headerView addSubview:ImageView];
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(ImageView.frame)+10, 10, kWidth-64, 30)];
    titleLab.text = @"异常消息";
    titleLab.font = [UIFont systemFontOfSize:14];
    titleLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [self.headerView addSubview:titleLab];

    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 49, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self.headerView addSubview:line];
    
    return self.headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    self.footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight-50*self.dataArr.count-118)];
    self.footerView.backgroundColor = [UIColor whiteColor];
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 5)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self.footerView addSubview:line];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 5, kWidth, 50)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.footerView addSubview:bgView];
    
    CGFloat width = (kWidth-24)/3;
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(width+30, 10, width, 30)];
    titleLab.text = @"入住评估单";
    titleLab.textColor = [UIColor colorWithHexString:@"#159695"];
    titleLab.font = [UIFont systemFontOfSize:14];
    [bgView addSubview:titleLab];
    
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 49, kWidth, 1)];
    line1.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [bgView addSubview:line1];
    
    UILabel *titleLab1 = [[UILabel alloc]initWithFrame:CGRectMake(12, CGRectGetMaxY(line1.frame)+10, kWidth-24, 30)];
    titleLab1.text = @"请添加入住评估单及基本数据记录单的照片";
    titleLab1.textColor = [UIColor colorWithHexString:@"#8F96A6"];
    titleLab1.font = [UIFont systemFontOfSize:12];
    [bgView addSubview:titleLab1];
    
    
     UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLab1.frame), kWidth, 310)collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[BabyEvaluationCollectionViewCell class] forCellWithReuseIdentifier:@"cellddd"];
    //设置尾部并给定大小
    [layout setFooterReferenceSize:CGSizeMake(self.collectionView.frame.size.width,50)];
    //注册单元格
    [self.collectionView registerClass:[BabyFooterCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
    
    [self.footerView addSubview:self.collectionView];
    return self.footerView;

}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kHeight-50*self.dataArr.count-118;
}


#pragma mark ---UICollectionView代理方法

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    BabyEvaluationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellddd" forIndexPath:indexPath];
    [cell configCellWithImage:self.imageArr[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width-54) /4 ,([UIScreen mainScreen].bounds.size.width-54) /4);
}

//定义每个UICollectionView 的 margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(13, 10, 10, 13);
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *ReusableView = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        return nil;
    }if (kind == UICollectionElementKindSectionFooter) {
        BabyFooterCollectionReusableView *footerView = (BabyFooterCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        footerView.saveBtnBlock = ^(NSInteger index) {
            if (index == 0) {
                NSLog(@"点击提交");
            }
        };
        ReusableView = footerView;
    }
    return ReusableView;
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
