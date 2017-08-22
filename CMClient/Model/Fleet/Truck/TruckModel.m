//
//  TruckModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "TruckModel.h"

NSString *const kTruckModelIDX = @"IDX";
NSString *const kTruckModelPLATENUMBER = @"PLATE_NUMBER";
NSString *const kTruckModelVEHICLEMODEL = @"VEHICLE_MODEL";
NSString *const kTruckModelVEHICLESIZE = @"VEHICLE_SIZE";

@implementation TruckModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kTruckModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kTruckModelIDX];
    }
    if(![dictionary[kTruckModelPLATENUMBER] isKindOfClass:[NSNull class]]){
        self.pLATENUMBER = dictionary[kTruckModelPLATENUMBER];
    }
    if(![dictionary[kTruckModelVEHICLEMODEL] isKindOfClass:[NSNull class]]){
        self.vEHICLEMODEL = dictionary[kTruckModelVEHICLEMODEL];
    }
    if(![dictionary[kTruckModelVEHICLESIZE] isKindOfClass:[NSNull class]]){
        self.vEHICLESIZE = dictionary[kTruckModelVEHICLESIZE];
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
        dictionary[kTruckModelIDX] = self.iDX;
    }
    if(self.pLATENUMBER != nil){
        dictionary[kTruckModelPLATENUMBER] = self.pLATENUMBER;
    }
    if(self.vEHICLEMODEL != nil){
        dictionary[kTruckModelVEHICLEMODEL] = self.vEHICLEMODEL;
    }
    if(self.vEHICLESIZE != nil){
        dictionary[kTruckModelVEHICLESIZE] = self.vEHICLESIZE;
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
        [aCoder encodeObject:self.iDX forKey:kTruckModelIDX];
    }
    if(self.pLATENUMBER != nil){
        [aCoder encodeObject:self.pLATENUMBER forKey:kTruckModelPLATENUMBER];
    }
    if(self.vEHICLEMODEL != nil){
        [aCoder encodeObject:self.vEHICLEMODEL forKey:kTruckModelVEHICLEMODEL];
    }
    if(self.vEHICLESIZE != nil){
        [aCoder encodeObject:self.vEHICLESIZE forKey:kTruckModelVEHICLESIZE];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.iDX = [aDecoder decodeObjectForKey:kTruckModelIDX];
    self.pLATENUMBER = [aDecoder decodeObjectForKey:kTruckModelPLATENUMBER];
    self.vEHICLEMODEL = [aDecoder decodeObjectForKey:kTruckModelVEHICLEMODEL];
    self.vEHICLESIZE = [aDecoder decodeObjectForKey:kTruckModelVEHICLESIZE];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    TruckModel *copy = [TruckModel new];
    
    copy.iDX = [self.iDX copy];
    copy.pLATENUMBER = [self.pLATENUMBER copy];
    copy.vEHICLEMODEL = [self.vEHICLEMODEL copy];
    copy.vEHICLESIZE = [self.vEHICLESIZE copy];
    
    return copy;
}

@end
