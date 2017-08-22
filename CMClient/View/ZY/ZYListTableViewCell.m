//
//  ZYListTableViewCell.m
//  CMClient
//
//  Created by 凯东源 on 17/3/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "ZYListTableViewCell.h"


@interface ZYListTableViewCell ()

// 装运流水号
@property (weak, nonatomic) IBOutlet UILabel *SHIPMENT_NO;

// 装运时间
@property (weak, nonatomic) IBOutlet UILabel *DATE_LOAD;

// 发布公司
@property (weak, nonatomic) IBOutlet UILabel *ORG_NAME;

// 发布公司提示
@property (weak, nonatomic) IBOutlet UILabel *ORG_NAME_label;

// 司机姓名
@property (weak, nonatomic) IBOutlet UILabel *DRIVER_NAME;

// 司机联系方式
@property (weak, nonatomic) IBOutlet UILabel *DRIVER_TEL;

@end


@implementation ZYListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setShipmentListM:(ShipmentListModel *)shipmentListM {
    
    _shipmentListM = shipmentListM;
    _SHIPMENT_NO.text = _shipmentListM.sHIPMENTNO;
    _DATE_LOAD.text = [self substringToThree:_shipmentListM.dATELOAD];
    _ORG_NAME.text = _shipmentListM.oRGNAME;
    _ORG_NAME.text = _shipmentListM.oRGNAME;
    
    if([_shipmentListM.oRGNAME isEqualToString:@""]) {  // 没发布公司
        
        _ORG_NAME_label.text = @"个人货源";
        _ORG_NAME.text = @"";
//        [_ORG_NAME_label setTextColor:[UIColor redColor]];
    } else {  // 有发布公司
        
        _ORG_NAME.text = _shipmentListM.oRGNAME;
//        [_ORG_NAME_label setTextColor:[UIColor blackColor]];
    }
    
    _DRIVER_NAME.text = _shipmentListM.dRIVERNAME;
    _DRIVER_TEL.text = _shipmentListM.dRIVERTEL;
}


/**
 截取字符串后三位
 
 @param string 截取前字符串
 
 @return 截取后字符串
 */
- (NSString *)substringToThree:(NSString *)string {
    
    NSString *str = string;
    if(string.length > 3) {
        
        str = [string substringToIndex:string.length - 3];
    }
    return str;
}

@end
