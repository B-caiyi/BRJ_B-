//
//  AttendanceViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/2.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "AttendanceViewController.h"
#import "SalesCollectionViewCell.h"
#import "SalesTableViewCell.h"
#import "OrderListViewController.h"
#import "CircularityView.h"
#import "CustomLableWithImage.h"

@interface AttendanceViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    CAShapeLayer *shapeLayer;
    NSTimer *timer;
}

@property (nonatomic,strong) UICollectionView *AttendanceCollectionView;

@property (nonatomic,strong) UITableView *AttendanceTableView;

@property (assign,nonatomic) CGFloat lineWidth;



@end

@implementation AttendanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatColeectionView];
//    [self creatTableView];
    [self initCircleView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)creatColeectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.AttendanceCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 180) collectionViewLayout:layout];
    self.AttendanceCollectionView.delegate = self;
    self.AttendanceCollectionView.dataSource = self;
    self.AttendanceCollectionView.backgroundColor = [UIColor whiteColor];
    [self.AttendanceCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    self.AttendanceCollectionView.scrollEnabled = NO;
    [self.view addSubview:self.AttendanceCollectionView];
    
    
}

- (void)creatTableView{
    
    self.AttendanceTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight-49) style:UITableViewStylePlain];
    self.AttendanceTableView.backgroundColor = [UIColor whiteColor];
    self.AttendanceTableView.delegate = self;
    self.AttendanceTableView.dataSource = self;
    self.AttendanceTableView.tableHeaderView = self.AttendanceCollectionView;
    self.AttendanceTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.AttendanceTableView];
}

- (void)initCircleView
{
    UIView *circleView = [[UIView alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.AttendanceCollectionView.frame)+5, kWidth-10, kHeight-180-64-108)];
    circleView.backgroundColor = [UIColor whiteColor];
    circleView.layer.cornerRadius = 8.0;
    circleView.layer.borderWidth = 1;
    circleView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:circleView];
    //日期显示lable
    UILabel *dateLab = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/2-60, 5, 100, 44)];
    dateLab.text = @"2017年8月";
    dateLab.font = [UIFont systemFontOfSize:18];
    dateLab.textAlignment = NSTextAlignmentCenter;
    [circleView addSubview:dateLab];
    //日期选择器
    UIButton *dateBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(dateLab.frame)+3, 15, 20, 20)];
    [dateBtn setImage:[UIImage imageNamed:@"xiaoshou-riqisanjiao-icon"] forState:UIControlStateNormal];
    [dateBtn addTarget:self action:@selector(dateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [circleView addSubview:dateBtn];
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake((kWidth-60)/2, CGRectGetMaxY(dateLab.frame)+80, 75, 40)];
    titleLab.text = @"护理工作  完成进度";
    titleLab.numberOfLines = 2;
    titleLab.font = [UIFont systemFontOfSize:14];
    titleLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [circleView addSubview:titleLab];
    
    
    //通过UIBezierPath设置圆形的矢量路径
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 150, 150)];
    
    //用CAShapeLayer沿着第一步的路径画一个完整的环（颜色灰色，起始点0，终结点1）
    CAShapeLayer *bgLayer = [CAShapeLayer layer];
    bgLayer.frame = CGRectMake(0, 0, 150, 150);//设置Frame
    bgLayer.position = self.view.center;//居中显示
    bgLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色=透明色
    bgLayer.lineWidth = 16.f;//线条大小
    bgLayer.strokeColor = [UIColor colorWithHexString:@"#F0867B"].CGColor;//线条颜色
    bgLayer.strokeStart = 0.f;//路径开始位置
    bgLayer.strokeEnd = 1.0f;//路径结束位置
    bgLayer.path = circle.CGPath;//设置bgLayer的绘制路径为circle的路径
    [self.view.layer addSublayer:bgLayer];//添加到屏幕上
    //白色
    CAShapeLayer *whiteLayer = [CAShapeLayer layer];
    whiteLayer.frame = CGRectMake(0, 0, 150, 150);//设置Frame
    whiteLayer.position = self.view.center;//居中显示
    whiteLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色=透明色
    whiteLayer.lineWidth = 16.f;//线条大小
    whiteLayer.strokeColor = [UIColor whiteColor].CGColor;//线条颜色
    whiteLayer.strokeStart = 0.56f;//路径开始位置
    whiteLayer.strokeEnd = 0.59f;//路径结束位置
    whiteLayer.path = circle.CGPath;//设置bgLayer的绘制路径为circle的路径
    [self.view.layer addSublayer:whiteLayer];//添加到屏幕上
    
    CAShapeLayer *whiteLayer1 = [CAShapeLayer layer];
    whiteLayer1.frame = CGRectMake(0, 0, 150, 150);//设置Frame
    whiteLayer1.position = self.view.center;//居中显示
    whiteLayer1.fillColor = [UIColor clearColor].CGColor;//填充颜色=透明色
    whiteLayer1.lineWidth = 16.f;//线条大小
    whiteLayer1.strokeColor = [UIColor whiteColor].CGColor;//线条颜色
    whiteLayer1.strokeStart = 0.f;//路径开始位置
    whiteLayer1.strokeEnd = 0.03f;//路径结束位置
    whiteLayer1.path = circle.CGPath;//设置bgLayer的绘制路径为circle的路径
    [self.view.layer addSublayer:whiteLayer1];//添加到屏幕上

    //用CAShapeLayer沿着第一步的路径画一个红色的环形进度条，但是起始点=终结点=0，所以开始不可见
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, 150, 150);
    shapeLayer.position = self.view.center;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 16.f;
    shapeLayer.strokeColor = [UIColor colorWithHexString:@"#9AC3ED"].CGColor;
    shapeLayer.strokeStart = 0.59f;
    shapeLayer.strokeEnd = 1.0;
    shapeLayer.path = circle.CGPath;
    [self.view.layer addSublayer:shapeLayer];
 
    //护理师折线
    UIBezierPath *Polyline = [UIBezierPath bezierPath];
    [Polyline moveToPoint:CGPointMake(150, 80)];
    [Polyline addLineToPoint:CGPointMake(130, 60)];
    [Polyline addLineToPoint:CGPointMake(40, 60)];
    [Polyline stroke];
    
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.strokeColor = [UIColor colorWithHexString:@"#9AC3ED"].CGColor;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    lineLayer.path = Polyline.CGPath;
    [circleView.layer addSublayer:lineLayer];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 47, 7, 7)];
    imageView.image = [UIImage imageNamed:@"blue_icon"];
    [circleView addSubview:imageView];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+3, 40, 80, 20)];
    title.text = @"护理师已完成40%";//后台返回
    title.font = [UIFont systemFontOfSize:12];
    title.adjustsFontSizeToFitWidth = YES;
    title.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [circleView addSubview:title];
    
    //护士折线
    UIBezierPath *Polyline3 = [UIBezierPath bezierPath];
    [Polyline3 moveToPoint:CGPointMake(240, 200)];
    [Polyline3 addLineToPoint:CGPointMake(260, 220)];
    [Polyline3 addLineToPoint:CGPointMake(350, 220)];
    [Polyline3 stroke];
    
//    UIBezierPath *Polyline4 = [UIBezierPath bezierPath];
//    [Polyline4 moveToPoint:CGPointMake(260, 220)];
//    [Polyline4 addLineToPoint:CGPointMake(350, 220)];
//    [Polyline4 stroke];
    
    CAShapeLayer *lineLayer3 = [CAShapeLayer layer];
    lineLayer3.strokeColor = [UIColor colorWithHexString:@"#F0867B"].CGColor;
    lineLayer3.fillColor = [UIColor clearColor].CGColor;
    lineLayer3.path = Polyline3.CGPath;
    [circleView.layer addSublayer:lineLayer3];
    
//    CAShapeLayer *lineLayer4 = [CAShapeLayer layer];
//    lineLayer4.strokeColor = [UIColor colorWithHexString:@"#F0867B"].CGColor;
//    lineLayer4.fillColor = [UIColor clearColor].CGColor;
//    lineLayer4.path = Polyline4.CGPath;
//    [circleView.layer addSublayer:lineLayer4];
    
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(260, 207, 7, 7)];
    imageView1.image = [UIImage imageNamed:@"red_icon"];
    [circleView addSubview:imageView1];
    
    UILabel *title1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView1.frame)+3, 200, 80, 20)];
    title1.text = @"护士已完成60%";//后台返回
    title1.font = [UIFont systemFontOfSize:12];
    title1.adjustsFontSizeToFitWidth = YES;
    title1.textColor = [UIColor colorWithHexString:@"#212F4D"];
    [circleView addSubview:title1];


    
}

- (void)dateBtnClick{
    NSLog(@"选择日期");
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
        UITableViewCell *cell = [self.AttendanceTableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[SalesTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellid];
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.userInteractionEnabled = NO;
        return cell;
    }if (indexPath.row == 1) {
        static NSString *cellID = @"cellID";
        UITableViewCell *cell = [self.AttendanceTableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[SalesTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID type:1];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.userInteractionEnabled = NO;
        return cell;
    }if (indexPath.row == 2) {
        static NSString *cellId = @"cellId";
        UITableViewCell *cell = [self.AttendanceTableView dequeueReusableCellWithIdentifier:cellId];
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
    
    NSArray *titleArr = @[@"服务评价",@"交接班",@"入住评估",@"护士记录",@"医生记录",@"护理师记录",@"医嘱"];
    NSArray *imageArray = @[@"fuwupingjia_icon",@"jiaojieban_icon",@"ruzhupinggu_icon",@"hushijilu_icon",@"yishengjilu_icon",@"hulishijilu_icon",@"yizhu_icon"];
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
    
    
//    if (indexPath.item == 0) {
//        
//    }else if (indexPath.item == 1){
//        
//        OrderListViewController *OrderListVc = [[OrderListViewController alloc]init];
//        [self.navigationController pushViewController:OrderListVc animated:YES];
//        
//    }else if (indexPath.item == 2){
//        
//       
//        
//    }else if (indexPath.item == 3){
//        
//        
//    }else if (indexPath.item == 4){
//        
//              
//    }else if (indexPath.item == 5){
//        
//    }
    
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
