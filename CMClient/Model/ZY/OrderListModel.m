//
//  OrderListModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "OrderListModel.h"

@implementation OrderListModel

NSString *const kOrderListModelIDX = @"IDX";
NSString *const kOrderListModelTMSORDNO = @"TMS_ORD_NO";

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kOrderListModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kOrderListModelIDX];
    }
    if(![dictionary[kOrderListModelTMSORDNO] isKindOfClass:[NSNull class]]){
        self.tMSORDNO = dictionary[kOrderListModelTMSORDNO];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.iDX != nil){
        dictionary[kOrderListModelIDX] = self.iDX;
    }
    if(self.tMSORDNO != nil){
        dictionary[kOrderListModelTMSORDNO] = self.tMSORDNO;
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kOrderListModelIDX];
    }
    if(self.tMSORDNO != nil){
        [aCoder encodeObject:self.tMSORDNO forKey:kOrderListModelTMSORDNO];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.iDX = [aDecoder decodeObjectForKey:kOrderListModelIDX];
    self.tMSORDNO = [aDecoder decodeObjectForKey:kOrderListModelTMSORDNO];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    OrderListModel *copy = [OrderListModel new];
    
    copy.iDX = [self.iDX copy];
    copy.tMSORDNO = [self.tMSORDNO copy];
    
    return copy;
}

@end
