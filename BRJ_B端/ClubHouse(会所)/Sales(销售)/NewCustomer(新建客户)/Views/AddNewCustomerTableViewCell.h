//
//  AddNewCustomerTableViewCell.h
//  BRJ_B端
//
//  Created by 方溯 on 2017/8/7.
//  Copyright © 2017年 方溯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewCustomerTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *commonLab;//lable

@property (nonatomic,strong) UITextField *textField;//输入框

@property (nonatomic,strong) UIButton *clearBtn;//清除按钮

@property (nonatomic,strong) UIImageView *ImageView;//虚线容器

@property (nonatomic,strong) UIView *line;//分隔线

@property (nonatomic,strong) UILabel *intentLab;//客户意向

@property (nonatomic,strong) UIButton *strongBtn;//意向强烈

@property (nonatomic,strong) UIButton *generalBtn;//意向一般

@property (nonatomic,strong) UIButton *weakBtn;//意向微弱






//@property (nonatomic,strong) UILabel *nameLab;//客户名称
//
//@property (nonatomic,strong) UITextField *nameTextField;//客户名称 -- 输入框
//
//@property (nonatomic,strong) UILabel *phoneLab;//联系电话
//
//@property (nonatomic,strong) UITextField *phone;//联系电话 -- 输入框
//
//@property (nonatomic,strong) UILabel *customerAgeLab;//客户年龄
//
//@property (nonatomic,strong) UITextField *customerAge;//客户年龄 -- 输入框
//
//@property (nonatomic,strong) UILabel *bornDataLab;//预产期
//
//@property (nonatomic,strong) UITextField *bornData;//预产期 -- 输入框



//@property (nonatomic,strong) UILabel *remarksLab;//备注信息
//
//@property (nonatomic,strong) UITextField *remarks;//备注信息 -- 输入框
//
//@property (nonatomic,strong) UILabel *customerSourceLab;//客户来源
//
//@property (nonatomic,strong) UITextField *customerSource;//客户来源 -- 输入框
//
//@property (nonatomic,strong) UILabel *bornHospitalLab;//生产医院
//
//@property (nonatomic,strong) UITextField *bornHospital;//生产医院 -- 输入框
//
//@property (nonatomic,strong) UILabel *HomeLab;//住院房间
//
//@property (nonatomic,strong) UITextField *Home;//住院房间--输入框
//
//@property (nonatomic,strong) UILabel *addressLab;//家庭住址
//
//@property (nonatomic,strong) UITextField *address;//家庭住址 -- 输入框
//
//@property (nonatomic,strong) UILabel *wechatNumLab;//微信号
//
//@property (nonatomic,strong) UITextField *wechatNum;//微信号 -- 输入框
//
//@property (nonatomic,strong) UILabel *mailboxLab;//邮箱
//
//@property (nonatomic,strong) UITextField *mailbox;//邮箱 -- 输入框
//
//@property (nonatomic,strong) UILabel *QQNumberLab;//QQ号
//
//@property (nonatomic,strong) UITextField *QQNumber;//QQ号 -- 输入框
//
//@property (nonatomic,strong) UILabel *emergencyContactLab;//紧急联系人
//
//@property (nonatomic,strong) UITextField *emergencyContact;//紧急联系人 -- 输入框

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier type:(NSInteger)type;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title placeholder:(NSString *)holderTitle type:(NSInteger)type;

@end
