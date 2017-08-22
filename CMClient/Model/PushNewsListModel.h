//
//  PushNewsListModel.h
//  CMClient
//
//  Created by 凯东源 on 17/2/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PushNewsModel.h"



//{   
//    "PushNewsListModel" : [
//                           
//    {
//        "MESSAGE" : "bhg",
//        "ISREAD" : "1",
//        "SHIPMENTNO" : "1002",
//        "TITLE" : "33",
//        "OrderNoListModel" : [
//                           
//        {
//            "ORD_IDX" : "3",
//            "ORD_NO" : "7777"
//        },
//                           
//        {
//            "ORD_IDX" : "2",
//            "ORD_NO" : "9999"
//        }
//                           ],
//        "IDX" : "2",
//        "TYPE" : "1",
//        "ADD_DATE" : "2017/3/2 17:35:12",
//        "SHIPMENTIDX" : "2",
//        "USER_ID" : "5"
//    }
//                           ]
//}
//
//
//
///// 已推送的消息
@interface PushNewsListModel : NSObject

@property (nonatomic, strong) NSArray * pushNewsModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
