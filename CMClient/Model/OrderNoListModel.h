//
//  OrderNoListModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/30.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderNoListModel : NSObject

@property (nonatomic, strong) NSString * oRDIDX;
@property (nonatomic, strong) NSString * oRDNO;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
