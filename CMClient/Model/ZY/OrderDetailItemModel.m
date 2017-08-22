//
//  OrderDetailItemModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "OrderDetailItemModel.h"

NSString *const kOrderDetailItemModelENTIDX = @"ENT_IDX";
NSString *const kOrderDetailItemModelIDX = @"IDX";
NSString *const kOrderDetailItemModelISSUEQTY = @"ISSUE_QTY";
NSString *const kOrderDetailItemModelISSUEUOM = @"ISSUE_UOM";
NSString *const kOrderDetailItemModelISSUEVOLUME = @"ISSUE_VOLUME";
NSString *const kOrderDetailItemModelISSUEWEIGHT = @"ISSUE_WEIGHT";
NSString *const kOrderDetailItemModelORDERIDX = @"ORDER_IDX";
NSString *const kOrderDetailItemModelPRODUCTDESC = @"PRODUCT_DESC";
NSString *const kOrderDetailItemModelPRODUCTNAME = @"PRODUCT_NAME";
NSString *const kOrderDetailItemModelPRODUCTNO = @"PRODUCT_NO";
NSString *const kOrderDetailItemModelREMARKSUPPLIER = @"REMARK_SUPPLIER";

@implementation OrderDetailItemModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kOrderDetailItemModelENTIDX] isKindOfClass:[NSNull class]]){
        self.eNTIDX = dictionary[kOrderDetailItemModelENTIDX];
    }
    if(![dictionary[kOrderDetailItemModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kOrderDetailItemModelIDX];
    }
    if(![dictionary[kOrderDetailItemModelISSUEQTY] isKindOfClass:[NSNull class]]){
        self.iSSUEQTY = dictionary[kOrderDetailItemModelISSUEQTY];
    }
    if(![dictionary[kOrderDetailItemModelISSUEUOM] isKindOfClass:[NSNull class]]){
        self.iSSUEUOM = dictionary[kOrderDetailItemModelISSUEUOM];
    }
    if(![dictionary[kOrderDetailItemModelISSUEVOLUME] isKindOfClass:[NSNull class]]){
        self.iSSUEVOLUME = dictionary[kOrderDetailItemModelISSUEVOLUME];
    }
    if(![dictionary[kOrderDetailItemModelISSUEWEIGHT] isKindOfClass:[NSNull class]]){
        self.iSSUEWEIGHT = dictionary[kOrderDetailItemModelISSUEWEIGHT];
    }
    if(![dictionary[kOrderDetailItemModelORDERIDX] isKindOfClass:[NSNull class]]){
        self.oRDERIDX = dictionary[kOrderDetailItemModelORDERIDX];
    }
    if(![dictionary[kOrderDetailItemModelPRODUCTDESC] isKindOfClass:[NSNull class]]){
        self.pRODUCTDESC = dictionary[kOrderDetailItemModelPRODUCTDESC];
    }
    if(![dictionary[kOrderDetailItemModelPRODUCTNAME] isKindOfClass:[NSNull class]]){
        self.pRODUCTNAME = dictionary[kOrderDetailItemModelPRODUCTNAME];
    }
    if(![dictionary[kOrderDetailItemModelPRODUCTNO] isKindOfClass:[NSNull class]]){
        self.pRODUCTNO = dictionary[kOrderDetailItemModelPRODUCTNO];
    }
    if(![dictionary[kOrderDetailItemModelREMARKSUPPLIER] isKindOfClass:[NSNull class]]){
        self.rEMARKSUPPLIER = dictionary[kOrderDetailItemModelREMARKSUPPLIER];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.eNTIDX != nil){
        dictionary[kOrderDetailItemModelENTIDX] = self.eNTIDX;
    }
    if(self.iDX != nil){
        dictionary[kOrderDetailItemModelIDX] = self.iDX;
    }
    if(self.iSSUEQTY != nil){
        dictionary[kOrderDetailItemModelISSUEQTY] = self.iSSUEQTY;
    }
    if(self.iSSUEUOM != nil){
        dictionary[kOrderDetailItemModelISSUEUOM] = self.iSSUEUOM;
    }
    if(self.iSSUEVOLUME != nil){
        dictionary[kOrderDetailItemModelISSUEVOLUME] = self.iSSUEVOLUME;
    }
    if(self.iSSUEWEIGHT != nil){
        dictionary[kOrderDetailItemModelISSUEWEIGHT] = self.iSSUEWEIGHT;
    }
    if(self.oRDERIDX != nil){
        dictionary[kOrderDetailItemModelORDERIDX] = self.oRDERIDX;
    }
    if(self.pRODUCTDESC != nil){
        dictionary[kOrderDetailItemModelPRODUCTDESC] = self.pRODUCTDESC;
    }
    if(self.pRODUCTNAME != nil){
        dictionary[kOrderDetailItemModelPRODUCTNAME] = self.pRODUCTNAME;
    }
    if(self.pRODUCTNO != nil){
        dictionary[kOrderDetailItemModelPRODUCTNO] = self.pRODUCTNO;
    }
    if(self.rEMARKSUPPLIER != nil){
        dictionary[kOrderDetailItemModelREMARKSUPPLIER] = self.rEMARKSUPPLIER;
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
    if(self.eNTIDX != nil){
        [aCoder encodeObject:self.eNTIDX forKey:kOrderDetailItemModelENTIDX];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kOrderDetailItemModelIDX];
    }
    if(self.iSSUEQTY != nil){
        [aCoder encodeObject:self.iSSUEQTY forKey:kOrderDetailItemModelISSUEQTY];
    }
    if(self.iSSUEUOM != nil){
        [aCoder encodeObject:self.iSSUEUOM forKey:kOrderDetailItemModelISSUEUOM];
    }
    if(self.iSSUEVOLUME != nil){
        [aCoder encodeObject:self.iSSUEVOLUME forKey:kOrderDetailItemModelISSUEVOLUME];
    }
    if(self.iSSUEWEIGHT != nil){
        [aCoder encodeObject:self.iSSUEWEIGHT forKey:kOrderDetailItemModelISSUEWEIGHT];
    }
    if(self.oRDERIDX != nil){
        [aCoder encodeObject:self.oRDERIDX forKey:kOrderDetailItemModelORDERIDX];
    }
    if(self.pRODUCTDESC != nil){
        [aCoder encodeObject:self.pRODUCTDESC forKey:kOrderDetailItemModelPRODUCTDESC];
    }
    if(self.pRODUCTNAME != nil){
        [aCoder encodeObject:self.pRODUCTNAME forKey:kOrderDetailItemModelPRODUCTNAME];
    }
    if(self.pRODUCTNO != nil){
        [aCoder encodeObject:self.pRODUCTNO forKey:kOrderDetailItemModelPRODUCTNO];
    }
    if(self.rEMARKSUPPLIER != nil){
        [aCoder encodeObject:self.rEMARKSUPPLIER forKey:kOrderDetailItemModelREMARKSUPPLIER];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.eNTIDX = [aDecoder decodeObjectForKey:kOrderDetailItemModelENTIDX];
    self.iDX = [aDecoder decodeObjectForKey:kOrderDetailItemModelIDX];
    self.iSSUEQTY = [aDecoder decodeObjectForKey:kOrderDetailItemModelISSUEQTY];
    self.iSSUEUOM = [aDecoder decodeObjectForKey:kOrderDetailItemModelISSUEUOM];
    self.iSSUEVOLUME = [aDecoder decodeObjectForKey:kOrderDetailItemModelISSUEVOLUME];
    self.iSSUEWEIGHT = [aDecoder decodeObjectForKey:kOrderDetailItemModelISSUEWEIGHT];
    self.oRDERIDX = [aDecoder decodeObjectForKey:kOrderDetailItemModelORDERIDX];
    self.pRODUCTDESC = [aDecoder decodeObjectForKey:kOrderDetailItemModelPRODUCTDESC];
    self.pRODUCTNAME = [aDecoder decodeObjectForKey:kOrderDetailItemModelPRODUCTNAME];
    self.pRODUCTNO = [aDecoder decodeObjectForKey:kOrderDetailItemModelPRODUCTNO];
    self.rEMARKSUPPLIER = [aDecoder decodeObjectForKey:kOrderDetailItemModelREMARKSUPPLIER];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    OrderDetailItemModel *copy = [OrderDetailItemModel new];
    
    copy.eNTIDX = [self.eNTIDX copy];
    copy.iDX = [self.iDX copy];
    copy.iSSUEQTY = [self.iSSUEQTY copy];
    copy.iSSUEUOM = [self.iSSUEUOM copy];
    copy.iSSUEVOLUME = [self.iSSUEVOLUME copy];
    copy.iSSUEWEIGHT = [self.iSSUEWEIGHT copy];
    copy.oRDERIDX = [self.oRDERIDX copy];
    copy.pRODUCTDESC = [self.pRODUCTDESC copy];
    copy.pRODUCTNAME = [self.pRODUCTNAME copy];
    copy.pRODUCTNO = [self.pRODUCTNO copy];
    copy.rEMARKSUPPLIER = [self.rEMARKSUPPLIER copy];
    
    return copy;
}

@end
