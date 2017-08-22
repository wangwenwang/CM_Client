//
//  LocationContineTimeModel.m
//  CMClient
//
//  Created by 凯东源 on 17/2/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "LocationContineTimeModel.h"



NSString *const kLocationContineTimeModelADDRESS = @"ADDRESS";
NSString *const kLocationContineTimeModelCORDINATEX = @"CORDINATEX";
NSString *const kLocationContineTimeModelCORDINATEY = @"CORDINATEY";
NSString *const kLocationContineTimeModelIDField = @"ID";
NSString *const kLocationContineTimeModelTIME = @"TIME";
NSString *const kLocationContineTimeModelUSERIDX = @"USERIDX";



@implementation LocationContineTimeModel

//- (instancetype)init {
//    if(self = [super init]) {
//        _ID = @"";
//        _USERIDX = @"";
//        _CORDINATEX = @0;
//        _CORDINATEY = @0;
//        _ADDRESS = @"";
//        _TIME = @"";
//    }
//    return self;
//}




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kLocationContineTimeModelADDRESS] isKindOfClass:[NSNull class]]){
        self.aDDRESS = dictionary[kLocationContineTimeModelADDRESS];
    }
    if(![dictionary[kLocationContineTimeModelCORDINATEX] isKindOfClass:[NSNull class]]){
        self.cORDINATEX = [dictionary[kLocationContineTimeModelCORDINATEX] floatValue];
    }
    
    if(![dictionary[kLocationContineTimeModelCORDINATEY] isKindOfClass:[NSNull class]]){
        self.cORDINATEY = [dictionary[kLocationContineTimeModelCORDINATEY] floatValue];
    }
    
    if(![dictionary[kLocationContineTimeModelIDField] isKindOfClass:[NSNull class]]){
        self.iDField = dictionary[kLocationContineTimeModelIDField];
    }
    if(![dictionary[kLocationContineTimeModelTIME] isKindOfClass:[NSNull class]]){
        self.tIME = dictionary[kLocationContineTimeModelTIME];
    }
    if(![dictionary[kLocationContineTimeModelUSERIDX] isKindOfClass:[NSNull class]]){
        self.uSERIDX = dictionary[kLocationContineTimeModelUSERIDX];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aDDRESS != nil){
        dictionary[kLocationContineTimeModelADDRESS] = self.aDDRESS;
    }
    dictionary[kLocationContineTimeModelCORDINATEX] = @(self.cORDINATEX);
    dictionary[kLocationContineTimeModelCORDINATEY] = @(self.cORDINATEY);
    if(self.iDField != nil){
        dictionary[kLocationContineTimeModelIDField] = self.iDField;
    }
    if(self.tIME != nil){
        dictionary[kLocationContineTimeModelTIME] = self.tIME;
    }
    if(self.uSERIDX != nil){
        dictionary[kLocationContineTimeModelUSERIDX] = self.uSERIDX;
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
    if(self.aDDRESS != nil){
        [aCoder encodeObject:self.aDDRESS forKey:kLocationContineTimeModelADDRESS];
    }
    [aCoder encodeObject:@(self.cORDINATEX) forKey:kLocationContineTimeModelCORDINATEX];	[aCoder encodeObject:@(self.cORDINATEY) forKey:kLocationContineTimeModelCORDINATEY];	if(self.iDField != nil){
        [aCoder encodeObject:self.iDField forKey:kLocationContineTimeModelIDField];
    }
    if(self.tIME != nil){
        [aCoder encodeObject:self.tIME forKey:kLocationContineTimeModelTIME];
    }
    if(self.uSERIDX != nil){
        [aCoder encodeObject:self.uSERIDX forKey:kLocationContineTimeModelUSERIDX];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDRESS = [aDecoder decodeObjectForKey:kLocationContineTimeModelADDRESS];
    self.cORDINATEX = [[aDecoder decodeObjectForKey:kLocationContineTimeModelCORDINATEX] floatValue];
    self.cORDINATEY = [[aDecoder decodeObjectForKey:kLocationContineTimeModelCORDINATEY] floatValue];
    self.iDField = [aDecoder decodeObjectForKey:kLocationContineTimeModelIDField];
    self.tIME = [aDecoder decodeObjectForKey:kLocationContineTimeModelTIME];
    self.uSERIDX = [aDecoder decodeObjectForKey:kLocationContineTimeModelUSERIDX];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    LocationContineTimeModel *copy = [LocationContineTimeModel new];
    
    copy.aDDRESS = [self.aDDRESS copy];
    copy.cORDINATEX = self.cORDINATEX;
    copy.cORDINATEY = self.cORDINATEY;
    copy.iDField = [self.iDField copy];
    copy.tIME = [self.tIME copy];
    copy.uSERIDX = [self.uSERIDX copy];
    
    return copy;
}
@end
