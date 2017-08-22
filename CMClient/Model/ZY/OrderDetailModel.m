//
//  OrderDetailModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "OrderDetailModel.h"

NSString *const kOrderDetailModelIDX = @"IDX";
NSString *const kOrderDetailModelOMSREMARKAUDIT = @"OMS_REMARK_AUDIT";
NSString *const kOrderDetailModelORDDATEADD = @"ORD_DATE_ADD";
NSString *const kOrderDetailModelORDDATEEDIT = @"ORD_DATE_EDIT";
NSString *const kOrderDetailModelORDFROMADDRESS = @"ORD_FROM_ADDRESS";
NSString *const kOrderDetailModelORDFROMCNAME = @"ORD_FROM_CNAME";
NSString *const kOrderDetailModelORDFROMCTEL = @"ORD_FROM_CTEL";
NSString *const kOrderDetailModelORDFROMNAME = @"ORD_FROM_NAME";
NSString *const kOrderDetailModelORDISSUEQTY = @"ORD_ISSUE_QTY";
NSString *const kOrderDetailModelORDISSUEVOLUME = @"ORD_ISSUE_VOLUME";
NSString *const kOrderDetailModelORDISSUEWEIGHT = @"ORD_ISSUE_WEIGHT";
NSString *const kOrderDetailModelORDNO = @"ORD_NO";
NSString *const kOrderDetailModelORDNOCLIENT = @"ORD_NO_CLIENT";
NSString *const kOrderDetailModelORDNOCONSIGNEE = @"ORD_NO_CONSIGNEE";
NSString *const kOrderDetailModelORDPROJECTEDDELIVERY = @"ORD_PROJECTED_DELIVERY";
NSString *const kOrderDetailModelORDREMARKCLIENT = @"ORD_REMARK_CLIENT";
NSString *const kOrderDetailModelORDREMARKCONSIGNEE = @"ORD_REMARK_CONSIGNEE";
NSString *const kOrderDetailModelORDREQUESTDELIVERY = @"ORD_REQUEST_DELIVERY";
NSString *const kOrderDetailModelORDREQUESTISSUE = @"ORD_REQUEST_ISSUE";
NSString *const kOrderDetailModelORDTOADDRESS = @"ORD_TO_ADDRESS";
NSString *const kOrderDetailModelORDTOCNAME = @"ORD_TO_CNAME";
NSString *const kOrderDetailModelORDTOCTEL = @"ORD_TO_CTEL";
NSString *const kOrderDetailModelORDTONAME = @"ORD_TO_NAME";
NSString *const kOrderDetailModelORDTYPECLIENT = @"ORD_TYPE_CLIENT";
NSString *const kOrderDetailModelORDVEHICLESIZE = @"ORD_VEHICLE_SIZE";
NSString *const kOrderDetailModelORDVEHICLETYPE = @"ORD_VEHICLE_TYPE";
NSString *const kOrderDetailModelOTSDELIVERYACTUAL = @"OTS_DELIVERY_ACTUAL";
NSString *const kOrderDetailModelOTSDELIVERYNOTICE = @"OTS_DELIVERY_NOTICE";
NSString *const kOrderDetailModelOTSREMARKDELIVERY = @"OTS_REMARK_DELIVERY";
NSString *const kOrderDetailModelOTSREMARKRETURN = @"OTS_REMARK_RETURN";
NSString *const kOrderDetailModelOTSRETURNDATE = @"OTS_RETURN_DATE";
NSString *const kOrderDetailModelTMSORDNO = @"TMS_ORD_NO";
NSString *const kOrderDetailModelUPDATE03 = @"UPDATE03";

@implementation OrderDetailModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kOrderDetailModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kOrderDetailModelIDX];
    }
    if(![dictionary[kOrderDetailModelOMSREMARKAUDIT] isKindOfClass:[NSNull class]]){
        self.oMSREMARKAUDIT = dictionary[kOrderDetailModelOMSREMARKAUDIT];
    }
    if(![dictionary[kOrderDetailModelORDDATEADD] isKindOfClass:[NSNull class]]){
        self.oRDDATEADD = dictionary[kOrderDetailModelORDDATEADD];
    }
    if(![dictionary[kOrderDetailModelORDDATEEDIT] isKindOfClass:[NSNull class]]){
        self.oRDDATEEDIT = dictionary[kOrderDetailModelORDDATEEDIT];
    }
    if(![dictionary[kOrderDetailModelORDFROMADDRESS] isKindOfClass:[NSNull class]]){
        self.oRDFROMADDRESS = dictionary[kOrderDetailModelORDFROMADDRESS];
    }
    if(![dictionary[kOrderDetailModelORDFROMCNAME] isKindOfClass:[NSNull class]]){
        self.oRDFROMCNAME = dictionary[kOrderDetailModelORDFROMCNAME];
    }
    if(![dictionary[kOrderDetailModelORDFROMCTEL] isKindOfClass:[NSNull class]]){
        self.oRDFROMCTEL = dictionary[kOrderDetailModelORDFROMCTEL];
    }
    if(![dictionary[kOrderDetailModelORDFROMNAME] isKindOfClass:[NSNull class]]){
        self.oRDFROMNAME = dictionary[kOrderDetailModelORDFROMNAME];
    }
    if(![dictionary[kOrderDetailModelORDISSUEQTY] isKindOfClass:[NSNull class]]){
        self.oRDISSUEQTY = dictionary[kOrderDetailModelORDISSUEQTY];
    }
    if(![dictionary[kOrderDetailModelORDISSUEVOLUME] isKindOfClass:[NSNull class]]){
        self.oRDISSUEVOLUME = dictionary[kOrderDetailModelORDISSUEVOLUME];
    }
    if(![dictionary[kOrderDetailModelORDISSUEWEIGHT] isKindOfClass:[NSNull class]]){
        self.oRDISSUEWEIGHT = dictionary[kOrderDetailModelORDISSUEWEIGHT];
    }
    if(![dictionary[kOrderDetailModelORDNO] isKindOfClass:[NSNull class]]){
        self.oRDNO = dictionary[kOrderDetailModelORDNO];
    }
    if(![dictionary[kOrderDetailModelORDNOCLIENT] isKindOfClass:[NSNull class]]){
        self.oRDNOCLIENT = dictionary[kOrderDetailModelORDNOCLIENT];
    }
    if(![dictionary[kOrderDetailModelORDNOCONSIGNEE] isKindOfClass:[NSNull class]]){
        self.oRDNOCONSIGNEE = dictionary[kOrderDetailModelORDNOCONSIGNEE];
    }
    if(![dictionary[kOrderDetailModelORDPROJECTEDDELIVERY] isKindOfClass:[NSNull class]]){
        self.oRDPROJECTEDDELIVERY = dictionary[kOrderDetailModelORDPROJECTEDDELIVERY];
    }
    if(![dictionary[kOrderDetailModelORDREMARKCLIENT] isKindOfClass:[NSNull class]]){
        self.oRDREMARKCLIENT = dictionary[kOrderDetailModelORDREMARKCLIENT];
    }
    if(![dictionary[kOrderDetailModelORDREMARKCONSIGNEE] isKindOfClass:[NSNull class]]){
        self.oRDREMARKCONSIGNEE = dictionary[kOrderDetailModelORDREMARKCONSIGNEE];
    }
    if(![dictionary[kOrderDetailModelORDREQUESTDELIVERY] isKindOfClass:[NSNull class]]){
        self.oRDREQUESTDELIVERY = dictionary[kOrderDetailModelORDREQUESTDELIVERY];
    }
    if(![dictionary[kOrderDetailModelORDREQUESTISSUE] isKindOfClass:[NSNull class]]){
        self.oRDREQUESTISSUE = dictionary[kOrderDetailModelORDREQUESTISSUE];
    }
    if(![dictionary[kOrderDetailModelORDTOADDRESS] isKindOfClass:[NSNull class]]){
        self.oRDTOADDRESS = dictionary[kOrderDetailModelORDTOADDRESS];
    }
    if(![dictionary[kOrderDetailModelORDTOCNAME] isKindOfClass:[NSNull class]]){
        self.oRDTOCNAME = dictionary[kOrderDetailModelORDTOCNAME];
    }
    if(![dictionary[kOrderDetailModelORDTOCTEL] isKindOfClass:[NSNull class]]){
        self.oRDTOCTEL = dictionary[kOrderDetailModelORDTOCTEL];
    }
    if(![dictionary[kOrderDetailModelORDTONAME] isKindOfClass:[NSNull class]]){
        self.oRDTONAME = dictionary[kOrderDetailModelORDTONAME];
    }
    if(![dictionary[kOrderDetailModelORDTYPECLIENT] isKindOfClass:[NSNull class]]){
        self.oRDTYPECLIENT = dictionary[kOrderDetailModelORDTYPECLIENT];
    }
    if(![dictionary[kOrderDetailModelORDVEHICLESIZE] isKindOfClass:[NSNull class]]){
        self.oRDVEHICLESIZE = dictionary[kOrderDetailModelORDVEHICLESIZE];
    }
    if(![dictionary[kOrderDetailModelORDVEHICLETYPE] isKindOfClass:[NSNull class]]){
        self.oRDVEHICLETYPE = dictionary[kOrderDetailModelORDVEHICLETYPE];
    }
    if(![dictionary[kOrderDetailModelOTSDELIVERYACTUAL] isKindOfClass:[NSNull class]]){
        self.oTSDELIVERYACTUAL = dictionary[kOrderDetailModelOTSDELIVERYACTUAL];
    }
    if(![dictionary[kOrderDetailModelOTSDELIVERYNOTICE] isKindOfClass:[NSNull class]]){
        self.oTSDELIVERYNOTICE = dictionary[kOrderDetailModelOTSDELIVERYNOTICE];
    }
    if(![dictionary[kOrderDetailModelOTSREMARKDELIVERY] isKindOfClass:[NSNull class]]){
        self.oTSREMARKDELIVERY = dictionary[kOrderDetailModelOTSREMARKDELIVERY];
    }
    if(![dictionary[kOrderDetailModelOTSREMARKRETURN] isKindOfClass:[NSNull class]]){
        self.oTSREMARKRETURN = dictionary[kOrderDetailModelOTSREMARKRETURN];
    }
    if(![dictionary[kOrderDetailModelOTSRETURNDATE] isKindOfClass:[NSNull class]]){
        self.oTSRETURNDATE = dictionary[kOrderDetailModelOTSRETURNDATE];
    }
    if(![dictionary[kOrderDetailModelTMSORDNO] isKindOfClass:[NSNull class]]){
        self.tMSORDNO = dictionary[kOrderDetailModelTMSORDNO];
    }
    if(![dictionary[kOrderDetailModelUPDATE03] isKindOfClass:[NSNull class]]){
        self.uPDATE03 = dictionary[kOrderDetailModelUPDATE03];
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
        dictionary[kOrderDetailModelIDX] = self.iDX;
    }
    if(self.oMSREMARKAUDIT != nil){
        dictionary[kOrderDetailModelOMSREMARKAUDIT] = self.oMSREMARKAUDIT;
    }
    if(self.oRDDATEADD != nil){
        dictionary[kOrderDetailModelORDDATEADD] = self.oRDDATEADD;
    }
    if(self.oRDDATEEDIT != nil){
        dictionary[kOrderDetailModelORDDATEEDIT] = self.oRDDATEEDIT;
    }
    if(self.oRDFROMADDRESS != nil){
        dictionary[kOrderDetailModelORDFROMADDRESS] = self.oRDFROMADDRESS;
    }
    if(self.oRDFROMCNAME != nil){
        dictionary[kOrderDetailModelORDFROMCNAME] = self.oRDFROMCNAME;
    }
    if(self.oRDFROMCTEL != nil){
        dictionary[kOrderDetailModelORDFROMCTEL] = self.oRDFROMCTEL;
    }
    if(self.oRDFROMNAME != nil){
        dictionary[kOrderDetailModelORDFROMNAME] = self.oRDFROMNAME;
    }
    if(self.oRDISSUEQTY != nil){
        dictionary[kOrderDetailModelORDISSUEQTY] = self.oRDISSUEQTY;
    }
    if(self.oRDISSUEVOLUME != nil){
        dictionary[kOrderDetailModelORDISSUEVOLUME] = self.oRDISSUEVOLUME;
    }
    if(self.oRDISSUEWEIGHT != nil){
        dictionary[kOrderDetailModelORDISSUEWEIGHT] = self.oRDISSUEWEIGHT;
    }
    if(self.oRDNO != nil){
        dictionary[kOrderDetailModelORDNO] = self.oRDNO;
    }
    if(self.oRDNOCLIENT != nil){
        dictionary[kOrderDetailModelORDNOCLIENT] = self.oRDNOCLIENT;
    }
    if(self.oRDNOCONSIGNEE != nil){
        dictionary[kOrderDetailModelORDNOCONSIGNEE] = self.oRDNOCONSIGNEE;
    }
    if(self.oRDPROJECTEDDELIVERY != nil){
        dictionary[kOrderDetailModelORDPROJECTEDDELIVERY] = self.oRDPROJECTEDDELIVERY;
    }
    if(self.oRDREMARKCLIENT != nil){
        dictionary[kOrderDetailModelORDREMARKCLIENT] = self.oRDREMARKCLIENT;
    }
    if(self.oRDREMARKCONSIGNEE != nil){
        dictionary[kOrderDetailModelORDREMARKCONSIGNEE] = self.oRDREMARKCONSIGNEE;
    }
    if(self.oRDREQUESTDELIVERY != nil){
        dictionary[kOrderDetailModelORDREQUESTDELIVERY] = self.oRDREQUESTDELIVERY;
    }
    if(self.oRDREQUESTISSUE != nil){
        dictionary[kOrderDetailModelORDREQUESTISSUE] = self.oRDREQUESTISSUE;
    }
    if(self.oRDTOADDRESS != nil){
        dictionary[kOrderDetailModelORDTOADDRESS] = self.oRDTOADDRESS;
    }
    if(self.oRDTOCNAME != nil){
        dictionary[kOrderDetailModelORDTOCNAME] = self.oRDTOCNAME;
    }
    if(self.oRDTOCTEL != nil){
        dictionary[kOrderDetailModelORDTOCTEL] = self.oRDTOCTEL;
    }
    if(self.oRDTONAME != nil){
        dictionary[kOrderDetailModelORDTONAME] = self.oRDTONAME;
    }
    if(self.oRDTYPECLIENT != nil){
        dictionary[kOrderDetailModelORDTYPECLIENT] = self.oRDTYPECLIENT;
    }
    if(self.oRDVEHICLESIZE != nil){
        dictionary[kOrderDetailModelORDVEHICLESIZE] = self.oRDVEHICLESIZE;
    }
    if(self.oRDVEHICLETYPE != nil){
        dictionary[kOrderDetailModelORDVEHICLETYPE] = self.oRDVEHICLETYPE;
    }
    if(self.oTSDELIVERYACTUAL != nil){
        dictionary[kOrderDetailModelOTSDELIVERYACTUAL] = self.oTSDELIVERYACTUAL;
    }
    if(self.oTSDELIVERYNOTICE != nil){
        dictionary[kOrderDetailModelOTSDELIVERYNOTICE] = self.oTSDELIVERYNOTICE;
    }
    if(self.oTSREMARKDELIVERY != nil){
        dictionary[kOrderDetailModelOTSREMARKDELIVERY] = self.oTSREMARKDELIVERY;
    }
    if(self.oTSREMARKRETURN != nil){
        dictionary[kOrderDetailModelOTSREMARKRETURN] = self.oTSREMARKRETURN;
    }
    if(self.oTSRETURNDATE != nil){
        dictionary[kOrderDetailModelOTSRETURNDATE] = self.oTSRETURNDATE;
    }
    if(self.tMSORDNO != nil){
        dictionary[kOrderDetailModelTMSORDNO] = self.tMSORDNO;
    }
    if(self.uPDATE03 != nil){
        dictionary[kOrderDetailModelUPDATE03] = self.uPDATE03;
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
        [aCoder encodeObject:self.iDX forKey:kOrderDetailModelIDX];
    }
    if(self.oMSREMARKAUDIT != nil){
        [aCoder encodeObject:self.oMSREMARKAUDIT forKey:kOrderDetailModelOMSREMARKAUDIT];
    }
    if(self.oRDDATEADD != nil){
        [aCoder encodeObject:self.oRDDATEADD forKey:kOrderDetailModelORDDATEADD];
    }
    if(self.oRDDATEEDIT != nil){
        [aCoder encodeObject:self.oRDDATEEDIT forKey:kOrderDetailModelORDDATEEDIT];
    }
    if(self.oRDFROMADDRESS != nil){
        [aCoder encodeObject:self.oRDFROMADDRESS forKey:kOrderDetailModelORDFROMADDRESS];
    }
    if(self.oRDFROMCNAME != nil){
        [aCoder encodeObject:self.oRDFROMCNAME forKey:kOrderDetailModelORDFROMCNAME];
    }
    if(self.oRDFROMCTEL != nil){
        [aCoder encodeObject:self.oRDFROMCTEL forKey:kOrderDetailModelORDFROMCTEL];
    }
    if(self.oRDFROMNAME != nil){
        [aCoder encodeObject:self.oRDFROMNAME forKey:kOrderDetailModelORDFROMNAME];
    }
    if(self.oRDISSUEQTY != nil){
        [aCoder encodeObject:self.oRDISSUEQTY forKey:kOrderDetailModelORDISSUEQTY];
    }
    if(self.oRDISSUEVOLUME != nil){
        [aCoder encodeObject:self.oRDISSUEVOLUME forKey:kOrderDetailModelORDISSUEVOLUME];
    }
    if(self.oRDISSUEWEIGHT != nil){
        [aCoder encodeObject:self.oRDISSUEWEIGHT forKey:kOrderDetailModelORDISSUEWEIGHT];
    }
    if(self.oRDNO != nil){
        [aCoder encodeObject:self.oRDNO forKey:kOrderDetailModelORDNO];
    }
    if(self.oRDNOCLIENT != nil){
        [aCoder encodeObject:self.oRDNOCLIENT forKey:kOrderDetailModelORDNOCLIENT];
    }
    if(self.oRDNOCONSIGNEE != nil){
        [aCoder encodeObject:self.oRDNOCONSIGNEE forKey:kOrderDetailModelORDNOCONSIGNEE];
    }
    if(self.oRDPROJECTEDDELIVERY != nil){
        [aCoder encodeObject:self.oRDPROJECTEDDELIVERY forKey:kOrderDetailModelORDPROJECTEDDELIVERY];
    }
    if(self.oRDREMARKCLIENT != nil){
        [aCoder encodeObject:self.oRDREMARKCLIENT forKey:kOrderDetailModelORDREMARKCLIENT];
    }
    if(self.oRDREMARKCONSIGNEE != nil){
        [aCoder encodeObject:self.oRDREMARKCONSIGNEE forKey:kOrderDetailModelORDREMARKCONSIGNEE];
    }
    if(self.oRDREQUESTDELIVERY != nil){
        [aCoder encodeObject:self.oRDREQUESTDELIVERY forKey:kOrderDetailModelORDREQUESTDELIVERY];
    }
    if(self.oRDREQUESTISSUE != nil){
        [aCoder encodeObject:self.oRDREQUESTISSUE forKey:kOrderDetailModelORDREQUESTISSUE];
    }
    if(self.oRDTOADDRESS != nil){
        [aCoder encodeObject:self.oRDTOADDRESS forKey:kOrderDetailModelORDTOADDRESS];
    }
    if(self.oRDTOCNAME != nil){
        [aCoder encodeObject:self.oRDTOCNAME forKey:kOrderDetailModelORDTOCNAME];
    }
    if(self.oRDTOCTEL != nil){
        [aCoder encodeObject:self.oRDTOCTEL forKey:kOrderDetailModelORDTOCTEL];
    }
    if(self.oRDTONAME != nil){
        [aCoder encodeObject:self.oRDTONAME forKey:kOrderDetailModelORDTONAME];
    }
    if(self.oRDTYPECLIENT != nil){
        [aCoder encodeObject:self.oRDTYPECLIENT forKey:kOrderDetailModelORDTYPECLIENT];
    }
    if(self.oRDVEHICLESIZE != nil){
        [aCoder encodeObject:self.oRDVEHICLESIZE forKey:kOrderDetailModelORDVEHICLESIZE];
    }
    if(self.oRDVEHICLETYPE != nil){
        [aCoder encodeObject:self.oRDVEHICLETYPE forKey:kOrderDetailModelORDVEHICLETYPE];
    }
    if(self.oTSDELIVERYACTUAL != nil){
        [aCoder encodeObject:self.oTSDELIVERYACTUAL forKey:kOrderDetailModelOTSDELIVERYACTUAL];
    }
    if(self.oTSDELIVERYNOTICE != nil){
        [aCoder encodeObject:self.oTSDELIVERYNOTICE forKey:kOrderDetailModelOTSDELIVERYNOTICE];
    }
    if(self.oTSREMARKDELIVERY != nil){
        [aCoder encodeObject:self.oTSREMARKDELIVERY forKey:kOrderDetailModelOTSREMARKDELIVERY];
    }
    if(self.oTSREMARKRETURN != nil){
        [aCoder encodeObject:self.oTSREMARKRETURN forKey:kOrderDetailModelOTSREMARKRETURN];
    }
    if(self.oTSRETURNDATE != nil){
        [aCoder encodeObject:self.oTSRETURNDATE forKey:kOrderDetailModelOTSRETURNDATE];
    }
    if(self.tMSORDNO != nil){
        [aCoder encodeObject:self.tMSORDNO forKey:kOrderDetailModelTMSORDNO];
    }
    if(self.uPDATE03 != nil){
        [aCoder encodeObject:self.uPDATE03 forKey:kOrderDetailModelUPDATE03];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.iDX = [aDecoder decodeObjectForKey:kOrderDetailModelIDX];
    self.oMSREMARKAUDIT = [aDecoder decodeObjectForKey:kOrderDetailModelOMSREMARKAUDIT];
    self.oRDDATEADD = [aDecoder decodeObjectForKey:kOrderDetailModelORDDATEADD];
    self.oRDDATEEDIT = [aDecoder decodeObjectForKey:kOrderDetailModelORDDATEEDIT];
    self.oRDFROMADDRESS = [aDecoder decodeObjectForKey:kOrderDetailModelORDFROMADDRESS];
    self.oRDFROMCNAME = [aDecoder decodeObjectForKey:kOrderDetailModelORDFROMCNAME];
    self.oRDFROMCTEL = [aDecoder decodeObjectForKey:kOrderDetailModelORDFROMCTEL];
    self.oRDFROMNAME = [aDecoder decodeObjectForKey:kOrderDetailModelORDFROMNAME];
    self.oRDISSUEQTY = [aDecoder decodeObjectForKey:kOrderDetailModelORDISSUEQTY];
    self.oRDISSUEVOLUME = [aDecoder decodeObjectForKey:kOrderDetailModelORDISSUEVOLUME];
    self.oRDISSUEWEIGHT = [aDecoder decodeObjectForKey:kOrderDetailModelORDISSUEWEIGHT];
    self.oRDNO = [aDecoder decodeObjectForKey:kOrderDetailModelORDNO];
    self.oRDNOCLIENT = [aDecoder decodeObjectForKey:kOrderDetailModelORDNOCLIENT];
    self.oRDNOCONSIGNEE = [aDecoder decodeObjectForKey:kOrderDetailModelORDNOCONSIGNEE];
    self.oRDPROJECTEDDELIVERY = [aDecoder decodeObjectForKey:kOrderDetailModelORDPROJECTEDDELIVERY];
    self.oRDREMARKCLIENT = [aDecoder decodeObjectForKey:kOrderDetailModelORDREMARKCLIENT];
    self.oRDREMARKCONSIGNEE = [aDecoder decodeObjectForKey:kOrderDetailModelORDREMARKCONSIGNEE];
    self.oRDREQUESTDELIVERY = [aDecoder decodeObjectForKey:kOrderDetailModelORDREQUESTDELIVERY];
    self.oRDREQUESTISSUE = [aDecoder decodeObjectForKey:kOrderDetailModelORDREQUESTISSUE];
    self.oRDTOADDRESS = [aDecoder decodeObjectForKey:kOrderDetailModelORDTOADDRESS];
    self.oRDTOCNAME = [aDecoder decodeObjectForKey:kOrderDetailModelORDTOCNAME];
    self.oRDTOCTEL = [aDecoder decodeObjectForKey:kOrderDetailModelORDTOCTEL];
    self.oRDTONAME = [aDecoder decodeObjectForKey:kOrderDetailModelORDTONAME];
    self.oRDTYPECLIENT = [aDecoder decodeObjectForKey:kOrderDetailModelORDTYPECLIENT];
    self.oRDVEHICLESIZE = [aDecoder decodeObjectForKey:kOrderDetailModelORDVEHICLESIZE];
    self.oRDVEHICLETYPE = [aDecoder decodeObjectForKey:kOrderDetailModelORDVEHICLETYPE];
    self.oTSDELIVERYACTUAL = [aDecoder decodeObjectForKey:kOrderDetailModelOTSDELIVERYACTUAL];
    self.oTSDELIVERYNOTICE = [aDecoder decodeObjectForKey:kOrderDetailModelOTSDELIVERYNOTICE];
    self.oTSREMARKDELIVERY = [aDecoder decodeObjectForKey:kOrderDetailModelOTSREMARKDELIVERY];
    self.oTSREMARKRETURN = [aDecoder decodeObjectForKey:kOrderDetailModelOTSREMARKRETURN];
    self.oTSRETURNDATE = [aDecoder decodeObjectForKey:kOrderDetailModelOTSRETURNDATE];
    self.tMSORDNO = [aDecoder decodeObjectForKey:kOrderDetailModelTMSORDNO];
    self.uPDATE03 = [aDecoder decodeObjectForKey:kOrderDetailModelUPDATE03];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    OrderDetailModel *copy = [OrderDetailModel new];
    
    copy.iDX = [self.iDX copy];
    copy.oMSREMARKAUDIT = [self.oMSREMARKAUDIT copy];
    copy.oRDDATEADD = [self.oRDDATEADD copy];
    copy.oRDDATEEDIT = [self.oRDDATEEDIT copy];
    copy.oRDFROMADDRESS = [self.oRDFROMADDRESS copy];
    copy.oRDFROMCNAME = [self.oRDFROMCNAME copy];
    copy.oRDFROMCTEL = [self.oRDFROMCTEL copy];
    copy.oRDFROMNAME = [self.oRDFROMNAME copy];
    copy.oRDISSUEQTY = [self.oRDISSUEQTY copy];
    copy.oRDISSUEVOLUME = [self.oRDISSUEVOLUME copy];
    copy.oRDISSUEWEIGHT = [self.oRDISSUEWEIGHT copy];
    copy.oRDNO = [self.oRDNO copy];
    copy.oRDNOCLIENT = [self.oRDNOCLIENT copy];
    copy.oRDNOCONSIGNEE = [self.oRDNOCONSIGNEE copy];
    copy.oRDPROJECTEDDELIVERY = [self.oRDPROJECTEDDELIVERY copy];
    copy.oRDREMARKCLIENT = [self.oRDREMARKCLIENT copy];
    copy.oRDREMARKCONSIGNEE = [self.oRDREMARKCONSIGNEE copy];
    copy.oRDREQUESTDELIVERY = [self.oRDREQUESTDELIVERY copy];
    copy.oRDREQUESTISSUE = [self.oRDREQUESTISSUE copy];
    copy.oRDTOADDRESS = [self.oRDTOADDRESS copy];
    copy.oRDTOCNAME = [self.oRDTOCNAME copy];
    copy.oRDTOCTEL = [self.oRDTOCTEL copy];
    copy.oRDTONAME = [self.oRDTONAME copy];
    copy.oRDTYPECLIENT = [self.oRDTYPECLIENT copy];
    copy.oRDVEHICLESIZE = [self.oRDVEHICLESIZE copy];
    copy.oRDVEHICLETYPE = [self.oRDVEHICLETYPE copy];
    copy.oTSDELIVERYACTUAL = [self.oTSDELIVERYACTUAL copy];
    copy.oTSDELIVERYNOTICE = [self.oTSDELIVERYNOTICE copy];
    copy.oTSREMARKDELIVERY = [self.oTSREMARKDELIVERY copy];
    copy.oTSREMARKRETURN = [self.oTSREMARKRETURN copy];
    copy.oTSRETURNDATE = [self.oTSRETURNDATE copy];
    copy.tMSORDNO = [self.tMSORDNO copy];
    copy.uPDATE03 = [self.uPDATE03 copy];
    
    return copy;
}

@end
