//
//  GetItemListModel.h
//  CMClient
//
//  Created by 凯东源 on 17/5/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetItemListModel : NSObject

@property (nonatomic, strong) NSArray * supplyType;
@property (nonatomic, strong) NSArray * vehicleSize;
@property (nonatomic, strong) NSArray * vehicleType;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
