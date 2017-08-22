//
//  SupplyInfoModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RoutesModel.h"
#import "SupplyModel.h"




//{
//    "RoutesModel": [
//                    {
//                        "ADDRESS_NAME": "酸辣粉",
//                        "ADDRESS_INFO": "按规划了过",
//                        "ADDRESS_PERSON": "",
//                        "ADDRESS_REMARK": "",
//                        "REFERENCE01": "",
//                        "REFERENCE02": "",
//                        "REFERENCE03": "",
//                        "REFERENCE04": "",
//                        "REFERENCE05": "",
//                        "ADDRESS_TEL": "",
//                        "ROUTES_TYPE": "1",
//                        "ADDRESS_CLASS": "",
//                        "ADDRESS_TYPE": ""
//                    }
//                    ],
//    "SupplyModel": {
//        "SUPPLY_NO": "22",
//        "REFERENCE06": "",
//        "DISTRIBUTION_EXPERIENCE": "案例减肥",
//        "RECEIVING_IDX": "2",
//        "TOTAL_QTY": "20.00",
//        "USER_TEL": "3",
//        "BRAND_MODEL": "10",
//        "ORG_IDX": "2",
//        "REFERENCE07": "",
//        "VEHICLE_IDX": "6",
//        "SUPPLY_VEHICLE_SIZE": "33",
//        "TOTAL_DROP": "3.0000",
//        "ORG_NAME": "凯东源",
//        "SHIPMENT_DATE_STRAT": "2017/2/28 0:00:00",
//        "TASK_DESCRIPTION_OTHER": "",
//        "REFERENCE08": "",
//        "FLEET_NAME": "5",
//        "HAVE_LOAD": "",
//        "REFERENCE01": "",
//        "IS_RETURN": "是",
//        "DRIVER_NAME": "12",
//        "VERSION_NUMBER": "14",
//        "PLATE_NUMBER": "7",
//        "REFERENCE09": "",
//        "TOTAL_ROUTES": "55.0000",
//        "SHIPMENT_DATE_END": "2017/3/4 0:00:00",
//        "REQUEST_WAREHOUSE": "2017/3/1 0:00:00",
//        "VEHICLE_TYPE": "8",
//        "REFERENCE02": "",
//        "TASK_DESCRIPTION": "",
//        "DRIVER_IDX": "11",
//        "USERNAME": "123",
//        "REFERENCE03": "",
//        "REFERENCE10": "",
//        "TMS_SHIPMENT_NO": "333",
//        "REQUEST_ISSUE": "2017/4/1 0:00:00",
//        "HAVE_UNLOAD": "",
//        "FLEET_IDX": "4",
//        "ADD_DATE": "2017/3/1 14:00:45",
//        "EDIT_DATE": "2017/3/1 14:00:45",
//        "TMS_IDX": "1",
//        "ROUTES_CITY": "武汉",
//        "REFERENCE04": "",
//        "HANDLING_DEGREE": "",
//        "IS_HANDLING": "",
//        "TOTAL_AMOUNT": "30.00",
//        "APP_USER_IDX": "4",
//        "IS_RETURN_STORE": "是",
//        "SUPPLY_VEHICLE_TYPE": "354",
//        "VEHICLE_SIZE": "9",
//        "TOTAL_WEIGHT": "20.00",
//        "SUPPLY_TYPE": "",
//        "TOTAL_VOLUME": "20.00",
//        "DRIVER_REQUEST": "",
//        "REFERENCE05": "",
//        "SUPPLY_STATE": "CANCEL",
//        "DRIVER_TEL": "13",
//        "SUPPLY_WOKERFLOW": "已完成",
//        "IDX": "1"
//    }
//}




@interface SupplyInfoModel : NSObject

@property (nonatomic, strong) NSArray * routesModel;
@property (nonatomic, strong) SupplyModel * supplyModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
