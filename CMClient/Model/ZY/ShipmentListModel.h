//
//  ShipmentListModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>



//{
//    "IDX" : "",
//    "SHIPMENT_NO" : "",
//    "DATE_LOAD" : "",
//    "DRIVER_NAME" : "",
//    "DRIVER_TEL" : "",
//    "ORG_NAME" : ""
//}



/// 装运列表
@interface ShipmentListModel : NSObject

/// 装运时间
@property (nonatomic, strong) NSString * dATELOAD;

/// ID号
@property (nonatomic, strong) NSString * iDX;

/// 装运流水号
@property (nonatomic, strong) NSString * sHIPMENTNO;

/// 司机姓名
@property (nonatomic, strong) NSString * dRIVERNAME;

/// 司机联系方式
@property (nonatomic, strong) NSString * dRIVERTEL;

/// 发布公司
@property (nonatomic, strong) NSString * oRGNAME;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
