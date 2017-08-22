//
//  FleetModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/11.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>




/// json在  FleetListModel.h



@interface FleetModel : NSObject

/// 车队id
@property (nonatomic, strong) NSString * iDX;

/// 车队类型
@property (nonatomic, strong) NSString * fLEETPROPERTY;

/// 公司名称
@property (nonatomic, strong) NSString * tMSNAME;

/// 车队名
@property (nonatomic, strong) NSString * fLEETNAME;

/// 车队描述
@property (nonatomic, strong) NSString * fLEETDESC;

/// 车队负责人
@property (nonatomic, strong) NSString * cONTACTPERSON;

/// 联系电话
@property (nonatomic, strong) NSString * cONTACTTEL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end
