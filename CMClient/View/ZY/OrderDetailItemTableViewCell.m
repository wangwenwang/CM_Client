//
//  OrderDetailItemTableViewCell.m
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "OrderDetailItemTableViewCell.h"

@interface OrderDetailItemTableViewCell ()

// 产品代码
@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_NO;

// 产品名称
@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_NAME;

// 产品说明
@property (weak, nonatomic) IBOutlet UILabel *PRODUCT_DESC;

// 发货数量
@property (weak, nonatomic) IBOutlet UILabel *ISSUE_QTY;

// 发货重量
@property (weak, nonatomic) IBOutlet UILabel *ISSUE_WEIGHT;

// 发货体积
@property (weak, nonatomic) IBOutlet UILabel *ISSUE_VOLUME;

// 发货单位
@property (weak, nonatomic) IBOutlet UILabel *ISSUE_UOM;

// 订单备注
@property (weak, nonatomic) IBOutlet UILabel *REMARK_SUPPLIER;


@end

@implementation OrderDetailItemTableViewCell


- (void)awakeFromNib {
    
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setOrderDatailItemM:(OrderDetailItemModel *)orderDatailItemM {
    
    _PRODUCT_NO.text = orderDatailItemM.pRODUCTNO;
    _PRODUCT_NAME.text = orderDatailItemM.pRODUCTNAME;
    _PRODUCT_DESC.text = orderDatailItemM.pRODUCTDESC;
    _ISSUE_QTY.text = [NSString stringWithFormat:@"%.1f箱", [orderDatailItemM.iSSUEQTY floatValue]];
    _ISSUE_WEIGHT.text = [NSString stringWithFormat:@"%.2f吨", [orderDatailItemM.iSSUEWEIGHT floatValue]];
    _ISSUE_VOLUME.text = [NSString stringWithFormat:@"%.2f方", [orderDatailItemM.iSSUEVOLUME floatValue]];
    _ISSUE_UOM.text = orderDatailItemM.iSSUEUOM;
    _REMARK_SUPPLIER.text = orderDatailItemM.rEMARKSUPPLIER;
}

@end
