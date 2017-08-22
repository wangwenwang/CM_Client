//
//  FleetListModel.h
//  CMClient
//
//  Created by 凯东源 on 17/2/16.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FleetModel.h"



//{
//    "Fleet": [
//              {
//                  "CONTACT_PERSON": "王文望",
//                  "FLEET_NAME": "蜗牛车队",
//                  "FLEET_DESC": "与蜗牛赛跑，体验更快的运输服务",
//                  "IDX": "8",
//                  "CONTACT_TEL": "13726027405",
//                  "TMS_NAME": "凯东源",
//                  "FLEET_PROPERTY": "COMPANY"
//              },
//              {
//                  "CONTACT_PERSON" : "王文望",
//                  "FLEET_NAME" : "^_^",
//                  "FLEET_DESC" : "描述11",
//                  "IDX" : "55",
//                  "CONTACT_TEL" : "13726027405",
//                  "TMS_NAME" : "",
//                  "FLEET_PROPERTY" : "INDIVIDUAL"
//              }
//              ]
//}



@interface FleetListModel : NSObject

@property (nonatomic, strong) NSArray * fleetModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
