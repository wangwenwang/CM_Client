//
//  DriverModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "DriverModel.h"


NSString *const kDriverModelCONTACTTEL = @"CONTACT_TEL";
NSString *const kDriverModelDRIVERNAME = @"DRIVER_NAME";
NSString *const kDriverModelDriverAuthorityModel = @"Authority";
NSString *const kDriverModelIDX = @"IDX";


@implementation DriverModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kDriverModelCONTACTTEL] isKindOfClass:[NSNull class]]){
        self.cONTACTTEL = dictionary[kDriverModelCONTACTTEL];
    }
    if(![dictionary[kDriverModelDRIVERNAME] isKindOfClass:[NSNull class]]){
        self.dRIVERNAME = dictionary[kDriverModelDRIVERNAME];
    }
    if(![dictionary[kDriverModelDriverAuthorityModel] isKindOfClass:[NSNull class]]){
        self.driverAuthorityModel = [[DriverAuthorityModel alloc] initWithDictionary:dictionary[kDriverModelDriverAuthorityModel]];
    }
    
    if(![dictionary[kDriverModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kDriverModelIDX];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.cONTACTTEL != nil){
        dictionary[kDriverModelCONTACTTEL] = self.cONTACTTEL;
    }
    if(self.dRIVERNAME != nil){
        dictionary[kDriverModelDRIVERNAME] = self.dRIVERNAME;
    }
    if(self.driverAuthorityModel != nil){
        dictionary[kDriverModelDriverAuthorityModel] = [self.driverAuthorityModel toDictionary];
    }
    if(self.iDX != nil){
        dictionary[kDriverModelIDX] = self.iDX;
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
    if(self.cONTACTTEL != nil){
        [aCoder encodeObject:self.cONTACTTEL forKey:kDriverModelCONTACTTEL];
    }
    if(self.dRIVERNAME != nil){
        [aCoder encodeObject:self.dRIVERNAME forKey:kDriverModelDRIVERNAME];
    }
    if(self.driverAuthorityModel != nil){
        [aCoder encodeObject:self.driverAuthorityModel forKey:kDriverModelDriverAuthorityModel];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kDriverModelIDX];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.cONTACTTEL = [aDecoder decodeObjectForKey:kDriverModelCONTACTTEL];
    self.dRIVERNAME = [aDecoder decodeObjectForKey:kDriverModelDRIVERNAME];
    self.driverAuthorityModel = [aDecoder decodeObjectForKey:kDriverModelDriverAuthorityModel];
    self.iDX = [aDecoder decodeObjectForKey:kDriverModelIDX];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    DriverModel *copy = [DriverModel new];
    
    copy.cONTACTTEL = [self.cONTACTTEL copy];
    copy.dRIVERNAME = [self.dRIVERNAME copy];
    copy.driverAuthorityModel = [self.driverAuthorityModel copy];
    copy.iDX = [self.iDX copy];
    
    return copy;
}

@end
