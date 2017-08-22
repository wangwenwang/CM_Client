//
//  ShipmentInfoModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/7.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderModel.h"
#import "ShipmentModel.h"



//{
//    "ShipmentModel": {
//        "IDX": "2",
//        "SHIPMENT_NO": "1002",
//        "ORG_IDX": "2",
//        "ORG_NAME": "发给",
//        "TMS_IDX": "1",
//        "TMS_SHIPMENT_NO": "2002",
//        "SUPPLY_IDX": "1",
//        "DATE_LOAD": "2017/3/3 11:15:10",
//        "DATE_CONFIRMED": "",
//        "DATE_ISSUE": "",
//        "FLEET_IDX": "52",
//        "FLEET_NAME": "7",
//        "VEHICLE_IDX": "",
//        "PLATE_NUMBER": "66666",
//        "VEHICLE_SIZE": "",
//        "VEHICLE_TYPE": "感觉",
//        "DRIVER_IDX": "",
//        "DRIVER_NAME": "光华科技",
//        "DRIVER_TEL": "222222222",
//        "SHIPMENT_STATE": "OPEN",
//        "TOTAL_WEIGHT": "30.00",
//        "TOTAL_VOLUME": "40.00",
//        "FROM_CITY": "",
//        "TO_CITY": "",
//        "AUDIT_FLAG": "",
//        "USER_NAME": "123",
//        "DATE_ADD": "2017/3/3 11:15:10",
//        "DATE_EDIT": "2017/3/3 11:15:10",
//        "REFERENCE01": "",
//        "REFERENCE02": "",
//        "REFERENCE03": "",
//        "REFERENCE04": "",
//        "REFERENCE05": "",
//        "REFERENCE06": ""
//    },
//    "OrderModel": [
//                   {
//                       "IDX": "2",
//                       "ORD_NO": "9999",
//                       "TMS_ORD_NO": "666",
//                       "ORD_NO_CLIENT": "222",
//                       "ORD_FROM_NAME": "gfh",
//                       "ORD_FROM_ADDRESS": "电饭锅和",
//                       "ORD_FROM_CNAME": "",
//                       "ORD_FROM_CTEL": "",
//                       "ORD_TO_NAME": "点后",
//                       "ORD_TO_ADDRESS": "格式",
//                       "ORD_TO_CNAME": "电饭锅和",
//                       "ORD_TO_CTEL": "发给",
//                       "ORD_ISSUE_QTY": "30.0000",
//                       "ORD_ISSUE_WEIGHT": "36.0000",
//                       "ORD_ISSUE_VOLUME": "38.0000",
//                       "UPDATE03": ""
//                   },
//                   {
//                       "IDX": "3",
//                       "ORD_NO": "7777",
//                       "TMS_ORD_NO": "777",
//                       "ORD_NO_CLIENT": "333",
//                       "ORD_FROM_NAME": "发货",
//                       "ORD_FROM_ADDRESS": "发货",
//                       "ORD_FROM_CNAME": "",
//                       "ORD_FROM_CTEL": "",
//                       "ORD_TO_NAME": "发货很健康",
//                       "ORD_TO_ADDRESS": "格式",
//                       "ORD_TO_CNAME": "发货",
//                       "ORD_TO_CTEL": "格式",
//                       "ORD_ISSUE_QTY": "50.0000",
//                       "ORD_ISSUE_WEIGHT": "88.0000",
//                       "ORD_ISSUE_VOLUME": "778.0000",
//                       "UPDATE03": ""
//                   }
//                   ]
//}


/// 装运信息（包括部分订单信息）
@interface ShipmentInfoModel : NSObject


@property (nonatomic, strong) NSArray * orderModel;
@property (nonatomic, strong) ShipmentModel * shipmentModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;


@end
