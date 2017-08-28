//
//  ConditionCell.h
//  TestForProduct
//
//  Created by xiaofei on 2017/8/23.
//  Copyright © 2017年 xiaofei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConditionCell : UITableViewCell

+ (ConditionCell *)conditionCellWithTableView:(UITableView *)tableView;

- (void)configWithConditions:(NSArray<NSDictionary *> *)conditions;

@end
