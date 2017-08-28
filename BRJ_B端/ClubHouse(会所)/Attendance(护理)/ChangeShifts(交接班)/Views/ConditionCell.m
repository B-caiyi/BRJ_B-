//
//  ConditionCell.m
//  TestForProduct
//
//  Created by xiaofei on 2017/8/23.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import "ConditionCell.h"

@interface InfoView : UIView

@property (nonatomic, strong)UILabel *numLbl;           // 房间号
@property (nonatomic, strong)UILabel *conditionLbl;     // 状况

@end

@implementation InfoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.numLbl];
        [self addSubview:self.conditionLbl];
    }
    return self;
}

//- (void)configNum:(NSString *)num Condition:(NSString *)condition {
//    self.numLbl.text = num;
//    self.conditionLbl.text = condition;
//}

- (void)configDict:(NSDictionary *)dict {
    self.numLbl.text = dict[@"num"];
    self.conditionLbl.text = dict[@"condition"];
}

- (UILabel *)numLbl {
    if (!_numLbl) {
        _numLbl = [[UILabel alloc] initWithFrame:CGRectMake(12, 3, 60, 40)];
        _numLbl.backgroundColor = [UIColor colorWithHexString:@"#DB6C63"];
        _numLbl.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
        _numLbl.textAlignment = NSTextAlignmentCenter;
        _numLbl.layer.cornerRadius = 8.0;
        _numLbl.layer.masksToBounds = YES;
        _numLbl.font = [UIFont systemFontOfSize:14];
    }
    return _numLbl;
}

- (UILabel *)conditionLbl {
    if (!_conditionLbl) {
        _conditionLbl = [[UILabel alloc] initWithFrame:CGRectMake(80, 3, self.frame.size.width - 90, 40)];
        _conditionLbl.textColor = [UIColor colorWithHexString:@"#212F4D"];
        _conditionLbl.font = [UIFont systemFontOfSize:14];
    }
    return _conditionLbl;
}


@end

@interface ConditionCell ()

@property (nonatomic, strong)UILabel *titLabel;
@property (nonatomic, strong)NSArray *conditionArr;

@end

@implementation ConditionCell

+ (ConditionCell *)conditionCellWithTableView:(UITableView *)tableView {
    static NSString *cellId = @"conditionCell";
    ConditionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[ConditionCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titLabel];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    frame.size.height = 60 + self.conditionArr.count * 57;
    [super setFrame:frame];
}

- (void)configWithConditions:(NSArray<NSDictionary *> *)conditions {
    self.conditionArr = conditions;
    for (UIView *view in self.contentView.subviews) {
        if ([view isKindOfClass:[InfoView class]]) {
            [view removeFromSuperview];
        }
    }
    self.titLabel.text = [NSString stringWithFormat:@"护理异常消息共%li项", conditions.count];
    for (NSInteger i=0; i<conditions.count; i++) {
        InfoView *infoView = [[InfoView alloc] initWithFrame:CGRectMake(0, 60 + 57 * i, [UIScreen mainScreen].bounds.size.width, 41)];
        [infoView configDict:conditions[i]];
        [self.contentView addSubview:infoView];
    }
    
    CGRect frame = self.frame;
    frame.size.height = conditions.count * 57 + 60;
    self.frame = frame;
}

- (UILabel *)titLabel {
    if (!_titLabel) {
        _titLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 200, 30)];
        _titLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titLabel;
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
