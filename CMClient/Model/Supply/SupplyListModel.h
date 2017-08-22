//
//  SupplyListModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>




//{
//    "IDX" : "1",
//    "ROUTES_CITY" : "武汉",
//    "SUPPLY_VEHICLE_SIZE" : "33",
//    "SUPPLY_NO" : "22",
//    "TOTAL_VOLUME" : "20.00",
//    "TOTAL_WEIGHT" : "20.00",
//    "ORG_NAME" : "凯东源",
//    "SUPPLY_STATE" : "CANCEL",
//    "TOTAL_AMOUNT" : "30.00",
//    "SUPPLY_VEHICLE_TYPE" : "35",
//    "TOTAL_QTY" : "20.00",
//    "ADD_DATE" : "2017/3/1 14:00:45",
//    "SUPPLY_WOKERFLOW" : "已完成"
//}





/**
货源列表
*/
@interface SupplyListModel : NSObject

@property (nonatomic, strong) NSString * aDDDATE;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * oRGNAME;
@property (nonatomic, strong) NSString * rOUTESCITY;
@property (nonatomic, strong) NSString * sUPPLYNO;
@property (nonatomic, strong) NSString * sUPPLYSTATE;
@property (nonatomic, strong) NSString * sUPPLYVEHICLESIZE;
@property (nonatomic, strong) NSString * sUPPLYVEHICLETYPE;
@property (nonatomic, strong) NSString * sUPPLYWOKERFLOW;
@property (nonatomic, strong) NSString * tOTALAMOUNT;
@property (nonatomic, strong) NSString * tOTALQTY;
@property (nonatomic, strong) NSString * tOTALVOLUME;
@property (nonatomic, strong) NSString * tOTALWEIGHT;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

// Cell 高度
@property (assign, nonatomic) CGFloat cellHeight;

@end
