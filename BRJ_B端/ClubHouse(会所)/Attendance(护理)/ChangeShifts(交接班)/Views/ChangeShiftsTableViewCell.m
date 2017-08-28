//
//  ChangeShiftsTableViewCell.m
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/22.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "ChangeShiftsTableViewCell.h"

#define ckHeoght 60
@implementation ChangeShiftsTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger)type{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (type == 1) {
            [self customCellWithAbnormalMessage];
        }else if (type == 2){
            [self customCellWithCustomersInformation];
        }else if(type == 3){
            [self customCellWithCollectionView];
        }
    }
    return self;
}

//异常消息 自定义cell
- (void)customCellWithAbnormalMessage
{
    self.roomBtn = [[UIButton alloc]initWithFrame:CGRectMake(12, 10, 60, 40)];
    self.roomBtn.backgroundColor = [UIColor colorWithHexString:@"#DB6C63"];
    [self.roomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.roomBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    self.roomBtn.layer.cornerRadius = 8.0;
    [self addSubview:self.roomBtn];
    
    self.contentLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.roomBtn.frame)+8, 10, kWidth-100, 40)];
    self.contentLab.textColor = [UIColor colorWithHexString:@"212F4D"];
    self.contentLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.contentLab];
    
    //分隔线
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:self.line];


}

- (void)configWithTitle:(NSString *)title contentTitle:(NSString *)contentTitle
{
    [self.roomBtn setTitle:title forState:UIControlStateNormal];
    self.contentLab.text = contentTitle;
}

//客户人数自定义cell
- (void)customCellWithCustomersInformation
{
    self.descripLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, 70, 40)];
    self.descripLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.descripLab.font = [UIFont systemFontOfSize:14];
    self.descripLab.text = @"客户人数:";
    [self addSubview:self.descripLab];
    
    self.descrip = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.descripLab.frame), 10, kWidth-100, 40)];
    self.descrip.textColor = [UIColor colorWithHexString:@"#212F4D"];
    self.descrip.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.descrip];
    
    //分隔线
    self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 1)];
    self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
    [self addSubview:self.line];

}

- (void) configWithCustomersInformation:(NSString *)title
{
    self.descrip.text = title;
}


//自定义cell嵌套collectionView
- (void)customCellWithCollectionView
{

    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 60*self.nameArray.count/2)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bgView];
    
    //分隔线
        self.line = [[UIView alloc]initWithFrame:CGRectMake(0, 5, kWidth, 1)];
        self.line.backgroundColor = [UIColor colorWithRed:234.0/255 green:231.0/255 blue:231.0/255 alpha:1];
        [self.bgView addSubview:self.line];
    
    UILabel *HandoverTitleLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, kWidth-24, 30)];
    HandoverTitleLab.text = @"请选择交接对象";
    HandoverTitleLab.textColor = [UIColor colorWithHexString:@"#212F4D"];
    HandoverTitleLab.font = [UIFont systemFontOfSize:14];
    [self.bgView addSubview:HandoverTitleLab];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(HandoverTitleLab.frame)+5, kWidth, 120) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.bgView addSubview:self.collectionView];
    
    [self.collectionView registerClass:[ChangeShiftsCollectionViewCell class] forCellWithReuseIdentifier:@"cellIddd"];
}


#pragma mark ---CollectionView的代理方法

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.nameArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChangeShiftsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIddd" forIndexPath:indexPath];
    [cell.nameBtn addTarget:self action:@selector(nameBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [cell configItemWithName:self.nameArray[indexPath.item]];
    return cell;
}

- (void)nameBtnClicked
{
    NSLog(@"选择交接人");
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kWidth-76)/5, 40);
}

//cell Item的左右边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(12, 13, 12, 13);
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
