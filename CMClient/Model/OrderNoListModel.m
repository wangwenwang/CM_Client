//
//  OrderNoListModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/30.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "OrderNoListModel.h"


NSString *const kOrderNoListModelORDIDX = @"ORD_IDX";
NSString *const kOrderNoListModelORDNO = @"ORD_NO";


@implementation OrderNoListModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kOrderNoListModelORDIDX] isKindOfClass:[NSNull class]]){
        self.oRDIDX = dictionary[kOrderNoListModelORDIDX];
    }
    if(![dictionary[kOrderNoListModelORDNO] isKindOfClass:[NSNull class]]){
        self.oRDNO = dictionary[kOrderNoListModelORDNO];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.oRDIDX != nil){
        dictionary[kOrderNoListModelORDIDX] = self.oRDIDX;
    }
    if(self.oRDNO != nil){
        dictionary[kOrderNoListModelORDNO] = self.oRDNO;
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
    if(self.oRDIDX != nil){
        [aCoder encodeObject:self.oRDIDX forKey:kOrderNoListModelORDIDX];
    }
    if(self.oRDNO != nil){
        [aCoder encodeObject:self.oRDNO forKey:kOrderNoListModelORDNO];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.oRDIDX = [aDecoder decodeObjectForKey:kOrderNoListModelORDIDX];
    self.oRDNO = [aDecoder decodeObjectForKey:kOrderNoListModelORDNO];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    OrderNoListModel *copy = [OrderNoListModel new];
    
    copy.oRDIDX = [self.oRDIDX copy];
    copy.oRDNO = [self.oRDNO copy];
    
    return copy;
}

@end
