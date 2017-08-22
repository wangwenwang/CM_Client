//
//  FleetModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/11.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "FleetModel.h"


NSString *const kFleetListModelCONTACTPERSON = @"CONTACT_PERSON";
NSString *const kFleetListModelCONTACTTEL = @"CONTACT_TEL";
NSString *const kFleetListModelFLEETDESC = @"FLEET_DESC";
NSString *const kFleetListModelFLEETNAME = @"FLEET_NAME";
NSString *const kFleetListModelFLEETPROPERTY = @"FLEET_PROPERTY";
NSString *const kFleetListModelIDX = @"IDX";
NSString *const kFleetListModelTMSNAME = @"TMS_NAME";


@implementation FleetModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kFleetListModelCONTACTPERSON] isKindOfClass:[NSNull class]]){
        self.cONTACTPERSON = dictionary[kFleetListModelCONTACTPERSON];
    }
    if(![dictionary[kFleetListModelCONTACTTEL] isKindOfClass:[NSNull class]]){
        self.cONTACTTEL = dictionary[kFleetListModelCONTACTTEL];
    }
    if(![dictionary[kFleetListModelFLEETDESC] isKindOfClass:[NSNull class]]){
        self.fLEETDESC = dictionary[kFleetListModelFLEETDESC];
    }
    if(![dictionary[kFleetListModelFLEETNAME] isKindOfClass:[NSNull class]]){
        self.fLEETNAME = dictionary[kFleetListModelFLEETNAME];
    }
    if(![dictionary[kFleetListModelFLEETPROPERTY] isKindOfClass:[NSNull class]]){
        self.fLEETPROPERTY = dictionary[kFleetListModelFLEETPROPERTY];
    }
    if(![dictionary[kFleetListModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kFleetListModelIDX];
    }
    if(![dictionary[kFleetListModelTMSNAME] isKindOfClass:[NSNull class]]){
        self.tMSNAME = dictionary[kFleetListModelTMSNAME];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.cONTACTPERSON != nil){
        dictionary[kFleetListModelCONTACTPERSON] = self.cONTACTPERSON;
    }
    if(self.cONTACTTEL != nil){
        dictionary[kFleetListModelCONTACTTEL] = self.cONTACTTEL;
    }
    if(self.fLEETDESC != nil){
        dictionary[kFleetListModelFLEETDESC] = self.fLEETDESC;
    }
    if(self.fLEETNAME != nil){
        dictionary[kFleetListModelFLEETNAME] = self.fLEETNAME;
    }
    if(self.fLEETPROPERTY != nil){
        dictionary[kFleetListModelFLEETPROPERTY] = self.fLEETPROPERTY;
    }
    if(self.iDX != nil){
        dictionary[kFleetListModelIDX] = self.iDX;
    }
    if(self.tMSNAME != nil){
        dictionary[kFleetListModelTMSNAME] = self.tMSNAME;
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
    if(self.cONTACTPERSON != nil){
        [aCoder encodeObject:self.cONTACTPERSON forKey:kFleetListModelCONTACTPERSON];
    }
    if(self.cONTACTTEL != nil){
        [aCoder encodeObject:self.cONTACTTEL forKey:kFleetListModelCONTACTTEL];
    }
    if(self.fLEETDESC != nil){
        [aCoder encodeObject:self.fLEETDESC forKey:kFleetListModelFLEETDESC];
    }
    if(self.fLEETNAME != nil){
        [aCoder encodeObject:self.fLEETNAME forKey:kFleetListModelFLEETNAME];
    }
    if(self.fLEETPROPERTY != nil){
        [aCoder encodeObject:self.fLEETPROPERTY forKey:kFleetListModelFLEETPROPERTY];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kFleetListModelIDX];
    }
    if(self.tMSNAME != nil){
        [aCoder encodeObject:self.tMSNAME forKey:kFleetListModelTMSNAME];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.cONTACTPERSON = [aDecoder decodeObjectForKey:kFleetListModelCONTACTPERSON];
    self.cONTACTTEL = [aDecoder decodeObjectForKey:kFleetListModelCONTACTTEL];
    self.fLEETDESC = [aDecoder decodeObjectForKey:kFleetListModelFLEETDESC];
    self.fLEETNAME = [aDecoder decodeObjectForKey:kFleetListModelFLEETNAME];
    self.fLEETPROPERTY = [aDecoder decodeObjectForKey:kFleetListModelFLEETPROPERTY];
    self.iDX = [aDecoder decodeObjectForKey:kFleetListModelIDX];
    self.tMSNAME = [aDecoder decodeObjectForKey:kFleetListModelTMSNAME];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    FleetModel *copy = [FleetModel new];
    
    copy.cONTACTPERSON = [self.cONTACTPERSON copy];
    copy.cONTACTTEL = [self.cONTACTTEL copy];
    copy.fLEETDESC = [self.fLEETDESC copy];
    copy.fLEETNAME = [self.fLEETNAME copy];
    copy.fLEETPROPERTY = [self.fLEETPROPERTY copy];
    copy.iDX = [self.iDX copy];
    copy.tMSNAME = [self.tMSNAME copy];
    
    return copy;
}

@end
