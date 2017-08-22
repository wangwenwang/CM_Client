//
//  PassingTableViewCell.m
//  CMClient
//
//  Created by 凯东源 on 17/5/13.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "PassingTableViewCell.h"

@interface PassingTableViewCell ()

// 地址名称
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_NAME;

// 地址类型
@property (weak, nonatomic) IBOutlet UILabel *ROUTES_TYPE;

// 联系人
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_PERSON;

// 联系电话
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_TEL;

// 地址汇总
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_INFO;

@end

@implementation PassingTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setRouteM:(Routes_UploadModel *)routeM {
    
    _routeM = routeM;
    
    _ADDRESS_NAME.text = _routeM.aDDRESSNAME;
//    _ROUTES_TYPE.text = _routeM.rOUTESTYPE;
    _ADDRESS_PERSON.text = _routeM.aDDRESSPERSON;
    _ADDRESS_TEL.text = _routeM.aDDRESSTEL;
    _ADDRESS_INFO.text = _routeM.aDDRESSINFO;
    
    // 地址类型
    _ROUTES_TYPE.text = _routeM.rOUTESTYPE_Convert;
}

@end
