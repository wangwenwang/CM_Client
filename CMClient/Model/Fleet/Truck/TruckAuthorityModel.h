//
//  TruckAuthorityModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>


//{
//    "ENABLE_DELETE" : "Y",
//    "ENABLE_ADD" : "Y"
//}


@interface TruckAuthorityModel : NSObject

@property (nonatomic, strong) NSString * eNABLEADD;
@property (nonatomic, strong) NSString * eNABLEDELETE;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
