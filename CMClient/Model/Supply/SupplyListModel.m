//
//  SupplyListModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "SupplyListModel.h"

@implementation SupplyListModel

NSString *const kSupplyListModelADDDATE = @"ADD_DATE";
NSString *const kSupplyListModelIDX = @"IDX";
NSString *const kSupplyListModelORGNAME = @"ORG_NAME";
NSString *const kSupplyListModelROUTESCITY = @"ROUTES_CITY";
NSString *const kSupplyListModelSUPPLYNO = @"SUPPLY_NO";
NSString *const kSupplyListModelSUPPLYSTATE = @"SUPPLY_STATE";
NSString *const kSupplyListModelSUPPLYVEHICLESIZE = @"SUPPLY_VEHICLE_SIZE";
NSString *const kSupplyListModelSUPPLYVEHICLETYPE = @"SUPPLY_VEHICLE_TYPE";
NSString *const kSupplyListModelSUPPLYWOKERFLOW = @"SUPPLY_WOKERFLOW";
NSString *const kSupplyListModelTOTALAMOUNT = @"TOTAL_AMOUNT";
NSString *const kSupplyListModelTOTALQTY = @"TOTAL_QTY";
NSString *const kSupplyListModelTOTALVOLUME = @"TOTAL_VOLUME";
NSString *const kSupplyListModelTOTALWEIGHT = @"TOTAL_WEIGHT";


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kSupplyListModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kSupplyListModelADDDATE];
    }
    if(![dictionary[kSupplyListModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kSupplyListModelIDX];
    }
    if(![dictionary[kSupplyListModelORGNAME] isKindOfClass:[NSNull class]]){
        self.oRGNAME = dictionary[kSupplyListModelORGNAME];
    }
    if(![dictionary[kSupplyListModelROUTESCITY] isKindOfClass:[NSNull class]]){
        self.rOUTESCITY = dictionary[kSupplyListModelROUTESCITY];
    }
    if(![dictionary[kSupplyListModelSUPPLYNO] isKindOfClass:[NSNull class]]){
        self.sUPPLYNO = dictionary[kSupplyListModelSUPPLYNO];
    }
    if(![dictionary[kSupplyListModelSUPPLYSTATE] isKindOfClass:[NSNull class]]){
        self.sUPPLYSTATE = dictionary[kSupplyListModelSUPPLYSTATE];
    }
    if(![dictionary[kSupplyListModelSUPPLYVEHICLESIZE] isKindOfClass:[NSNull class]]){
        self.sUPPLYVEHICLESIZE = dictionary[kSupplyListModelSUPPLYVEHICLESIZE];
    }
    if(![dictionary[kSupplyListModelSUPPLYVEHICLETYPE] isKindOfClass:[NSNull class]]){
        self.sUPPLYVEHICLETYPE = dictionary[kSupplyListModelSUPPLYVEHICLETYPE];
    }
    if(![dictionary[kSupplyListModelSUPPLYWOKERFLOW] isKindOfClass:[NSNull class]]){
        self.sUPPLYWOKERFLOW = dictionary[kSupplyListModelSUPPLYWOKERFLOW];
    }
    if(![dictionary[kSupplyListModelTOTALAMOUNT] isKindOfClass:[NSNull class]]){
        self.tOTALAMOUNT = dictionary[kSupplyListModelTOTALAMOUNT];
    }
    if(![dictionary[kSupplyListModelTOTALQTY] isKindOfClass:[NSNull class]]){
        self.tOTALQTY = dictionary[kSupplyListModelTOTALQTY];
    }
    if(![dictionary[kSupplyListModelTOTALVOLUME] isKindOfClass:[NSNull class]]){
        self.tOTALVOLUME = dictionary[kSupplyListModelTOTALVOLUME];
    }
    if(![dictionary[kSupplyListModelTOTALWEIGHT] isKindOfClass:[NSNull class]]){
        self.tOTALWEIGHT = dictionary[kSupplyListModelTOTALWEIGHT];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aDDDATE != nil){
        dictionary[kSupplyListModelADDDATE] = self.aDDDATE;
    }
    if(self.iDX != nil){
        dictionary[kSupplyListModelIDX] = self.iDX;
    }
    if(self.oRGNAME != nil){
        dictionary[kSupplyListModelORGNAME] = self.oRGNAME;
    }
    if(self.rOUTESCITY != nil){
        dictionary[kSupplyListModelROUTESCITY] = self.rOUTESCITY;
    }
    if(self.sUPPLYNO != nil){
        dictionary[kSupplyListModelSUPPLYNO] = self.sUPPLYNO;
    }
    if(self.sUPPLYSTATE != nil){
        dictionary[kSupplyListModelSUPPLYSTATE] = self.sUPPLYSTATE;
    }
    if(self.sUPPLYVEHICLESIZE != nil){
        dictionary[kSupplyListModelSUPPLYVEHICLESIZE] = self.sUPPLYVEHICLESIZE;
    }
    if(self.sUPPLYVEHICLETYPE != nil){
        dictionary[kSupplyListModelSUPPLYVEHICLETYPE] = self.sUPPLYVEHICLETYPE;
    }
    if(self.sUPPLYWOKERFLOW != nil){
        dictionary[kSupplyListModelSUPPLYWOKERFLOW] = self.sUPPLYWOKERFLOW;
    }
    if(self.tOTALAMOUNT != nil){
        dictionary[kSupplyListModelTOTALAMOUNT] = self.tOTALAMOUNT;
    }
    if(self.tOTALQTY != nil){
        dictionary[kSupplyListModelTOTALQTY] = self.tOTALQTY;
    }
    if(self.tOTALVOLUME != nil){
        dictionary[kSupplyListModelTOTALVOLUME] = self.tOTALVOLUME;
    }
    if(self.tOTALWEIGHT != nil){
        dictionary[kSupplyListModelTOTALWEIGHT] = self.tOTALWEIGHT;
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
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kSupplyListModelADDDATE];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kSupplyListModelIDX];
    }
    if(self.oRGNAME != nil){
        [aCoder encodeObject:self.oRGNAME forKey:kSupplyListModelORGNAME];
    }
    if(self.rOUTESCITY != nil){
        [aCoder encodeObject:self.rOUTESCITY forKey:kSupplyListModelROUTESCITY];
    }
    if(self.sUPPLYNO != nil){
        [aCoder encodeObject:self.sUPPLYNO forKey:kSupplyListModelSUPPLYNO];
    }
    if(self.sUPPLYSTATE != nil){
        [aCoder encodeObject:self.sUPPLYSTATE forKey:kSupplyListModelSUPPLYSTATE];
    }
    if(self.sUPPLYVEHICLESIZE != nil){
        [aCoder encodeObject:self.sUPPLYVEHICLESIZE forKey:kSupplyListModelSUPPLYVEHICLESIZE];
    }
    if(self.sUPPLYVEHICLETYPE != nil){
        [aCoder encodeObject:self.sUPPLYVEHICLETYPE forKey:kSupplyListModelSUPPLYVEHICLETYPE];
    }
    if(self.sUPPLYWOKERFLOW != nil){
        [aCoder encodeObject:self.sUPPLYWOKERFLOW forKey:kSupplyListModelSUPPLYWOKERFLOW];
    }
    if(self.tOTALAMOUNT != nil){
        [aCoder encodeObject:self.tOTALAMOUNT forKey:kSupplyListModelTOTALAMOUNT];
    }
    if(self.tOTALQTY != nil){
        [aCoder encodeObject:self.tOTALQTY forKey:kSupplyListModelTOTALQTY];
    }
    if(self.tOTALVOLUME != nil){
        [aCoder encodeObject:self.tOTALVOLUME forKey:kSupplyListModelTOTALVOLUME];
    }
    if(self.tOTALWEIGHT != nil){
        [aCoder encodeObject:self.tOTALWEIGHT forKey:kSupplyListModelTOTALWEIGHT];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDDATE = [aDecoder decodeObjectForKey:kSupplyListModelADDDATE];
    self.iDX = [aDecoder decodeObjectForKey:kSupplyListModelIDX];
    self.oRGNAME = [aDecoder decodeObjectForKey:kSupplyListModelORGNAME];
    self.rOUTESCITY = [aDecoder decodeObjectForKey:kSupplyListModelROUTESCITY];
    self.sUPPLYNO = [aDecoder decodeObjectForKey:kSupplyListModelSUPPLYNO];
    self.sUPPLYSTATE = [aDecoder decodeObjectForKey:kSupplyListModelSUPPLYSTATE];
    self.sUPPLYVEHICLESIZE = [aDecoder decodeObjectForKey:kSupplyListModelSUPPLYVEHICLESIZE];
    self.sUPPLYVEHICLETYPE = [aDecoder decodeObjectForKey:kSupplyListModelSUPPLYVEHICLETYPE];
    self.sUPPLYWOKERFLOW = [aDecoder decodeObjectForKey:kSupplyListModelSUPPLYWOKERFLOW];
    self.tOTALAMOUNT = [aDecoder decodeObjectForKey:kSupplyListModelTOTALAMOUNT];
    self.tOTALQTY = [aDecoder decodeObjectForKey:kSupplyListModelTOTALQTY];
    self.tOTALVOLUME = [aDecoder decodeObjectForKey:kSupplyListModelTOTALVOLUME];
    self.tOTALWEIGHT = [aDecoder decodeObjectForKey:kSupplyListModelTOTALWEIGHT];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    SupplyListModel *copy = [SupplyListModel new];
    
    copy.aDDDATE = [self.aDDDATE copy];
    copy.iDX = [self.iDX copy];
    copy.oRGNAME = [self.oRGNAME copy];
    copy.rOUTESCITY = [self.rOUTESCITY copy];
    copy.sUPPLYNO = [self.sUPPLYNO copy];
    copy.sUPPLYSTATE = [self.sUPPLYSTATE copy];
    copy.sUPPLYVEHICLESIZE = [self.sUPPLYVEHICLESIZE copy];
    copy.sUPPLYVEHICLETYPE = [self.sUPPLYVEHICLETYPE copy];
    copy.sUPPLYWOKERFLOW = [self.sUPPLYWOKERFLOW copy];
    copy.tOTALAMOUNT = [self.tOTALAMOUNT copy];
    copy.tOTALQTY = [self.tOTALQTY copy];
    copy.tOTALVOLUME = [self.tOTALVOLUME copy];
    copy.tOTALWEIGHT = [self.tOTALWEIGHT copy];
    
    return copy;
}

@end
