//
//  DriverAuthorityModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "DriverAuthorityModel.h"


NSString *const kDriverAuthorityModelENABLEADD = @"ENABLE_ADD";
NSString *const kDriverAuthorityModelENABLEDELETE = @"ENABLE_DELETE";
NSString *const kDriverAuthorityModelENABLEINFO = @"ENABLE_INFO";


@implementation DriverAuthorityModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kDriverAuthorityModelENABLEADD] isKindOfClass:[NSNull class]]){
        self.eNABLEADD = dictionary[kDriverAuthorityModelENABLEADD];
    }
    if(![dictionary[kDriverAuthorityModelENABLEDELETE] isKindOfClass:[NSNull class]]){
        self.eNABLEDELETE = dictionary[kDriverAuthorityModelENABLEDELETE];
    }
    if(![dictionary[kDriverAuthorityModelENABLEINFO] isKindOfClass:[NSNull class]]){
        self.eNABLEINFO = dictionary[kDriverAuthorityModelENABLEINFO];
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
        dictionary[kDriverAuthorityModelENABLEADD] = self.eNABLEADD;
    }
    if(self.eNABLEDELETE != nil){
        dictionary[kDriverAuthorityModelENABLEDELETE] = self.eNABLEDELETE;
    }
    if(self.eNABLEINFO != nil){
        dictionary[kDriverAuthorityModelENABLEINFO] = self.eNABLEINFO;
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
        [aCoder encodeObject:self.eNABLEADD forKey:kDriverAuthorityModelENABLEADD];
    }
    if(self.eNABLEDELETE != nil){
        [aCoder encodeObject:self.eNABLEDELETE forKey:kDriverAuthorityModelENABLEDELETE];
    }
    if(self.eNABLEINFO != nil){
        [aCoder encodeObject:self.eNABLEINFO forKey:kDriverAuthorityModelENABLEINFO];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.eNABLEADD = [aDecoder decodeObjectForKey:kDriverAuthorityModelENABLEADD];
    self.eNABLEDELETE = [aDecoder decodeObjectForKey:kDriverAuthorityModelENABLEDELETE];
    self.eNABLEINFO = [aDecoder decodeObjectForKey:kDriverAuthorityModelENABLEINFO];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    DriverAuthorityModel *copy = [DriverAuthorityModel new];
    
    copy.eNABLEADD = [self.eNABLEADD copy];
    copy.eNABLEDELETE = [self.eNABLEDELETE copy];
    copy.eNABLEINFO = [self.eNABLEINFO copy];
    
    return copy;
}

@end
