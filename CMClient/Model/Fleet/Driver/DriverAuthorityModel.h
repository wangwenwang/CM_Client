//
//  DriverAuthorityModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>


/// json在  DriverListModel.h


/// 司机权限
@interface DriverAuthorityModel : NSObject

@property (nonatomic, strong) NSString * eNABLEADD;
@property (nonatomic, strong) NSString * eNABLEDELETE;
@property (nonatomic, strong) NSString * eNABLEINFO;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
