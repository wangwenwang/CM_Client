//
//  OrderDetailItemTableViewCell.h
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetailItemModel.h"

@interface OrderDetailItemTableViewCell : UITableViewCell

/// 订单详细item(产品信息)
@property (strong, nonatomic) OrderDetailItemModel *orderDatailItemM;

@end
