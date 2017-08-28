//
//  MotherNursesRecordViewController.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/25.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "MotherNursesRecordViewController.h"
#import "BabyEvaluationTableViewCell.h"
#import "RecordDocumentsTableViewCell.h"

@interface MotherNursesRecordViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIView *headerView;

@property (nonatomic,strong) UIView *footerView;

@property (nonatomic,strong) NSArray *dataArr;

@property (nonatomic,strong) UIScrollView *HorScrollView;

@property (nonatomic,strong) UIButton *saveBtn;

@end

@implementation MotherNursesRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    [self creatTableView];
    [self dataSource];
}



- (void)initUI{
    UIView *infoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 60)];
    infoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:infoView];
    
    NSArray *titleArr = @[@"姓名:",@"年龄:",@"分娩方式:",@"胎次:",@"剖腹产原因:",@""];
    NSArray *titleAarray = @[@"大糯米",@"31岁",@"剖腹产",@"二胎",@" 无",@""];
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
//创建tableView
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
//数据源
- (void)dataSource
{
    self.dataArr = [NSArray array];
    self.dataArr = @[@"宝宝脐带有渗血",@"宝宝脸部起痘痘"];
//    self.imageArr = @[@"tianjiazhaopian_icon",@"01"];
    [self.tableView reloadData];
}

#pragma mark ---UITableView的代理方法

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.dataArr.count;
    }
    return 16;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return 60;
    }
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
    static NSString *cellId = @"cellId";
    BabyEvaluationTableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
            if (!cell) {
            cell = [[BabyEvaluationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        [cell configCellWithTitle:self.dataArr[indexPath.row]];
        return cell;
    }else if (indexPath.section == 1){
        static NSString *cellID = @"cellID";
        RecordDocumentsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[RecordDocumentsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID type:2];
        }
        [cell configCellTypeTwoWithTitle:@"产妇血压" firstPlaceholder:@"高压" secondPlaceholder:@"低压" suffixTitle:@"mmhg"];
        return cell;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 50)];
    self.headerView.backgroundColor = [UIColor whiteColor];
    if (section == 0) {
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
    }else if (section == 1){
        return nil;
    }
    return self.headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 50;
    }
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    self.footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight-50*self.dataArr.count-118)];
    self.footerView.backgroundColor = [UIColor whiteColor];
    if (section == 0) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 5)];
        line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
        [self.footerView addSubview:line];
        
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 5, kWidth, 50)];
        titleView.backgroundColor = [UIColor whiteColor];
        [self.footerView addSubview:titleView];
        //当天寻房记录选择
        UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/2-60, 5, 95, 44)];
        titleLab.text = @"当天巡房记录";
        titleLab.font = [UIFont systemFontOfSize:14];
        titleLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
        titleLab.textAlignment = NSTextAlignmentCenter;
        [titleView addSubview:titleLab];
        //日期选择器
        UIButton *dateBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLab.frame), 17, 20, 20)];
        [dateBtn setImage:[UIImage imageNamed:@"xiaoshou-riqisanjiao-icon"] forState:UIControlStateNormal];
        [dateBtn addTarget:self action:@selector(dateBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:dateBtn];
        
        UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 49, kWidth, 1)];
        line1.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
        [titleView addSubview:line1];
        
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleView.frame), kWidth, 50)];
        bgView.backgroundColor = [UIColor whiteColor];
        [self.footerView addSubview:bgView];
        
        //横向滑动按钮--选择时间
        self.HorScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(bgView.frame), 50)];
        self.HorScrollView.backgroundColor = [UIColor whiteColor];
        self.HorScrollView.userInteractionEnabled = YES;
        self.HorScrollView.showsHorizontalScrollIndicator = NO;
        [bgView addSubview:self.HorScrollView];
        
        NSArray *titArr = @[@"08:10",@"09:10",@"10:10",@"11:10",@"12:10",@"13:10",@"14:10",@"15:10",@"16:10",@"17:10"];
        CGFloat width = titArr.count < 5 ? kWidth/titArr.count : kWidth/5;
        for (NSInteger i=0; i<titArr.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(width * i, 0, width, 50);
            [btn setTitle:titArr[i] forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor whiteColor];
            [btn setTitleColor:[UIColor colorWithHexString:@"#212F4D"] forState:UIControlStateNormal];
            btn.tag = 10000+i;
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitleColor:[UIColor colorWithRed:77.0/255 green:89.0/255 blue:112.0/255 alpha:1] forState:UIControlStateNormal];
            [btn setSelected:NO];
            
            
            [self.HorScrollView addSubview:btn];
        }
        self.HorScrollView.contentSize = CGSizeMake(width * titArr.count, 50);
        UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, 49, kWidth, 1)];
        line2.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
        [bgView addSubview:line2];
        //巡房记录单信息
        UIView *beforeRecordView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView.frame), kWidth, 140)];
        beforeRecordView.backgroundColor = [UIColor whiteColor];
        [self.footerView addSubview:beforeRecordView];
        NSArray *titleArr = @[@"体温: ",@"体重: ",@"身高: ",@"亲喂: ",@"黄疸: ",@"母乳: ",@"配方: ",@"大便: ",@"小便: ",@"脐部: ",@"臀部: ",@"备注信息: "];
        NSArray *titleAarray = @[@"36度",@"70kg",@"170cm",@"8次",@"10.5",@"50ml",@"150ml",@"3次",@"11次",@"目前状况良好,有结疤",@"有红臀倾向,请多加注意,已交代护理师",@"宝宝皮肤过敏,背部有红疹,已经药物治疗"];
        CGFloat Width = (kWidth-24)/3;
        for (NSInteger i = 0; i < 3; i++ ) {
            for (NSInteger j = 0; j <3; j ++ ) {
                UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(12+Width*i, 20*j+10, Width, 20)];
                if (j == 0) {
                    lab.text = [NSString stringWithFormat:@"%@%@",titleArr[i],titleAarray[i]];
                }else if(j == 1){
                    lab.text = [NSString stringWithFormat:@"%@%@",titleArr[i+3],titleAarray[i+3]];
                }else{
                    lab.text = [NSString stringWithFormat:@"%@%@",titleArr[i+6],titleAarray[i+6]];
                }
                lab.font = [UIFont systemFontOfSize:12];
                lab.textColor = [UIColor colorWithHexString:@"#8F96A6"];
                [beforeRecordView addSubview:lab];
                
            }
        }
        
        for (NSInteger i = 0; i<3; i ++ ) {
            UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(12, 70+20*i, kWidth-24, 20)];
            lab1.text = [NSString stringWithFormat:@"%@%@",titleArr[i+9],titleAarray[i+9]];
            lab1.font = [UIFont systemFontOfSize:12];
            lab1.textColor = [UIColor colorWithHexString:@"#8F96A6"];
            [beforeRecordView addSubview:lab1];
        }
        UIView *beforeViewLine = [[UIView alloc]initWithFrame:CGRectMake(0 , 135, kWidth, 5)];
        beforeViewLine.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
        [beforeRecordView addSubview:beforeViewLine];
        
        //产妇记录单
        UIView *recordView  = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(beforeRecordView.frame), kWidth, 50)];
        recordView.backgroundColor = [UIColor whiteColor];
        [self.footerView addSubview:recordView];
        
        UILabel *recordTitleLab = [[UILabel alloc]initWithFrame:CGRectMake(kWidth/2-60, 5, 120, 40)];
        recordTitleLab.text = @"产妇照护记录单";
        recordTitleLab.font = [UIFont systemFontOfSize:14];
        recordTitleLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
        recordTitleLab.textAlignment = NSTextAlignmentCenter;
        [recordView addSubview:recordTitleLab];
        
        
        UIView *recordLine = [[UIView alloc]initWithFrame:CGRectMake(0, 49, kWidth, 1)];
        recordLine.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
        [recordView addSubview:recordLine];
        return self.footerView;
    }else
    {
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
        line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
        [self.footerView addSubview:line];

        
        UIView *saveBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line.frame)+10, kWidth, 50)];
        saveBtnView.backgroundColor = [UIColor whiteColor];
        [self.footerView addSubview:saveBtnView];
        
        self.saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(12, 0, kWidth-24, 50)];
        [self.saveBtn setImage:[UIImage imageNamed:@"tijiaojilu_icon"] forState:UIControlStateNormal];
        [self.saveBtn addTarget:self action:@selector(saveBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [saveBtnView addSubview:self.saveBtn];
       
        return self.footerView;
    }
    return self.footerView;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
      return kHeight-118-254;
    }
    return 100;
    
}

- (void)dateBtnClick
{
    NSLog(@"选择时间");

}

- (void)btnClicked:(UIButton *)sender
{
    NSLog(@"滑动选择时间");
    if (!sender.selected) {
        sender.backgroundColor = [UIColor colorWithHexString:@"#EEEFF2"];
        sender.titleLabel.font = [UIFont systemFontOfSize:20];
        [sender setTitleColor:[UIColor colorWithHexString:@"#212F4D"] forState:UIControlStateSelected];
    }else{
        sender.backgroundColor = [UIColor whiteColor];
        sender.titleLabel.font = [UIFont systemFontOfSize:14];
        [sender setTitleColor:[UIColor colorWithRed:77.0/255 green:89.0/255 blue:112.0/255 alpha:1] forState:UIControlStateNormal];
    }
}

- (void)saveBtnClicked{

    NSLog(@"点击提交记录");

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
