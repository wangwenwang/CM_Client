//
//  DriverModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DriverAuthorityModel.h"


/// json在  DriverListModel.h


/// 司机
@interface DriverModel : NSObject

@property (nonatomic, strong) NSString * cONTACTTEL;
@property (nonatomic, strong) NSString * dRIVERNAME;
@property (nonatomic, strong) DriverAuthorityModel * driverAuthorityModel;
@property (nonatomic, strong) NSString * iDX;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
