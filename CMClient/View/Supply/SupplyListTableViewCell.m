//
//  SupplyListTableViewCell.m
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "SupplyListTableViewCell.h"
#import "Tools.h"

@interface SupplyListTableViewCell ()

// 线路城市
@property (weak, nonatomic) IBOutlet UILabel *ROUTES_CITY;

// 创建时间
@property (weak, nonatomic) IBOutlet UILabel *ADD_DATE;

// 整车重量
@property (weak, nonatomic) IBOutlet UILabel *TOTAL_WEIGHT;

// 要求车辆尺寸
@property (weak, nonatomic) IBOutlet UILabel *SUPPLY_VEHICLE_SIZE;

// 总件数
@property (weak, nonatomic) IBOutlet UILabel *TOTAL_QTY;

// 运费金额
@property (weak, nonatomic) IBOutlet UILabel *TOTAL_AMOUNT;


// 线路城市 父View 高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *TopViewHeight;

// 装运状态
@property (weak, nonatomic) IBOutlet UIImageView *SUPPLY_STATE;

@end


@implementation SupplyListTableViewCell


- (void)awakeFromNib {
    
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setSupplyListM:(SupplyListModel *)supplyListM {
    
    if(supplyListM) {
        
        @try {
            
            /***************  为了线路城市会换行  ***************/
            // _TopViewHeight.constant 原始高度
            static CGFloat topViewHeightOrg = 0;
            if(topViewHeightOrg == 0) {
                
                topViewHeightOrg = _TopViewHeight.constant;
            }
            
            // 计算单行Label高度
            UILabel *label = [[UILabel alloc] init];
            label.text = @"一行高度";
            label.font = _ROUTES_CITY.font;
            [label sizeToFit];
            CGFloat oneLineHeight = CGRectGetHeight(label.frame);
            
            _ROUTES_CITY.text = [Tools routesCityConvert:supplyListM.rOUTESCITY];
            [self layoutIfNeeded];
            [_ROUTES_CITY sizeToFit];
            
            CGFloat ROUTES_CITY_Height = CGRectGetHeight(_ROUTES_CITY.frame);
            if(ROUTES_CITY_Height > oneLineHeight) {
                
                _TopViewHeight.constant = topViewHeightOrg + ROUTES_CITY_Height - oneLineHeight - 3; // 减3为了靠下的距离短一点
            } else {
                
                _TopViewHeight.constant = topViewHeightOrg;
            }
            /***************  为了地址线路会换行  ***************/
            
            _ADD_DATE.text = [Tools compareCurrentTime:supplyListM.aDDDATE];
            _TOTAL_WEIGHT.text = [NSString stringWithFormat:@"%.2f吨", [supplyListM.tOTALWEIGHT floatValue]];
            _SUPPLY_VEHICLE_SIZE.text = [NSString stringWithFormat:@"%@ %@", supplyListM.sUPPLYVEHICLESIZE, supplyListM.sUPPLYVEHICLETYPE];
            _TOTAL_QTY.text = [NSString stringWithFormat:@"%.0f件", [supplyListM.tOTALQTY floatValue]];
            _TOTAL_AMOUNT.text = [NSString stringWithFormat:@"￥%.1f", [supplyListM.tOTALAMOUNT floatValue]];
            
            if([supplyListM.sUPPLYSTATE isEqualToString:@"OPEN"] && [supplyListM.sUPPLYWOKERFLOW isEqualToString:@"新建"]) {
                
                _SUPPLY_STATE.image = [UIImage imageNamed:@"SUPPLY_WOKERFLOW_new"];
            } else if([supplyListM.sUPPLYSTATE isEqualToString:@"OPEN"] && [supplyListM.sUPPLYWOKERFLOW isEqualToString:@"已接单"]) {
                
                _SUPPLY_STATE.image = [UIImage imageNamed:@"SUPPLY_WOKERFLOW_received"];
            } else if([supplyListM.sUPPLYSTATE isEqualToString:@"OPEN"] && [supplyListM.sUPPLYWOKERFLOW isEqualToString:@"已确认"]) {
                
                _SUPPLY_STATE.image = [UIImage imageNamed:@"SUPPLY_WOKERFLOW_confirm"];
            } else if([supplyListM.sUPPLYSTATE isEqualToString:@"OPEN"] && [supplyListM.sUPPLYWOKERFLOW isEqualToString:@"已发运"]) {
                
                _SUPPLY_STATE.image = [UIImage imageNamed:@"SUPPLY_WOKERFLOW_leave_warehouse"];
            } else if([supplyListM.sUPPLYSTATE isEqualToString:@"CANCEL"]) {
                
                _SUPPLY_STATE.image = [UIImage imageNamed:@"SUPPLY_STATE_cancel"];
            } else if([supplyListM.sUPPLYSTATE isEqualToString:@"OPEN"] && [supplyListM.sUPPLYWOKERFLOW isEqualToString:@"已完成"]) {
                
                _SUPPLY_STATE.image = [UIImage imageNamed:@"SUPPLY_WOKERFLOW_complete"];
            } else {
             
                _SUPPLY_STATE.image = nil;
            }
        } @catch (NSException *exception) {
            
            [Tools showAlert:self.contentView andTitle:@"数据异常"];
        }
    }
}

@end
