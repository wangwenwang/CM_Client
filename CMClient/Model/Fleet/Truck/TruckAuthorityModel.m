//
//  TruckAuthorityModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "TruckAuthorityModel.h"

//NSString *const kTruckAuthorityModelENABLEADD = @"ENABLE_ADD";
NSString *const kTruckAuthorityModelENABLEADD = @"ENABLE_INFO";
NSString *const kTruckAuthorityModelENABLEDELETE = @"ENABLE_DELETE";

@implementation TruckAuthorityModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kTruckAuthorityModelENABLEADD] isKindOfClass:[NSNull class]]){
        self.eNABLEADD = dictionary[kTruckAuthorityModelENABLEADD];
    }
    if(![dictionary[kTruckAuthorityModelENABLEDELETE] isKindOfClass:[NSNull class]]){
        self.eNABLEDELETE = dictionary[kTruckAuthorityModelENABLEDELETE];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.eNABLEADD != nil){
        dictionary[kTruckAuthorityModelENABLEADD] = self.eNABLEADD;
    }
    if(self.eNABLEDELETE != nil){
        dictionary[kTruckAuthorityModelENABLEDELETE] = self.eNABLEDELETE;
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
    if(self.eNABLEADD != nil){
        [aCoder encodeObject:self.eNABLEADD forKey:kTruckAuthorityModelENABLEADD];
    }
    if(self.eNABLEDELETE != nil){
        [aCoder encodeObject:self.eNABLEDELETE forKey:kTruckAuthorityModelENABLEDELETE];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.eNABLEADD = [aDecoder decodeObjectForKey:kTruckAuthorityModelENABLEADD];
    self.eNABLEDELETE = [aDecoder decodeObjectForKey:kTruckAuthorityModelENABLEDELETE];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    TruckAuthorityModel *copy = [TruckAuthorityModel new];
    
    copy.eNABLEADD = [self.eNABLEADD copy];
    copy.eNABLEDELETE = [self.eNABLEDELETE copy];
    
    return copy;
}

@end
