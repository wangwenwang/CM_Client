//
//  DriverListModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DriverAuthorityModel.h"
#import "DriverModel.h"



//{
//    "DriverModel": [
//                    {
//                        "DriverAuthorityModel": {
//                            "ENABLE_INFO": "",
//                            "ENABLE_DELETE": "",
//                            "ENABLE_ADD": ""
//                        },
//                        "CONTACT_TEL": "13800138000",
//                        "DRIVER_NAME": "UserName",
//                        "IDX": "5"
//                    },
//                    {
//                        "DriverAuthorityModel": {
//                            "ENABLE_INFO": "",
//                            "ENABLE_DELETE": "",
//                            "ENABLE_ADD": ""
//                        },
//                        "CONTACT_TEL": "13726027405",
//                        "DRIVER_NAME": "123",
//                        "IDX": "4"
//                    }
//                    ],
//    "DriverAuthorityModel": {
//        "ENABLE_INFO": "Y",
//        "ENABLE_DELETE": "Y",
//        "ENABLE_ADD": "Y"
//    }
//}



/// 司机列表
@interface DriverListModel : NSObject

@property (nonatomic, strong) DriverAuthorityModel * driverAuthorityModel;
@property (nonatomic, strong) NSMutableArray * driverModel;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
