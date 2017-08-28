//
//  BabyEvaluationTableViewCell.m
//  BRJ_B端
//
//  Created by caiyi on 2017/8/24.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import "BabyEvaluationTableViewCell.h"

@implementation BabyEvaluationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.detailLab = [[UILabel alloc]initWithFrame:CGRectMake(12, 10, kWidth-24, 30)];
        self.detailLab.textColor = [UIColor colorWithHexString:@"#8F96A6"];
        self.detailLab.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:self.detailLab];
    }
    return self;

}

- (void)configCellWithTitle:(NSString *)title
{
    self.detailLab.text = title;
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
