//
//  ShipmentModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/7.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "ShipmentModel.h"

NSString *const kShipmentModelAUDITFLAG = @"AUDIT_FLAG";
NSString *const kShipmentModelDATEADD = @"DATE_ADD";
NSString *const kShipmentModelDATECONFIRMED = @"DATE_CONFIRMED";
NSString *const kShipmentModelDATEEDIT = @"DATE_EDIT";
NSString *const kShipmentModelDATEISSUE = @"DATE_ISSUE";
NSString *const kShipmentModelDATELOAD = @"DATE_LOAD";
NSString *const kShipmentModelDRIVERIDX = @"DRIVER_IDX";
NSString *const kShipmentModelDRIVERNAME = @"DRIVER_NAME";
NSString *const kShipmentModelDRIVERTEL = @"DRIVER_TEL";
NSString *const kShipmentModelFLEETIDX = @"FLEET_IDX";
NSString *const kShipmentModelFLEETNAME = @"FLEET_NAME";
NSString *const kShipmentModelFROMCITY = @"FROM_CITY";
NSString *const kShipmentModelIDX = @"IDX";
NSString *const kShipmentModelORGIDX = @"ORG_IDX";
NSString *const kShipmentModelORGNAME = @"ORG_NAME";
NSString *const kShipmentModelPLATENUMBER = @"PLATE_NUMBER";
NSString *const kShipmentModelREFERENCE01 = @"REFERENCE01";
NSString *const kShipmentModelREFERENCE02 = @"REFERENCE02";
NSString *const kShipmentModelREFERENCE03 = @"REFERENCE03";
NSString *const kShipmentModelREFERENCE04 = @"REFERENCE04";
NSString *const kShipmentModelREFERENCE05 = @"REFERENCE05";
NSString *const kShipmentModelREFERENCE06 = @"REFERENCE06";
NSString *const kShipmentModelSHIPMENTNO = @"SHIPMENT_NO";
NSString *const kShipmentModelSHIPMENTSTATE = @"SHIPMENT_STATE";
NSString *const kShipmentModelSUPPLYIDX = @"SUPPLY_IDX";
NSString *const kShipmentModelTMSIDX = @"TMS_IDX";
NSString *const kShipmentModelTMSSHIPMENTNO = @"TMS_SHIPMENT_NO";
NSString *const kShipmentModelTOTALVOLUME = @"TOTAL_VOLUME";
NSString *const kShipmentModelTOTALWEIGHT = @"TOTAL_WEIGHT";
NSString *const kShipmentModelTOCITY = @"TO_CITY";
NSString *const kShipmentModelUSERNAME = @"USER_NAME";
NSString *const kShipmentModelVEHICLEIDX = @"VEHICLE_IDX";
NSString *const kShipmentModelVEHICLESIZE = @"VEHICLE_SIZE";
NSString *const kShipmentModelVEHICLETYPE = @"VEHICLE_TYPE";


@implementation ShipmentModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kShipmentModelAUDITFLAG] isKindOfClass:[NSNull class]]){
        self.aUDITFLAG = dictionary[kShipmentModelAUDITFLAG];
    }
    if(![dictionary[kShipmentModelDATEADD] isKindOfClass:[NSNull class]]){
        self.dATEADD = dictionary[kShipmentModelDATEADD];
    }
    if(![dictionary[kShipmentModelDATECONFIRMED] isKindOfClass:[NSNull class]]){
        self.dATECONFIRMED = dictionary[kShipmentModelDATECONFIRMED];
    }
    if(![dictionary[kShipmentModelDATEEDIT] isKindOfClass:[NSNull class]]){
        self.dATEEDIT = dictionary[kShipmentModelDATEEDIT];
    }
    if(![dictionary[kShipmentModelDATEISSUE] isKindOfClass:[NSNull class]]){
        self.dATEISSUE = dictionary[kShipmentModelDATEISSUE];
    }
    if(![dictionary[kShipmentModelDATELOAD] isKindOfClass:[NSNull class]]){
        self.dATELOAD = dictionary[kShipmentModelDATELOAD];
    }
    if(![dictionary[kShipmentModelDRIVERIDX] isKindOfClass:[NSNull class]]){
        self.dRIVERIDX = dictionary[kShipmentModelDRIVERIDX];
    }
    if(![dictionary[kShipmentModelDRIVERNAME] isKindOfClass:[NSNull class]]){
        self.dRIVERNAME = dictionary[kShipmentModelDRIVERNAME];
    }
    if(![dictionary[kShipmentModelDRIVERTEL] isKindOfClass:[NSNull class]]){
        self.dRIVERTEL = dictionary[kShipmentModelDRIVERTEL];
    }
    if(![dictionary[kShipmentModelFLEETIDX] isKindOfClass:[NSNull class]]){
        self.fLEETIDX = dictionary[kShipmentModelFLEETIDX];
    }
    if(![dictionary[kShipmentModelFLEETNAME] isKindOfClass:[NSNull class]]){
        self.fLEETNAME = dictionary[kShipmentModelFLEETNAME];
    }
    if(![dictionary[kShipmentModelFROMCITY] isKindOfClass:[NSNull class]]){
        self.fROMCITY = dictionary[kShipmentModelFROMCITY];
    }
    if(![dictionary[kShipmentModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kShipmentModelIDX];
    }
    if(![dictionary[kShipmentModelORGIDX] isKindOfClass:[NSNull class]]){
        self.oRGIDX = dictionary[kShipmentModelORGIDX];
    }
    if(![dictionary[kShipmentModelORGNAME] isKindOfClass:[NSNull class]]){
        self.oRGNAME = dictionary[kShipmentModelORGNAME];
    }
    if(![dictionary[kShipmentModelPLATENUMBER] isKindOfClass:[NSNull class]]){
        self.pLATENUMBER = dictionary[kShipmentModelPLATENUMBER];
    }
    if(![dictionary[kShipmentModelREFERENCE01] isKindOfClass:[NSNull class]]){
        self.rEFERENCE01 = dictionary[kShipmentModelREFERENCE01];
    }
    if(![dictionary[kShipmentModelREFERENCE02] isKindOfClass:[NSNull class]]){
        self.rEFERENCE02 = dictionary[kShipmentModelREFERENCE02];
    }
    if(![dictionary[kShipmentModelREFERENCE03] isKindOfClass:[NSNull class]]){
        self.rEFERENCE03 = dictionary[kShipmentModelREFERENCE03];
    }
    if(![dictionary[kShipmentModelREFERENCE04] isKindOfClass:[NSNull class]]){
        self.rEFERENCE04 = dictionary[kShipmentModelREFERENCE04];
    }
    if(![dictionary[kShipmentModelREFERENCE05] isKindOfClass:[NSNull class]]){
        self.rEFERENCE05 = dictionary[kShipmentModelREFERENCE05];
    }
    if(![dictionary[kShipmentModelREFERENCE06] isKindOfClass:[NSNull class]]){
        self.rEFERENCE06 = dictionary[kShipmentModelREFERENCE06];
    }
    if(![dictionary[kShipmentModelSHIPMENTNO] isKindOfClass:[NSNull class]]){
        self.sHIPMENTNO = dictionary[kShipmentModelSHIPMENTNO];
    }
    if(![dictionary[kShipmentModelSHIPMENTSTATE] isKindOfClass:[NSNull class]]){
        self.sHIPMENTSTATE = dictionary[kShipmentModelSHIPMENTSTATE];
    }
    if(![dictionary[kShipmentModelSUPPLYIDX] isKindOfClass:[NSNull class]]){
        self.sUPPLYIDX = dictionary[kShipmentModelSUPPLYIDX];
    }
    if(![dictionary[kShipmentModelTMSIDX] isKindOfClass:[NSNull class]]){
        self.tMSIDX = dictionary[kShipmentModelTMSIDX];
    }
    if(![dictionary[kShipmentModelTMSSHIPMENTNO] isKindOfClass:[NSNull class]]){
        self.tMSSHIPMENTNO = dictionary[kShipmentModelTMSSHIPMENTNO];
    }
    if(![dictionary[kShipmentModelTOTALVOLUME] isKindOfClass:[NSNull class]]){
        self.tOTALVOLUME = dictionary[kShipmentModelTOTALVOLUME];
    }
    if(![dictionary[kShipmentModelTOTALWEIGHT] isKindOfClass:[NSNull class]]){
        self.tOTALWEIGHT = dictionary[kShipmentModelTOTALWEIGHT];
    }
    if(![dictionary[kShipmentModelTOCITY] isKindOfClass:[NSNull class]]){
        self.tOCITY = dictionary[kShipmentModelTOCITY];
    }
    if(![dictionary[kShipmentModelUSERNAME] isKindOfClass:[NSNull class]]){
        self.uSERNAME = dictionary[kShipmentModelUSERNAME];
    }
    if(![dictionary[kShipmentModelVEHICLEIDX] isKindOfClass:[NSNull class]]){
        self.vEHICLEIDX = dictionary[kShipmentModelVEHICLEIDX];
    }
    if(![dictionary[kShipmentModelVEHICLESIZE] isKindOfClass:[NSNull class]]){
        self.vEHICLESIZE = dictionary[kShipmentModelVEHICLESIZE];
    }
    if(![dictionary[kShipmentModelVEHICLETYPE] isKindOfClass:[NSNull class]]){
        self.vEHICLETYPE = dictionary[kShipmentModelVEHICLETYPE];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aUDITFLAG != nil){
        dictionary[kShipmentModelAUDITFLAG] = self.aUDITFLAG;
    }
    if(self.dATEADD != nil){
        dictionary[kShipmentModelDATEADD] = self.dATEADD;
    }
    if(self.dATECONFIRMED != nil){
        dictionary[kShipmentModelDATECONFIRMED] = self.dATECONFIRMED;
    }
    if(self.dATEEDIT != nil){
        dictionary[kShipmentModelDATEEDIT] = self.dATEEDIT;
    }
    if(self.dATEISSUE != nil){
        dictionary[kShipmentModelDATEISSUE] = self.dATEISSUE;
    }
    if(self.dATELOAD != nil){
        dictionary[kShipmentModelDATELOAD] = self.dATELOAD;
    }
    if(self.dRIVERIDX != nil){
        dictionary[kShipmentModelDRIVERIDX] = self.dRIVERIDX;
    }
    if(self.dRIVERNAME != nil){
        dictionary[kShipmentModelDRIVERNAME] = self.dRIVERNAME;
    }
    if(self.dRIVERTEL != nil){
        dictionary[kShipmentModelDRIVERTEL] = self.dRIVERTEL;
    }
    if(self.fLEETIDX != nil){
        dictionary[kShipmentModelFLEETIDX] = self.fLEETIDX;
    }
    if(self.fLEETNAME != nil){
        dictionary[kShipmentModelFLEETNAME] = self.fLEETNAME;
    }
    if(self.fROMCITY != nil){
        dictionary[kShipmentModelFROMCITY] = self.fROMCITY;
    }
    if(self.iDX != nil){
        dictionary[kShipmentModelIDX] = self.iDX;
    }
    if(self.oRGIDX != nil){
        dictionary[kShipmentModelORGIDX] = self.oRGIDX;
    }
    if(self.oRGNAME != nil){
        dictionary[kShipmentModelORGNAME] = self.oRGNAME;
    }
    if(self.pLATENUMBER != nil){
        dictionary[kShipmentModelPLATENUMBER] = self.pLATENUMBER;
    }
    if(self.rEFERENCE01 != nil){
        dictionary[kShipmentModelREFERENCE01] = self.rEFERENCE01;
    }
    if(self.rEFERENCE02 != nil){
        dictionary[kShipmentModelREFERENCE02] = self.rEFERENCE02;
    }
    if(self.rEFERENCE03 != nil){
        dictionary[kShipmentModelREFERENCE03] = self.rEFERENCE03;
    }
    if(self.rEFERENCE04 != nil){
        dictionary[kShipmentModelREFERENCE04] = self.rEFERENCE04;
    }
    if(self.rEFERENCE05 != nil){
        dictionary[kShipmentModelREFERENCE05] = self.rEFERENCE05;
    }
    if(self.rEFERENCE06 != nil){
        dictionary[kShipmentModelREFERENCE06] = self.rEFERENCE06;
    }
    if(self.sHIPMENTNO != nil){
        dictionary[kShipmentModelSHIPMENTNO] = self.sHIPMENTNO;
    }
    if(self.sHIPMENTSTATE != nil){
        dictionary[kShipmentModelSHIPMENTSTATE] = self.sHIPMENTSTATE;
    }
    if(self.sUPPLYIDX != nil){
        dictionary[kShipmentModelSUPPLYIDX] = self.sUPPLYIDX;
    }
    if(self.tMSIDX != nil){
        dictionary[kShipmentModelTMSIDX] = self.tMSIDX;
    }
    if(self.tMSSHIPMENTNO != nil){
        dictionary[kShipmentModelTMSSHIPMENTNO] = self.tMSSHIPMENTNO;
    }
    if(self.tOTALVOLUME != nil){
        dictionary[kShipmentModelTOTALVOLUME] = self.tOTALVOLUME;
    }
    if(self.tOTALWEIGHT != nil){
        dictionary[kShipmentModelTOTALWEIGHT] = self.tOTALWEIGHT;
    }
    if(self.tOCITY != nil){
        dictionary[kShipmentModelTOCITY] = self.tOCITY;
    }
    if(self.uSERNAME != nil){
        dictionary[kShipmentModelUSERNAME] = self.uSERNAME;
    }
    if(self.vEHICLEIDX != nil){
        dictionary[kShipmentModelVEHICLEIDX] = self.vEHICLEIDX;
    }
    if(self.vEHICLESIZE != nil){
        dictionary[kShipmentModelVEHICLESIZE] = self.vEHICLESIZE;
    }
    if(self.vEHICLETYPE != nil){
        dictionary[kShipmentModelVEHICLETYPE] = self.vEHICLETYPE;
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
    if(self.aUDITFLAG != nil){
        [aCoder encodeObject:self.aUDITFLAG forKey:kShipmentModelAUDITFLAG];
    }
    if(self.dATEADD != nil){
        [aCoder encodeObject:self.dATEADD forKey:kShipmentModelDATEADD];
    }
    if(self.dATECONFIRMED != nil){
        [aCoder encodeObject:self.dATECONFIRMED forKey:kShipmentModelDATECONFIRMED];
    }
    if(self.dATEEDIT != nil){
        [aCoder encodeObject:self.dATEEDIT forKey:kShipmentModelDATEEDIT];
    }
    if(self.dATEISSUE != nil){
        [aCoder encodeObject:self.dATEISSUE forKey:kShipmentModelDATEISSUE];
    }
    if(self.dATELOAD != nil){
        [aCoder encodeObject:self.dATELOAD forKey:kShipmentModelDATELOAD];
    }
    if(self.dRIVERIDX != nil){
        [aCoder encodeObject:self.dRIVERIDX forKey:kShipmentModelDRIVERIDX];
    }
    if(self.dRIVERNAME != nil){
        [aCoder encodeObject:self.dRIVERNAME forKey:kShipmentModelDRIVERNAME];
    }
    if(self.dRIVERTEL != nil){
        [aCoder encodeObject:self.dRIVERTEL forKey:kShipmentModelDRIVERTEL];
    }
    if(self.fLEETIDX != nil){
        [aCoder encodeObject:self.fLEETIDX forKey:kShipmentModelFLEETIDX];
    }
    if(self.fLEETNAME != nil){
        [aCoder encodeObject:self.fLEETNAME forKey:kShipmentModelFLEETNAME];
    }
    if(self.fROMCITY != nil){
        [aCoder encodeObject:self.fROMCITY forKey:kShipmentModelFROMCITY];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kShipmentModelIDX];
    }
    if(self.oRGIDX != nil){
        [aCoder encodeObject:self.oRGIDX forKey:kShipmentModelORGIDX];
    }
    if(self.oRGNAME != nil){
        [aCoder encodeObject:self.oRGNAME forKey:kShipmentModelORGNAME];
    }
    if(self.pLATENUMBER != nil){
        [aCoder encodeObject:self.pLATENUMBER forKey:kShipmentModelPLATENUMBER];
    }
    if(self.rEFERENCE01 != nil){
        [aCoder encodeObject:self.rEFERENCE01 forKey:kShipmentModelREFERENCE01];
    }
    if(self.rEFERENCE02 != nil){
        [aCoder encodeObject:self.rEFERENCE02 forKey:kShipmentModelREFERENCE02];
    }
    if(self.rEFERENCE03 != nil){
        [aCoder encodeObject:self.rEFERENCE03 forKey:kShipmentModelREFERENCE03];
    }
    if(self.rEFERENCE04 != nil){
        [aCoder encodeObject:self.rEFERENCE04 forKey:kShipmentModelREFERENCE04];
    }
    if(self.rEFERENCE05 != nil){
        [aCoder encodeObject:self.rEFERENCE05 forKey:kShipmentModelREFERENCE05];
    }
    if(self.rEFERENCE06 != nil){
        [aCoder encodeObject:self.rEFERENCE06 forKey:kShipmentModelREFERENCE06];
    }
    if(self.sHIPMENTNO != nil){
        [aCoder encodeObject:self.sHIPMENTNO forKey:kShipmentModelSHIPMENTNO];
    }
    if(self.sHIPMENTSTATE != nil){
        [aCoder encodeObject:self.sHIPMENTSTATE forKey:kShipmentModelSHIPMENTSTATE];
    }
    if(self.sUPPLYIDX != nil){
        [aCoder encodeObject:self.sUPPLYIDX forKey:kShipmentModelSUPPLYIDX];
    }
    if(self.tMSIDX != nil){
        [aCoder encodeObject:self.tMSIDX forKey:kShipmentModelTMSIDX];
    }
    if(self.tMSSHIPMENTNO != nil){
        [aCoder encodeObject:self.tMSSHIPMENTNO forKey:kShipmentModelTMSSHIPMENTNO];
    }
    if(self.tOTALVOLUME != nil){
        [aCoder encodeObject:self.tOTALVOLUME forKey:kShipmentModelTOTALVOLUME];
    }
    if(self.tOTALWEIGHT != nil){
        [aCoder encodeObject:self.tOTALWEIGHT forKey:kShipmentModelTOTALWEIGHT];
    }
    if(self.tOCITY != nil){
        [aCoder encodeObject:self.tOCITY forKey:kShipmentModelTOCITY];
    }
    if(self.uSERNAME != nil){
        [aCoder encodeObject:self.uSERNAME forKey:kShipmentModelUSERNAME];
    }
    if(self.vEHICLEIDX != nil){
        [aCoder encodeObject:self.vEHICLEIDX forKey:kShipmentModelVEHICLEIDX];
    }
    if(self.vEHICLESIZE != nil){
        [aCoder encodeObject:self.vEHICLESIZE forKey:kShipmentModelVEHICLESIZE];
    }
    if(self.vEHICLETYPE != nil){
        [aCoder encodeObject:self.vEHICLETYPE forKey:kShipmentModelVEHICLETYPE];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aUDITFLAG = [aDecoder decodeObjectForKey:kShipmentModelAUDITFLAG];
    self.dATEADD = [aDecoder decodeObjectForKey:kShipmentModelDATEADD];
    self.dATECONFIRMED = [aDecoder decodeObjectForKey:kShipmentModelDATECONFIRMED];
    self.dATEEDIT = [aDecoder decodeObjectForKey:kShipmentModelDATEEDIT];
    self.dATEISSUE = [aDecoder decodeObjectForKey:kShipmentModelDATEISSUE];
    self.dATELOAD = [aDecoder decodeObjectForKey:kShipmentModelDATELOAD];
    self.dRIVERIDX = [aDecoder decodeObjectForKey:kShipmentModelDRIVERIDX];
    self.dRIVERNAME = [aDecoder decodeObjectForKey:kShipmentModelDRIVERNAME];
    self.dRIVERTEL = [aDecoder decodeObjectForKey:kShipmentModelDRIVERTEL];
    self.fLEETIDX = [aDecoder decodeObjectForKey:kShipmentModelFLEETIDX];
    self.fLEETNAME = [aDecoder decodeObjectForKey:kShipmentModelFLEETNAME];
    self.fROMCITY = [aDecoder decodeObjectForKey:kShipmentModelFROMCITY];
    self.iDX = [aDecoder decodeObjectForKey:kShipmentModelIDX];
    self.oRGIDX = [aDecoder decodeObjectForKey:kShipmentModelORGIDX];
    self.oRGNAME = [aDecoder decodeObjectForKey:kShipmentModelORGNAME];
    self.pLATENUMBER = [aDecoder decodeObjectForKey:kShipmentModelPLATENUMBER];
    self.rEFERENCE01 = [aDecoder decodeObjectForKey:kShipmentModelREFERENCE01];
    self.rEFERENCE02 = [aDecoder decodeObjectForKey:kShipmentModelREFERENCE02];
    self.rEFERENCE03 = [aDecoder decodeObjectForKey:kShipmentModelREFERENCE03];
    self.rEFERENCE04 = [aDecoder decodeObjectForKey:kShipmentModelREFERENCE04];
    self.rEFERENCE05 = [aDecoder decodeObjectForKey:kShipmentModelREFERENCE05];
    self.rEFERENCE06 = [aDecoder decodeObjectForKey:kShipmentModelREFERENCE06];
    self.sHIPMENTNO = [aDecoder decodeObjectForKey:kShipmentModelSHIPMENTNO];
    self.sHIPMENTSTATE = [aDecoder decodeObjectForKey:kShipmentModelSHIPMENTSTATE];
    self.sUPPLYIDX = [aDecoder decodeObjectForKey:kShipmentModelSUPPLYIDX];
    self.tMSIDX = [aDecoder decodeObjectForKey:kShipmentModelTMSIDX];
    self.tMSSHIPMENTNO = [aDecoder decodeObjectForKey:kShipmentModelTMSSHIPMENTNO];
    self.tOTALVOLUME = [aDecoder decodeObjectForKey:kShipmentModelTOTALVOLUME];
    self.tOTALWEIGHT = [aDecoder decodeObjectForKey:kShipmentModelTOTALWEIGHT];
    self.tOCITY = [aDecoder decodeObjectForKey:kShipmentModelTOCITY];
    self.uSERNAME = [aDecoder decodeObjectForKey:kShipmentModelUSERNAME];
    self.vEHICLEIDX = [aDecoder decodeObjectForKey:kShipmentModelVEHICLEIDX];
    self.vEHICLESIZE = [aDecoder decodeObjectForKey:kShipmentModelVEHICLESIZE];
    self.vEHICLETYPE = [aDecoder decodeObjectForKey:kShipmentModelVEHICLETYPE];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    ShipmentModel *copy = [ShipmentModel new];
    
    copy.aUDITFLAG = [self.aUDITFLAG copy];
    copy.dATEADD = [self.dATEADD copy];
    copy.dATECONFIRMED = [self.dATECONFIRMED copy];
    copy.dATEEDIT = [self.dATEEDIT copy];
    copy.dATEISSUE = [self.dATEISSUE copy];
    copy.dATELOAD = [self.dATELOAD copy];
    copy.dRIVERIDX = [self.dRIVERIDX copy];
    copy.dRIVERNAME = [self.dRIVERNAME copy];
    copy.dRIVERTEL = [self.dRIVERTEL copy];
    copy.fLEETIDX = [self.fLEETIDX copy];
    copy.fLEETNAME = [self.fLEETNAME copy];
    copy.fROMCITY = [self.fROMCITY copy];
    copy.iDX = [self.iDX copy];
    copy.oRGIDX = [self.oRGIDX copy];
    copy.oRGNAME = [self.oRGNAME copy];
    copy.pLATENUMBER = [self.pLATENUMBER copy];
    copy.rEFERENCE01 = [self.rEFERENCE01 copy];
    copy.rEFERENCE02 = [self.rEFERENCE02 copy];
    copy.rEFERENCE03 = [self.rEFERENCE03 copy];
    copy.rEFERENCE04 = [self.rEFERENCE04 copy];
    copy.rEFERENCE05 = [self.rEFERENCE05 copy];
    copy.rEFERENCE06 = [self.rEFERENCE06 copy];
    copy.sHIPMENTNO = [self.sHIPMENTNO copy];
    copy.sHIPMENTSTATE = [self.sHIPMENTSTATE copy];
    copy.sUPPLYIDX = [self.sUPPLYIDX copy];
    copy.tMSIDX = [self.tMSIDX copy];
    copy.tMSSHIPMENTNO = [self.tMSSHIPMENTNO copy];
    copy.tOTALVOLUME = [self.tOTALVOLUME copy];
    copy.tOTALWEIGHT = [self.tOTALWEIGHT copy];
    copy.tOCITY = [self.tOCITY copy];
    copy.uSERNAME = [self.uSERNAME copy];
    copy.vEHICLEIDX = [self.vEHICLEIDX copy];
    copy.vEHICLESIZE = [self.vEHICLESIZE copy];
    copy.vEHICLETYPE = [self.vEHICLETYPE copy];
    
    return copy;
}

@end
