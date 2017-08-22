//
//  OrderTableViewCell.h
//  CMClient
//
//  Created by 凯东源 on 17/3/7.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"


/// 订单信息

@interface OrderTableViewCell : UITableViewCell


/// TMS订单号
@property (weak, nonatomic) IBOutlet UILabel *ORD_NO;

/// 起运点联系人
@property (weak, nonatomic) IBOutlet UILabel *ORD_FROM_CNAME;

/// 起运点联系电话
@property (weak, nonatomic) IBOutlet UILabel *ORD_FROM_CTEL;

/// 到达点联系人
@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_CNAME;

/// 到达点联系电话
@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_CTEL;

/// 起运点名称
@property (weak, nonatomic) IBOutlet UILabel *ORD_FROM_NAME;

/// 到达点名名称
@property (weak, nonatomic) IBOutlet UILabel *ORD_TO_NAME;

@property (strong, nonatomic) OrderModel *order;

/// 起运点名称距下
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ORG_FROM_NAME_bottom;

/// 起点名称提示
@property (weak, nonatomic) IBOutlet UILabel *ORG_FROM_NAME_PromptLabel;

/// 起点名称距右
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ORG_FROM_NAME_trailing;

@property (assign, nonatomic) CGFloat ORG_FROM_NAME_FontPointSize;

@end
