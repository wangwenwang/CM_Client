//
//  ShipmentListModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "ShipmentListModel.h"


NSString *const kShipmentListModelDATELOAD = @"DATE_LOAD";
NSString *const kShipmentListModelDRIVERNAME = @"DRIVER_NAME";
NSString *const kShipmentListModelDRIVERTEL = @"DRIVER_TEL";
NSString *const kShipmentListModelIDX = @"IDX";
NSString *const kShipmentListModelORGNAME = @"ORG_NAME";
NSString *const kShipmentListModelSHIPMENTNO = @"SHIPMENT_NO";


@implementation ShipmentListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kShipmentListModelDATELOAD] isKindOfClass:[NSNull class]]){
        self.dATELOAD = dictionary[kShipmentListModelDATELOAD];
    }
    if(![dictionary[kShipmentListModelDRIVERNAME] isKindOfClass:[NSNull class]]){
        self.dRIVERNAME = dictionary[kShipmentListModelDRIVERNAME];
    }
    if(![dictionary[kShipmentListModelDRIVERTEL] isKindOfClass:[NSNull class]]){
        self.dRIVERTEL = dictionary[kShipmentListModelDRIVERTEL];
    }
    if(![dictionary[kShipmentListModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kShipmentListModelIDX];
    }
    if(![dictionary[kShipmentListModelORGNAME] isKindOfClass:[NSNull class]]){
        self.oRGNAME = dictionary[kShipmentListModelORGNAME];
    }
    if(![dictionary[kShipmentListModelSHIPMENTNO] isKindOfClass:[NSNull class]]){
        self.sHIPMENTNO = dictionary[kShipmentListModelSHIPMENTNO];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.dATELOAD != nil){
        dictionary[kShipmentListModelDATELOAD] = self.dATELOAD;
    }
    if(self.dRIVERNAME != nil){
        dictionary[kShipmentListModelDRIVERNAME] = self.dRIVERNAME;
    }
    if(self.dRIVERTEL != nil){
        dictionary[kShipmentListModelDRIVERTEL] = self.dRIVERTEL;
    }
    if(self.iDX != nil){
        dictionary[kShipmentListModelIDX] = self.iDX;
    }
    if(self.oRGNAME != nil){
        dictionary[kShipmentListModelORGNAME] = self.oRGNAME;
    }
    if(self.sHIPMENTNO != nil){
        dictionary[kShipmentListModelSHIPMENTNO] = self.sHIPMENTNO;
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
    if(self.dATELOAD != nil){
        [aCoder encodeObject:self.dATELOAD forKey:kShipmentListModelDATELOAD];
    }
    if(self.dRIVERNAME != nil){
        [aCoder encodeObject:self.dRIVERNAME forKey:kShipmentListModelDRIVERNAME];
    }
    if(self.dRIVERTEL != nil){
        [aCoder encodeObject:self.dRIVERTEL forKey:kShipmentListModelDRIVERTEL];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kShipmentListModelIDX];
    }
    if(self.oRGNAME != nil){
        [aCoder encodeObject:self.oRGNAME forKey:kShipmentListModelORGNAME];
    }
    if(self.sHIPMENTNO != nil){
        [aCoder encodeObject:self.sHIPMENTNO forKey:kShipmentListModelSHIPMENTNO];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.dATELOAD = [aDecoder decodeObjectForKey:kShipmentListModelDATELOAD];
    self.dRIVERNAME = [aDecoder decodeObjectForKey:kShipmentListModelDRIVERNAME];
    self.dRIVERTEL = [aDecoder decodeObjectForKey:kShipmentListModelDRIVERTEL];
    self.iDX = [aDecoder decodeObjectForKey:kShipmentListModelIDX];
    self.oRGNAME = [aDecoder decodeObjectForKey:kShipmentListModelORGNAME];
    self.sHIPMENTNO = [aDecoder decodeObjectForKey:kShipmentListModelSHIPMENTNO];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    ShipmentListModel *copy = [ShipmentListModel new];
    
    copy.dATELOAD = [self.dATELOAD copy];
    copy.dRIVERNAME = [self.dRIVERNAME copy];
    copy.dRIVERTEL = [self.dRIVERTEL copy];
    copy.iDX = [self.iDX copy];
    copy.oRGNAME = [self.oRGNAME copy];
    copy.sHIPMENTNO = [self.sHIPMENTNO copy];
    
    return copy;
}
@end
