//
//  OrderInfoModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderDetailItemModel.h"
#import "OrderDetailModel.h"



//{
//    "OrderDetailModel": {
//        "OTS_REMARK_RETURN": "",
//        "ORD_FROM_ADDRESS": "电饭锅和",
//        "IDX": "2",
//        "ORD_NO_CONSIGNEE": "333",
//        "ORD_FROM_NAME": "gfh",
//        "OTS_REMARK_DELIVERY": "",
//        "ORD_ISSUE_VOLUME": "38.0000",
//        "ORD_REMARK_CONSIGNEE": "",
//        "ORD_NO_CLIENT": "222",
//        "OTS_DELIVERY_NOTICE": "",
//        "ORD_PROJECTED_DELIVERY": "",
//        "OTS_DELIVERY_ACTUAL": "",
//        "ORD_VEHICLE_SIZE": "",
//        "ORD_DATE_ADD": "2017/3/3 13:57:25",
//        "ORD_FROM_CNAME": "",
//        "ORD_TO_NAME": "点后",
//        "ORD_TO_CTEL": "发给",
//        "ORD_NO": "9999",
//        "UPDATE03": "",
//        "ORD_DATE_EDIT": "2017/3/3 13:57:25",
//        "ORD_TO_CNAME": "电饭锅和",
//        "ORD_REQUEST_ISSUE": "",
//        "ORD_ISSUE_WEIGHT": "36.0000",
//        "ORD_ISSUE_QTY": "30.0000",
//        "OMS_REMARK_AUDIT": "",
//        "ORD_REQUEST_DELIVERY": "",
//        "TMS_ORD_NO": "666",
//        "ORD_REMARK_CLIENT": "",
//        "ORD_TO_ADDRESS": "格式",
//        "ORD_VEHICLE_TYPE": "",
//        "ORD_FROM_CTEL": "",
//        "ORD_TYPE_CLIENT": "",
//        "OTS_RETURN_DATE": ""
//    },
//    "OrderDetailItemModel": [
//                             {
//                                 "PRODUCT_DESC": "55",
//                                 "ISSUE_WEIGHT": "66.0000",
//                                 "ISSUE_QTY": "60.0000",
//                                 "ISSUE_VOLUME": "88.0000",
//                                 "ISSUE_UOM": "50",
//                                 "REMARK_SUPPLIER": "",
//                                 "IDX": "2",
//                                 "ORDER_IDX": "2",
//                                 "ENT_IDX": "9008",
//                                 "PRODUCT_NO": "22",
//                                 "PRODUCT_NAME": "感觉"
//                             }
//                             ]
//}


/// 订单信息（包括订单详情、订单详情item）
@interface OrderInfoModel : NSObject

@property (nonatomic, strong) NSArray * orderDetailItemModel;
@property (nonatomic, strong) OrderDetailModel * orderDetailModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
