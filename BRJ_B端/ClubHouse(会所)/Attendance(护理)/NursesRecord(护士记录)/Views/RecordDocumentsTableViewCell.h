//
//  RecordDocumentsTableViewCell.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/25.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordDocumentsTableViewCell : UITableViewCell

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *suffixLab;

@property (nonatomic,strong) UILabel *middleLab;

@property (nonatomic,strong) UITextField *textField;

@property (nonatomic,strong) UITextField *secondTextField;

@property (nonatomic,strong) UIImageView *ImageView;

@property (nonatomic,strong) UIView *line;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger )type;
//第一种类型的cell 配置信息(title 输入框 输入框背提示内容 后缀lab)
- (void)configCellTypeOneWithTitle:(NSString *)title placeholder:(NSString *)placeholder suffixTitle:(NSString *)suffixtitle;
//第二种类型的cell 配置信息(title 两个输入框 输入框背提示文字 后缀lab)
- (void)configCellTypeTwoWithTitle:(NSString *)title firstPlaceholder:(NSString *)firstPlaceholder secondPlaceholder:(NSString *)secondPlaceholder suffixTitle:(NSString *)suffixTitle;
//第三种类型的cell 配置信息(title 输入框 输入框背提示内容)
- (void)configCellTypeThreeWithTitle:(NSString *)title placeholder:(NSString *)placeholder;

@end
