//
//  OrderModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/7.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "OrderModel.h"

NSString *const kOrderModelIDX = @"IDX";
NSString *const kOrderModelORDFROMADDRESS = @"ORD_FROM_ADDRESS";
NSString *const kOrderModelORDFROMCNAME = @"ORD_FROM_CNAME";
NSString *const kOrderModelORDFROMCTEL = @"ORD_FROM_CTEL";
NSString *const kOrderModelORDFROMNAME = @"ORD_FROM_NAME";
NSString *const kOrderModelORDISSUEQTY = @"ORD_ISSUE_QTY";
NSString *const kOrderModelORDISSUEVOLUME = @"ORD_ISSUE_VOLUME";
NSString *const kOrderModelORDISSUEWEIGHT = @"ORD_ISSUE_WEIGHT";
NSString *const kOrderModelORDNO = @"ORD_NO";
NSString *const kOrderModelORDNOCLIENT = @"ORD_NO_CLIENT";
NSString *const kOrderModelORDTOADDRESS = @"ORD_TO_ADDRESS";
NSString *const kOrderModelORDTOCNAME = @"ORD_TO_CNAME";
NSString *const kOrderModelORDTOCTEL = @"ORD_TO_CTEL";
NSString *const kOrderModelORDTONAME = @"ORD_TO_NAME";
NSString *const kOrderModelTMSORDNO = @"TMS_ORD_NO";
NSString *const kOrderModelUPDATE03 = @"UPDATE03";

@interface OrderModel ()
@end
@implementation OrderModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kOrderModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kOrderModelIDX];
    }
    if(![dictionary[kOrderModelORDFROMADDRESS] isKindOfClass:[NSNull class]]){
        self.oRDFROMADDRESS = dictionary[kOrderModelORDFROMADDRESS];
    }
    if(![dictionary[kOrderModelORDFROMCNAME] isKindOfClass:[NSNull class]]){
        self.oRDFROMCNAME = dictionary[kOrderModelORDFROMCNAME];
    }
    if(![dictionary[kOrderModelORDFROMCTEL] isKindOfClass:[NSNull class]]){
        self.oRDFROMCTEL = dictionary[kOrderModelORDFROMCTEL];
    }
    if(![dictionary[kOrderModelORDFROMNAME] isKindOfClass:[NSNull class]]){
        self.oRDFROMNAME = dictionary[kOrderModelORDFROMNAME];
    }
    if(![dictionary[kOrderModelORDISSUEQTY] isKindOfClass:[NSNull class]]){
        self.oRDISSUEQTY = dictionary[kOrderModelORDISSUEQTY];
    }
    if(![dictionary[kOrderModelORDISSUEVOLUME] isKindOfClass:[NSNull class]]){
        self.oRDISSUEVOLUME = dictionary[kOrderModelORDISSUEVOLUME];
    }
    if(![dictionary[kOrderModelORDISSUEWEIGHT] isKindOfClass:[NSNull class]]){
        self.oRDISSUEWEIGHT = dictionary[kOrderModelORDISSUEWEIGHT];
    }
    if(![dictionary[kOrderModelORDNO] isKindOfClass:[NSNull class]]){
        self.oRDNO = dictionary[kOrderModelORDNO];
    }
    if(![dictionary[kOrderModelORDNOCLIENT] isKindOfClass:[NSNull class]]){
        self.oRDNOCLIENT = dictionary[kOrderModelORDNOCLIENT];
    }
    if(![dictionary[kOrderModelORDTOADDRESS] isKindOfClass:[NSNull class]]){
        self.oRDTOADDRESS = dictionary[kOrderModelORDTOADDRESS];
    }
    if(![dictionary[kOrderModelORDTOCNAME] isKindOfClass:[NSNull class]]){
        self.oRDTOCNAME = dictionary[kOrderModelORDTOCNAME];
    }
    if(![dictionary[kOrderModelORDTOCTEL] isKindOfClass:[NSNull class]]){
        self.oRDTOCTEL = dictionary[kOrderModelORDTOCTEL];
    }
    if(![dictionary[kOrderModelORDTONAME] isKindOfClass:[NSNull class]]){
        self.oRDTONAME = dictionary[kOrderModelORDTONAME];
    }
    if(![dictionary[kOrderModelTMSORDNO] isKindOfClass:[NSNull class]]){
        self.tMSORDNO = dictionary[kOrderModelTMSORDNO];
    }
    if(![dictionary[kOrderModelUPDATE03] isKindOfClass:[NSNull class]]){
        self.uPDATE03 = dictionary[kOrderModelUPDATE03];
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
        dictionary[kOrderModelIDX] = self.iDX;
    }
    if(self.oRDFROMADDRESS != nil){
        dictionary[kOrderModelORDFROMADDRESS] = self.oRDFROMADDRESS;
    }
    if(self.oRDFROMCNAME != nil){
        dictionary[kOrderModelORDFROMCNAME] = self.oRDFROMCNAME;
    }
    if(self.oRDFROMCTEL != nil){
        dictionary[kOrderModelORDFROMCTEL] = self.oRDFROMCTEL;
    }
    if(self.oRDFROMNAME != nil){
        dictionary[kOrderModelORDFROMNAME] = self.oRDFROMNAME;
    }
    if(self.oRDISSUEQTY != nil){
        dictionary[kOrderModelORDISSUEQTY] = self.oRDISSUEQTY;
    }
    if(self.oRDISSUEVOLUME != nil){
        dictionary[kOrderModelORDISSUEVOLUME] = self.oRDISSUEVOLUME;
    }
    if(self.oRDISSUEWEIGHT != nil){
        dictionary[kOrderModelORDISSUEWEIGHT] = self.oRDISSUEWEIGHT;
    }
    if(self.oRDNO != nil){
        dictionary[kOrderModelORDNO] = self.oRDNO;
    }
    if(self.oRDNOCLIENT != nil){
        dictionary[kOrderModelORDNOCLIENT] = self.oRDNOCLIENT;
    }
    if(self.oRDTOADDRESS != nil){
        dictionary[kOrderModelORDTOADDRESS] = self.oRDTOADDRESS;
    }
    if(self.oRDTOCNAME != nil){
        dictionary[kOrderModelORDTOCNAME] = self.oRDTOCNAME;
    }
    if(self.oRDTOCTEL != nil){
        dictionary[kOrderModelORDTOCTEL] = self.oRDTOCTEL;
    }
    if(self.oRDTONAME != nil){
        dictionary[kOrderModelORDTONAME] = self.oRDTONAME;
    }
    if(self.tMSORDNO != nil){
        dictionary[kOrderModelTMSORDNO] = self.tMSORDNO;
    }
    if(self.uPDATE03 != nil){
        dictionary[kOrderModelUPDATE03] = self.uPDATE03;
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
        [aCoder encodeObject:self.iDX forKey:kOrderModelIDX];
    }
    if(self.oRDFROMADDRESS != nil){
        [aCoder encodeObject:self.oRDFROMADDRESS forKey:kOrderModelORDFROMADDRESS];
    }
    if(self.oRDFROMCNAME != nil){
        [aCoder encodeObject:self.oRDFROMCNAME forKey:kOrderModelORDFROMCNAME];
    }
    if(self.oRDFROMCTEL != nil){
        [aCoder encodeObject:self.oRDFROMCTEL forKey:kOrderModelORDFROMCTEL];
    }
    if(self.oRDFROMNAME != nil){
        [aCoder encodeObject:self.oRDFROMNAME forKey:kOrderModelORDFROMNAME];
    }
    if(self.oRDISSUEQTY != nil){
        [aCoder encodeObject:self.oRDISSUEQTY forKey:kOrderModelORDISSUEQTY];
    }
    if(self.oRDISSUEVOLUME != nil){
        [aCoder encodeObject:self.oRDISSUEVOLUME forKey:kOrderModelORDISSUEVOLUME];
    }
    if(self.oRDISSUEWEIGHT != nil){
        [aCoder encodeObject:self.oRDISSUEWEIGHT forKey:kOrderModelORDISSUEWEIGHT];
    }
    if(self.oRDNO != nil){
        [aCoder encodeObject:self.oRDNO forKey:kOrderModelORDNO];
    }
    if(self.oRDNOCLIENT != nil){
        [aCoder encodeObject:self.oRDNOCLIENT forKey:kOrderModelORDNOCLIENT];
    }
    if(self.oRDTOADDRESS != nil){
        [aCoder encodeObject:self.oRDTOADDRESS forKey:kOrderModelORDTOADDRESS];
    }
    if(self.oRDTOCNAME != nil){
        [aCoder encodeObject:self.oRDTOCNAME forKey:kOrderModelORDTOCNAME];
    }
    if(self.oRDTOCTEL != nil){
        [aCoder encodeObject:self.oRDTOCTEL forKey:kOrderModelORDTOCTEL];
    }
    if(self.oRDTONAME != nil){
        [aCoder encodeObject:self.oRDTONAME forKey:kOrderModelORDTONAME];
    }
    if(self.tMSORDNO != nil){
        [aCoder encodeObject:self.tMSORDNO forKey:kOrderModelTMSORDNO];
    }
    if(self.uPDATE03 != nil){
        [aCoder encodeObject:self.uPDATE03 forKey:kOrderModelUPDATE03];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.iDX = [aDecoder decodeObjectForKey:kOrderModelIDX];
    self.oRDFROMADDRESS = [aDecoder decodeObjectForKey:kOrderModelORDFROMADDRESS];
    self.oRDFROMCNAME = [aDecoder decodeObjectForKey:kOrderModelORDFROMCNAME];
    self.oRDFROMCTEL = [aDecoder decodeObjectForKey:kOrderModelORDFROMCTEL];
    self.oRDFROMNAME = [aDecoder decodeObjectForKey:kOrderModelORDFROMNAME];
    self.oRDISSUEQTY = [aDecoder decodeObjectForKey:kOrderModelORDISSUEQTY];
    self.oRDISSUEVOLUME = [aDecoder decodeObjectForKey:kOrderModelORDISSUEVOLUME];
    self.oRDISSUEWEIGHT = [aDecoder decodeObjectForKey:kOrderModelORDISSUEWEIGHT];
    self.oRDNO = [aDecoder decodeObjectForKey:kOrderModelORDNO];
    self.oRDNOCLIENT = [aDecoder decodeObjectForKey:kOrderModelORDNOCLIENT];
    self.oRDTOADDRESS = [aDecoder decodeObjectForKey:kOrderModelORDTOADDRESS];
    self.oRDTOCNAME = [aDecoder decodeObjectForKey:kOrderModelORDTOCNAME];
    self.oRDTOCTEL = [aDecoder decodeObjectForKey:kOrderModelORDTOCTEL];
    self.oRDTONAME = [aDecoder decodeObjectForKey:kOrderModelORDTONAME];
    self.tMSORDNO = [aDecoder decodeObjectForKey:kOrderModelTMSORDNO];
    self.uPDATE03 = [aDecoder decodeObjectForKey:kOrderModelUPDATE03];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    OrderModel *copy = [OrderModel new];
    
    copy.iDX = [self.iDX copy];
    copy.oRDFROMADDRESS = [self.oRDFROMADDRESS copy];
    copy.oRDFROMCNAME = [self.oRDFROMCNAME copy];
    copy.oRDFROMCTEL = [self.oRDFROMCTEL copy];
    copy.oRDFROMNAME = [self.oRDFROMNAME copy];
    copy.oRDISSUEQTY = [self.oRDISSUEQTY copy];
    copy.oRDISSUEVOLUME = [self.oRDISSUEVOLUME copy];
    copy.oRDISSUEWEIGHT = [self.oRDISSUEWEIGHT copy];
    copy.oRDNO = [self.oRDNO copy];
    copy.oRDNOCLIENT = [self.oRDNOCLIENT copy];
    copy.oRDTOADDRESS = [self.oRDTOADDRESS copy];
    copy.oRDTOCNAME = [self.oRDTOCNAME copy];
    copy.oRDTOCTEL = [self.oRDTOCTEL copy];
    copy.oRDTONAME = [self.oRDTONAME copy];
    copy.tMSORDNO = [self.tMSORDNO copy];
    copy.uPDATE03 = [self.uPDATE03 copy];
    
    return copy;
}
@end
