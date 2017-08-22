//
//  TruckListModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TruckModel.h"
#import "TruckAuthorityModel.h"

@interface TruckListModel : NSObject

@property (nonatomic, strong) TruckAuthorityModel * authority;
@property (nonatomic, strong) NSMutableArray * truck;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
