//
//  ChooseRoomViewController.m
//  BRJ_B端
//
//  Created by caiyi on 2017/8/19.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "ChooseRoomViewController.h"
#import "ChooseRoomCollectionViewCell.h"
#import "ChooseRoomFooterReusableView.h"
#import "NursesRecordViewController.h"

@interface ChooseRoomViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UIScrollViewDelegate>


@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) UICollectionView *chooseRoomCollectionView;

@property (nonatomic,strong) UISegmentedControl *segmenCtr;


@end

@implementation ChooseRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNavigation];
    [self initWithTitleColumn];
    [self creatCollectionView];
}

- (void)creatNavigation{
    
    UIView *NavView = [[UIView alloc]initWithFrame:CGRectMake(0,0, kWidth, 64)];
    NavView.backgroundColor = [UIColor colorWithHexString:@"#19233A"];
    [self.view addSubview:NavView];
    
    UILabel *NavTitleLab = [Maker makeLb:CGRectMake(0, 20, kWidth, 44)
                                   title:@"选择房间"
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

- (void)initWithTitleColumn
{
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kWidth, 44)];
    titleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:titleView];
    
    //分隔线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 44, kWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [titleView addSubview:line];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(titleView.frame), 44)];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [titleView addSubview:self.scrollView];
    
    NSArray *titArr = @[@"1F",@"2F",@"3F",@"4F",@"5F",@"6F",@"7F",@"8F",@"9F",@"10F"];
    CGFloat width = titArr.count < 6 ? kWidth/titArr.count : kWidth/6;
    for (NSInteger i=0; i<titArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(width * i, 0, width, 44);
        [btn setTitle:titArr[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = 10000+i;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor colorWithRed:77.0/255 green:89.0/255 blue:112.0/255 alpha:1] forState:UIControlStateNormal];
        [btn setSelected:NO];
      
        
        [self.scrollView addSubview:btn];
    }
    self.scrollView.contentSize = CGSizeMake(width * titArr.count, 44);
}

- (void)btnClicked:(UIButton *)sender
{
    if (!sender.selected) {
        sender.backgroundColor = [UIColor colorWithHexString:@"#EEEFF2"];
        sender.titleLabel.font = [UIFont systemFontOfSize:20];
        [sender setTitleColor:[UIColor colorWithHexString:@"#212F4D"] forState:UIControlStateSelected];
    }else{
        sender.backgroundColor = [UIColor whiteColor];
        sender.titleLabel.font = [UIFont systemFontOfSize:14];
        [sender setTitleColor:[UIColor colorWithRed:77.0/255 green:89.0/255 blue:112.0/255 alpha:1] forState:UIControlStateNormal];
    }
    
    
    switch (sender.tag - 10000) {
        case 0:
            NSLog(@"1F");
            break;
        case 1:
            NSLog(@"2F");
            break;
        case 2:
            NSLog(@"3F");
            break;
        case 3:
            NSLog(@"4F");
            break;
        case 4:
            NSLog(@"5F");
            break;
        case 5:
            NSLog(@"6F");
            break;
        default:
            break;
    }
}



- (void)creatCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    self.chooseRoomCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 111, kWidth, kHeight) collectionViewLayout:layout];
    self.chooseRoomCollectionView.backgroundColor = [UIColor whiteColor];
    self.chooseRoomCollectionView.delegate = self;
    self.chooseRoomCollectionView.dataSource = self;
    [self.view addSubview:self.chooseRoomCollectionView];
    
    [self.chooseRoomCollectionView registerClass:[ChooseRoomCollectionViewCell class] forCellWithReuseIdentifier:@"cellddd"];
    //设置尾部并给定大小
    [layout setFooterReferenceSize:CGSizeMake(self.chooseRoomCollectionView.frame.size.width,50)];
    //注册单元格
    [self.chooseRoomCollectionView registerClass:[ChooseRoomFooterReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
}

#pragma mark ---UICollectionView代理方法

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 35;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ChooseRoomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellddd" forIndexPath:indexPath];
    cell.layer.cornerRadius = 8.0;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width-66) /5 ,([UIScreen mainScreen].bounds.size.width-65) /5);
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
        ChooseRoomFooterReusableView *footerView = (ChooseRoomFooterReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        ReusableView = footerView;
        
        
    }
    return ReusableView;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NursesRecordViewController *NursesRecordVc = [[NursesRecordViewController alloc]init];
    NursesRecordVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:NursesRecordVc animated:YES];
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
