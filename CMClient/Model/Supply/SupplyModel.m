//
//  SupplyModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "SupplyModel.h"


NSString *const kSupplyModelADDDATE = @"ADD_DATE";
NSString *const kSupplyModelAPPUSERIDX = @"APP_USER_IDX";
NSString *const kSupplyModelBRANDMODEL = @"BRAND_MODEL";
NSString *const kSupplyModelDISTRIBUTIONEXPERIENCE = @"DISTRIBUTION_EXPERIENCE";
NSString *const kSupplyModelDRIVERIDX = @"DRIVER_IDX";
NSString *const kSupplyModelDRIVERNAME = @"DRIVER_NAME";
NSString *const kSupplyModelDRIVERREQUEST = @"DRIVER_REQUEST";
NSString *const kSupplyModelDRIVERTEL = @"DRIVER_TEL";
NSString *const kSupplyModelEDITDATE = @"EDIT_DATE";
NSString *const kSupplyModelFLEETIDX = @"FLEET_IDX";
NSString *const kSupplyModelFLEETNAME = @"FLEET_NAME";
NSString *const kSupplyModelHANDLINGDEGREE = @"HANDLING_DEGREE";
NSString *const kSupplyModelHAVELOAD = @"HAVE_LOAD";
NSString *const kSupplyModelHAVEUNLOAD = @"HAVE_UNLOAD";
NSString *const kSupplyModelIDX = @"IDX";
NSString *const kSupplyModelISHANDLING = @"IS_HANDLING";
NSString *const kSupplyModelISRETURN = @"IS_RETURN";
NSString *const kSupplyModelISRETURNSTORE = @"IS_RETURN_STORE";
NSString *const kSupplyModelORGIDX = @"ORG_IDX";
NSString *const kSupplyModelORGNAME = @"ORG_NAME";
NSString *const kSupplyModelPLATENUMBER = @"PLATE_NUMBER";
NSString *const kSupplyModelRECEIVINGIDX = @"RECEIVING_IDX";
NSString *const kSupplyModelREFERENCE01 = @"REFERENCE01";
NSString *const kSupplyModelREFERENCE02 = @"REFERENCE02";
NSString *const kSupplyModelREFERENCE03 = @"REFERENCE03";
NSString *const kSupplyModelREFERENCE04 = @"REFERENCE04";
NSString *const kSupplyModelREFERENCE05 = @"REFERENCE05";
NSString *const kSupplyModelREFERENCE06 = @"REFERENCE06";
NSString *const kSupplyModelREFERENCE07 = @"REFERENCE07";
NSString *const kSupplyModelREFERENCE08 = @"REFERENCE08";
NSString *const kSupplyModelREFERENCE09 = @"REFERENCE09";
NSString *const kSupplyModelREFERENCE10 = @"REFERENCE10";
NSString *const kSupplyModelREQUESTISSUE = @"REQUEST_ISSUE";
NSString *const kSupplyModelREQUESTWAREHOUSE = @"REQUEST_WAREHOUSE";
NSString *const kSupplyModelROUTESCITY = @"ROUTES_CITY";
NSString *const kSupplyModelSHIPMENTDATEEND = @"SHIPMENT_DATE_END";
NSString *const kSupplyModelSHIPMENTDATESTRAT = @"SHIPMENT_DATE_STRAT";
NSString *const kSupplyModelSUPPLYNO = @"SUPPLY_NO";
NSString *const kSupplyModelSUPPLYSTATE = @"SUPPLY_STATE";
NSString *const kSupplyModelSUPPLYTYPE = @"SUPPLY_TYPE";
NSString *const kSupplyModelSUPPLYVEHICLESIZE = @"SUPPLY_VEHICLE_SIZE";
NSString *const kSupplyModelSUPPLYVEHICLETYPE = @"SUPPLY_VEHICLE_TYPE";
NSString *const kSupplyModelSUPPLYWOKERFLOW = @"SUPPLY_WOKERFLOW";
NSString *const kSupplyModelTASKDESCRIPTION = @"TASK_DESCRIPTION";
NSString *const kSupplyModelTASKDESCRIPTIONOTHER = @"TASK_DESCRIPTION_OTHER";
NSString *const kSupplyModelTMSIDX = @"TMS_IDX";
NSString *const kSupplyModelTMSSHIPMENTNO = @"TMS_SHIPMENT_NO";
NSString *const kSupplyModelTOTALAMOUNT = @"TOTAL_AMOUNT";
NSString *const kSupplyModelTOTALDROP = @"TOTAL_DROP";
NSString *const kSupplyModelTOTALQTY = @"TOTAL_QTY";
NSString *const kSupplyModelTOTALROUTES = @"TOTAL_ROUTES";
NSString *const kSupplyModelTOTALVOLUME = @"TOTAL_VOLUME";
NSString *const kSupplyModelTOTALWEIGHT = @"TOTAL_WEIGHT";
NSString *const kSupplyModelUSERNAME = @"USERNAME";
NSString *const kSupplyModelUSERTEL = @"USER_TEL";
NSString *const kSupplyModelVEHICLEIDX = @"VEHICLE_IDX";
NSString *const kSupplyModelVEHICLESIZE = @"VEHICLE_SIZE";
NSString *const kSupplyModelVEHICLETYPE = @"VEHICLE_TYPE";
NSString *const kSupplyModelVERSIONNUMBER = @"VERSION_NUMBER";


@implementation SupplyModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kSupplyModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kSupplyModelADDDATE];
    }
    if(![dictionary[kSupplyModelAPPUSERIDX] isKindOfClass:[NSNull class]]){
        self.aPPUSERIDX = dictionary[kSupplyModelAPPUSERIDX];
    }
    if(![dictionary[kSupplyModelBRANDMODEL] isKindOfClass:[NSNull class]]){
        self.bRANDMODEL = dictionary[kSupplyModelBRANDMODEL];
    }
    if(![dictionary[kSupplyModelDISTRIBUTIONEXPERIENCE] isKindOfClass:[NSNull class]]){
        self.dISTRIBUTIONEXPERIENCE = dictionary[kSupplyModelDISTRIBUTIONEXPERIENCE];
    }
    if(![dictionary[kSupplyModelDRIVERIDX] isKindOfClass:[NSNull class]]){
        self.dRIVERIDX = dictionary[kSupplyModelDRIVERIDX];
    }
    if(![dictionary[kSupplyModelDRIVERNAME] isKindOfClass:[NSNull class]]){
        self.dRIVERNAME = dictionary[kSupplyModelDRIVERNAME];
    }
    if(![dictionary[kSupplyModelDRIVERREQUEST] isKindOfClass:[NSNull class]]){
        self.dRIVERREQUEST = dictionary[kSupplyModelDRIVERREQUEST];
    }
    if(![dictionary[kSupplyModelDRIVERTEL] isKindOfClass:[NSNull class]]){
        self.dRIVERTEL = dictionary[kSupplyModelDRIVERTEL];
    }
    if(![dictionary[kSupplyModelEDITDATE] isKindOfClass:[NSNull class]]){
        self.eDITDATE = dictionary[kSupplyModelEDITDATE];
    }
    if(![dictionary[kSupplyModelFLEETIDX] isKindOfClass:[NSNull class]]){
        self.fLEETIDX = dictionary[kSupplyModelFLEETIDX];
    }
    if(![dictionary[kSupplyModelFLEETNAME] isKindOfClass:[NSNull class]]){
        self.fLEETNAME = dictionary[kSupplyModelFLEETNAME];
    }
    if(![dictionary[kSupplyModelHANDLINGDEGREE] isKindOfClass:[NSNull class]]){
        self.hANDLINGDEGREE = dictionary[kSupplyModelHANDLINGDEGREE];
    }
    if(![dictionary[kSupplyModelHAVELOAD] isKindOfClass:[NSNull class]]){
        self.hAVELOAD = dictionary[kSupplyModelHAVELOAD];
    }
    if(![dictionary[kSupplyModelHAVEUNLOAD] isKindOfClass:[NSNull class]]){
        self.hAVEUNLOAD = dictionary[kSupplyModelHAVEUNLOAD];
    }
    if(![dictionary[kSupplyModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kSupplyModelIDX];
    }
    if(![dictionary[kSupplyModelISHANDLING] isKindOfClass:[NSNull class]]){
        self.iSHANDLING = dictionary[kSupplyModelISHANDLING];
    }
    if(![dictionary[kSupplyModelISRETURN] isKindOfClass:[NSNull class]]){
        self.iSRETURN = dictionary[kSupplyModelISRETURN];
    }
    if(![dictionary[kSupplyModelISRETURNSTORE] isKindOfClass:[NSNull class]]){
        self.iSRETURNSTORE = dictionary[kSupplyModelISRETURNSTORE];
    }
    if(![dictionary[kSupplyModelORGIDX] isKindOfClass:[NSNull class]]){
        self.oRGIDX = dictionary[kSupplyModelORGIDX];
    }
    if(![dictionary[kSupplyModelORGNAME] isKindOfClass:[NSNull class]]){
        self.oRGNAME = dictionary[kSupplyModelORGNAME];
    }
    if(![dictionary[kSupplyModelPLATENUMBER] isKindOfClass:[NSNull class]]){
        self.pLATENUMBER = dictionary[kSupplyModelPLATENUMBER];
    }
    if(![dictionary[kSupplyModelRECEIVINGIDX] isKindOfClass:[NSNull class]]){
        self.rECEIVINGIDX = dictionary[kSupplyModelRECEIVINGIDX];
    }
    if(![dictionary[kSupplyModelREFERENCE01] isKindOfClass:[NSNull class]]){
        self.rEFERENCE01 = dictionary[kSupplyModelREFERENCE01];
    }
    if(![dictionary[kSupplyModelREFERENCE02] isKindOfClass:[NSNull class]]){
        self.rEFERENCE02 = dictionary[kSupplyModelREFERENCE02];
    }
    if(![dictionary[kSupplyModelREFERENCE03] isKindOfClass:[NSNull class]]){
        self.rEFERENCE03 = dictionary[kSupplyModelREFERENCE03];
    }
    if(![dictionary[kSupplyModelREFERENCE04] isKindOfClass:[NSNull class]]){
        self.rEFERENCE04 = dictionary[kSupplyModelREFERENCE04];
    }
    if(![dictionary[kSupplyModelREFERENCE05] isKindOfClass:[NSNull class]]){
        self.rEFERENCE05 = dictionary[kSupplyModelREFERENCE05];
    }
    if(![dictionary[kSupplyModelREFERENCE06] isKindOfClass:[NSNull class]]){
        self.rEFERENCE06 = dictionary[kSupplyModelREFERENCE06];
    }
    if(![dictionary[kSupplyModelREFERENCE07] isKindOfClass:[NSNull class]]){
        self.rEFERENCE07 = dictionary[kSupplyModelREFERENCE07];
    }
    if(![dictionary[kSupplyModelREFERENCE08] isKindOfClass:[NSNull class]]){
        self.rEFERENCE08 = dictionary[kSupplyModelREFERENCE08];
    }
    if(![dictionary[kSupplyModelREFERENCE09] isKindOfClass:[NSNull class]]){
        self.rEFERENCE09 = dictionary[kSupplyModelREFERENCE09];
    }
    if(![dictionary[kSupplyModelREFERENCE10] isKindOfClass:[NSNull class]]){
        self.rEFERENCE10 = dictionary[kSupplyModelREFERENCE10];
    }
    if(![dictionary[kSupplyModelREQUESTISSUE] isKindOfClass:[NSNull class]]){
        self.rEQUESTISSUE = dictionary[kSupplyModelREQUESTISSUE];
    }
    if(![dictionary[kSupplyModelREQUESTWAREHOUSE] isKindOfClass:[NSNull class]]){
        self.rEQUESTWAREHOUSE = dictionary[kSupplyModelREQUESTWAREHOUSE];
    }
    if(![dictionary[kSupplyModelROUTESCITY] isKindOfClass:[NSNull class]]){
        self.rOUTESCITY = dictionary[kSupplyModelROUTESCITY];
    }
    if(![dictionary[kSupplyModelSHIPMENTDATEEND] isKindOfClass:[NSNull class]]){
        self.sHIPMENTDATEEND = dictionary[kSupplyModelSHIPMENTDATEEND];
    }
    if(![dictionary[kSupplyModelSHIPMENTDATESTRAT] isKindOfClass:[NSNull class]]){
        self.sHIPMENTDATESTRAT = dictionary[kSupplyModelSHIPMENTDATESTRAT];
    }
    if(![dictionary[kSupplyModelSUPPLYNO] isKindOfClass:[NSNull class]]){
        self.sUPPLYNO = dictionary[kSupplyModelSUPPLYNO];
    }
    if(![dictionary[kSupplyModelSUPPLYSTATE] isKindOfClass:[NSNull class]]){
        self.sUPPLYSTATE = dictionary[kSupplyModelSUPPLYSTATE];
    }
    if(![dictionary[kSupplyModelSUPPLYTYPE] isKindOfClass:[NSNull class]]){
        self.sUPPLYTYPE = dictionary[kSupplyModelSUPPLYTYPE];
    }
    if(![dictionary[kSupplyModelSUPPLYVEHICLESIZE] isKindOfClass:[NSNull class]]){
        self.sUPPLYVEHICLESIZE = dictionary[kSupplyModelSUPPLYVEHICLESIZE];
    }
    if(![dictionary[kSupplyModelSUPPLYVEHICLETYPE] isKindOfClass:[NSNull class]]){
        self.sUPPLYVEHICLETYPE = dictionary[kSupplyModelSUPPLYVEHICLETYPE];
    }
    if(![dictionary[kSupplyModelSUPPLYWOKERFLOW] isKindOfClass:[NSNull class]]){
        self.sUPPLYWOKERFLOW = dictionary[kSupplyModelSUPPLYWOKERFLOW];
    }
    if(![dictionary[kSupplyModelTASKDESCRIPTION] isKindOfClass:[NSNull class]]){
        self.tASKDESCRIPTION = dictionary[kSupplyModelTASKDESCRIPTION];
    }
    if(![dictionary[kSupplyModelTASKDESCRIPTIONOTHER] isKindOfClass:[NSNull class]]){
        self.tASKDESCRIPTIONOTHER = dictionary[kSupplyModelTASKDESCRIPTIONOTHER];
    }
    if(![dictionary[kSupplyModelTMSIDX] isKindOfClass:[NSNull class]]){
        self.tMSIDX = dictionary[kSupplyModelTMSIDX];
    }
    if(![dictionary[kSupplyModelTMSSHIPMENTNO] isKindOfClass:[NSNull class]]){
        self.tMSSHIPMENTNO = dictionary[kSupplyModelTMSSHIPMENTNO];
    }
    if(![dictionary[kSupplyModelTOTALAMOUNT] isKindOfClass:[NSNull class]]){
        self.tOTALAMOUNT = dictionary[kSupplyModelTOTALAMOUNT];
    }
    if(![dictionary[kSupplyModelTOTALDROP] isKindOfClass:[NSNull class]]){
        self.tOTALDROP = dictionary[kSupplyModelTOTALDROP];
    }
    if(![dictionary[kSupplyModelTOTALQTY] isKindOfClass:[NSNull class]]){
        self.tOTALQTY = dictionary[kSupplyModelTOTALQTY];
    }
    if(![dictionary[kSupplyModelTOTALROUTES] isKindOfClass:[NSNull class]]){
        self.tOTALROUTES = dictionary[kSupplyModelTOTALROUTES];
    }
    if(![dictionary[kSupplyModelTOTALVOLUME] isKindOfClass:[NSNull class]]){
        self.tOTALVOLUME = dictionary[kSupplyModelTOTALVOLUME];
    }
    if(![dictionary[kSupplyModelTOTALWEIGHT] isKindOfClass:[NSNull class]]){
        self.tOTALWEIGHT = dictionary[kSupplyModelTOTALWEIGHT];
    }
    if(![dictionary[kSupplyModelUSERNAME] isKindOfClass:[NSNull class]]){
        self.uSERNAME = dictionary[kSupplyModelUSERNAME];
    }
    if(![dictionary[kSupplyModelUSERTEL] isKindOfClass:[NSNull class]]){
        self.uSERTEL = dictionary[kSupplyModelUSERTEL];
    }
    if(![dictionary[kSupplyModelVEHICLEIDX] isKindOfClass:[NSNull class]]){
        self.vEHICLEIDX = dictionary[kSupplyModelVEHICLEIDX];
    }
    if(![dictionary[kSupplyModelVEHICLESIZE] isKindOfClass:[NSNull class]]){
        self.vEHICLESIZE = dictionary[kSupplyModelVEHICLESIZE];
    }
    if(![dictionary[kSupplyModelVEHICLETYPE] isKindOfClass:[NSNull class]]){
        self.vEHICLETYPE = dictionary[kSupplyModelVEHICLETYPE];
    }
    if(![dictionary[kSupplyModelVERSIONNUMBER] isKindOfClass:[NSNull class]]){
        self.vERSIONNUMBER = dictionary[kSupplyModelVERSIONNUMBER];
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
        dictionary[kSupplyModelADDDATE] = self.aDDDATE;
    }
    if(self.aPPUSERIDX != nil){
        dictionary[kSupplyModelAPPUSERIDX] = self.aPPUSERIDX;
    }
    if(self.bRANDMODEL != nil){
        dictionary[kSupplyModelBRANDMODEL] = self.bRANDMODEL;
    }
    if(self.dISTRIBUTIONEXPERIENCE != nil){
        dictionary[kSupplyModelDISTRIBUTIONEXPERIENCE] = self.dISTRIBUTIONEXPERIENCE;
    }
    if(self.dRIVERIDX != nil){
        dictionary[kSupplyModelDRIVERIDX] = self.dRIVERIDX;
    }
    if(self.dRIVERNAME != nil){
        dictionary[kSupplyModelDRIVERNAME] = self.dRIVERNAME;
    }
    if(self.dRIVERREQUEST != nil){
        dictionary[kSupplyModelDRIVERREQUEST] = self.dRIVERREQUEST;
    }
    if(self.dRIVERTEL != nil){
        dictionary[kSupplyModelDRIVERTEL] = self.dRIVERTEL;
    }
    if(self.eDITDATE != nil){
        dictionary[kSupplyModelEDITDATE] = self.eDITDATE;
    }
    if(self.fLEETIDX != nil){
        dictionary[kSupplyModelFLEETIDX] = self.fLEETIDX;
    }
    if(self.fLEETNAME != nil){
        dictionary[kSupplyModelFLEETNAME] = self.fLEETNAME;
    }
    if(self.hANDLINGDEGREE != nil){
        dictionary[kSupplyModelHANDLINGDEGREE] = self.hANDLINGDEGREE;
    }
    if(self.hAVELOAD != nil){
        dictionary[kSupplyModelHAVELOAD] = self.hAVELOAD;
    }
    if(self.hAVEUNLOAD != nil){
        dictionary[kSupplyModelHAVEUNLOAD] = self.hAVEUNLOAD;
    }
    if(self.iDX != nil){
        dictionary[kSupplyModelIDX] = self.iDX;
    }
    if(self.iSHANDLING != nil){
        dictionary[kSupplyModelISHANDLING] = self.iSHANDLING;
    }
    if(self.iSRETURN != nil){
        dictionary[kSupplyModelISRETURN] = self.iSRETURN;
    }
    if(self.iSRETURNSTORE != nil){
        dictionary[kSupplyModelISRETURNSTORE] = self.iSRETURNSTORE;
    }
    if(self.oRGIDX != nil){
        dictionary[kSupplyModelORGIDX] = self.oRGIDX;
    }
    if(self.oRGNAME != nil){
        dictionary[kSupplyModelORGNAME] = self.oRGNAME;
    }
    if(self.pLATENUMBER != nil){
        dictionary[kSupplyModelPLATENUMBER] = self.pLATENUMBER;
    }
    if(self.rECEIVINGIDX != nil){
        dictionary[kSupplyModelRECEIVINGIDX] = self.rECEIVINGIDX;
    }
    if(self.rEFERENCE01 != nil){
        dictionary[kSupplyModelREFERENCE01] = self.rEFERENCE01;
    }
    if(self.rEFERENCE02 != nil){
        dictionary[kSupplyModelREFERENCE02] = self.rEFERENCE02;
    }
    if(self.rEFERENCE03 != nil){
        dictionary[kSupplyModelREFERENCE03] = self.rEFERENCE03;
    }
    if(self.rEFERENCE04 != nil){
        dictionary[kSupplyModelREFERENCE04] = self.rEFERENCE04;
    }
    if(self.rEFERENCE05 != nil){
        dictionary[kSupplyModelREFERENCE05] = self.rEFERENCE05;
    }
    if(self.rEFERENCE06 != nil){
        dictionary[kSupplyModelREFERENCE06] = self.rEFERENCE06;
    }
    if(self.rEFERENCE07 != nil){
        dictionary[kSupplyModelREFERENCE07] = self.rEFERENCE07;
    }
    if(self.rEFERENCE08 != nil){
        dictionary[kSupplyModelREFERENCE08] = self.rEFERENCE08;
    }
    if(self.rEFERENCE09 != nil){
        dictionary[kSupplyModelREFERENCE09] = self.rEFERENCE09;
    }
    if(self.rEFERENCE10 != nil){
        dictionary[kSupplyModelREFERENCE10] = self.rEFERENCE10;
    }
    if(self.rEQUESTISSUE != nil){
        dictionary[kSupplyModelREQUESTISSUE] = self.rEQUESTISSUE;
    }
    if(self.rEQUESTWAREHOUSE != nil){
        dictionary[kSupplyModelREQUESTWAREHOUSE] = self.rEQUESTWAREHOUSE;
    }
    if(self.rOUTESCITY != nil){
        dictionary[kSupplyModelROUTESCITY] = self.rOUTESCITY;
    }
    if(self.sHIPMENTDATEEND != nil){
        dictionary[kSupplyModelSHIPMENTDATEEND] = self.sHIPMENTDATEEND;
    }
    if(self.sHIPMENTDATESTRAT != nil){
        dictionary[kSupplyModelSHIPMENTDATESTRAT] = self.sHIPMENTDATESTRAT;
    }
    if(self.sUPPLYNO != nil){
        dictionary[kSupplyModelSUPPLYNO] = self.sUPPLYNO;
    }
    if(self.sUPPLYSTATE != nil){
        dictionary[kSupplyModelSUPPLYSTATE] = self.sUPPLYSTATE;
    }
    if(self.sUPPLYTYPE != nil){
        dictionary[kSupplyModelSUPPLYTYPE] = self.sUPPLYTYPE;
    }
    if(self.sUPPLYVEHICLESIZE != nil){
        dictionary[kSupplyModelSUPPLYVEHICLESIZE] = self.sUPPLYVEHICLESIZE;
    }
    if(self.sUPPLYVEHICLETYPE != nil){
        dictionary[kSupplyModelSUPPLYVEHICLETYPE] = self.sUPPLYVEHICLETYPE;
    }
    if(self.sUPPLYWOKERFLOW != nil){
        dictionary[kSupplyModelSUPPLYWOKERFLOW] = self.sUPPLYWOKERFLOW;
    }
    if(self.tASKDESCRIPTION != nil){
        dictionary[kSupplyModelTASKDESCRIPTION] = self.tASKDESCRIPTION;
    }
    if(self.tASKDESCRIPTIONOTHER != nil){
        dictionary[kSupplyModelTASKDESCRIPTIONOTHER] = self.tASKDESCRIPTIONOTHER;
    }
    if(self.tMSIDX != nil){
        dictionary[kSupplyModelTMSIDX] = self.tMSIDX;
    }
    if(self.tMSSHIPMENTNO != nil){
        dictionary[kSupplyModelTMSSHIPMENTNO] = self.tMSSHIPMENTNO;
    }
    if(self.tOTALAMOUNT != nil){
        dictionary[kSupplyModelTOTALAMOUNT] = self.tOTALAMOUNT;
    }
    if(self.tOTALDROP != nil){
        dictionary[kSupplyModelTOTALDROP] = self.tOTALDROP;
    }
    if(self.tOTALQTY != nil){
        dictionary[kSupplyModelTOTALQTY] = self.tOTALQTY;
    }
    if(self.tOTALROUTES != nil){
        dictionary[kSupplyModelTOTALROUTES] = self.tOTALROUTES;
    }
    if(self.tOTALVOLUME != nil){
        dictionary[kSupplyModelTOTALVOLUME] = self.tOTALVOLUME;
    }
    if(self.tOTALWEIGHT != nil){
        dictionary[kSupplyModelTOTALWEIGHT] = self.tOTALWEIGHT;
    }
    if(self.uSERNAME != nil){
        dictionary[kSupplyModelUSERNAME] = self.uSERNAME;
    }
    if(self.uSERTEL != nil){
        dictionary[kSupplyModelUSERTEL] = self.uSERTEL;
    }
    if(self.vEHICLEIDX != nil){
        dictionary[kSupplyModelVEHICLEIDX] = self.vEHICLEIDX;
    }
    if(self.vEHICLESIZE != nil){
        dictionary[kSupplyModelVEHICLESIZE] = self.vEHICLESIZE;
    }
    if(self.vEHICLETYPE != nil){
        dictionary[kSupplyModelVEHICLETYPE] = self.vEHICLETYPE;
    }
    if(self.vERSIONNUMBER != nil){
        dictionary[kSupplyModelVERSIONNUMBER] = self.vERSIONNUMBER;
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
        [aCoder encodeObject:self.aDDDATE forKey:kSupplyModelADDDATE];
    }
    if(self.aPPUSERIDX != nil){
        [aCoder encodeObject:self.aPPUSERIDX forKey:kSupplyModelAPPUSERIDX];
    }
    if(self.bRANDMODEL != nil){
        [aCoder encodeObject:self.bRANDMODEL forKey:kSupplyModelBRANDMODEL];
    }
    if(self.dISTRIBUTIONEXPERIENCE != nil){
        [aCoder encodeObject:self.dISTRIBUTIONEXPERIENCE forKey:kSupplyModelDISTRIBUTIONEXPERIENCE];
    }
    if(self.dRIVERIDX != nil){
        [aCoder encodeObject:self.dRIVERIDX forKey:kSupplyModelDRIVERIDX];
    }
    if(self.dRIVERNAME != nil){
        [aCoder encodeObject:self.dRIVERNAME forKey:kSupplyModelDRIVERNAME];
    }
    if(self.dRIVERREQUEST != nil){
        [aCoder encodeObject:self.dRIVERREQUEST forKey:kSupplyModelDRIVERREQUEST];
    }
    if(self.dRIVERTEL != nil){
        [aCoder encodeObject:self.dRIVERTEL forKey:kSupplyModelDRIVERTEL];
    }
    if(self.eDITDATE != nil){
        [aCoder encodeObject:self.eDITDATE forKey:kSupplyModelEDITDATE];
    }
    if(self.fLEETIDX != nil){
        [aCoder encodeObject:self.fLEETIDX forKey:kSupplyModelFLEETIDX];
    }
    if(self.fLEETNAME != nil){
        [aCoder encodeObject:self.fLEETNAME forKey:kSupplyModelFLEETNAME];
    }
    if(self.hANDLINGDEGREE != nil){
        [aCoder encodeObject:self.hANDLINGDEGREE forKey:kSupplyModelHANDLINGDEGREE];
    }
    if(self.hAVELOAD != nil){
        [aCoder encodeObject:self.hAVELOAD forKey:kSupplyModelHAVELOAD];
    }
    if(self.hAVEUNLOAD != nil){
        [aCoder encodeObject:self.hAVEUNLOAD forKey:kSupplyModelHAVEUNLOAD];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kSupplyModelIDX];
    }
    if(self.iSHANDLING != nil){
        [aCoder encodeObject:self.iSHANDLING forKey:kSupplyModelISHANDLING];
    }
    if(self.iSRETURN != nil){
        [aCoder encodeObject:self.iSRETURN forKey:kSupplyModelISRETURN];
    }
    if(self.iSRETURNSTORE != nil){
        [aCoder encodeObject:self.iSRETURNSTORE forKey:kSupplyModelISRETURNSTORE];
    }
    if(self.oRGIDX != nil){
        [aCoder encodeObject:self.oRGIDX forKey:kSupplyModelORGIDX];
    }
    if(self.oRGNAME != nil){
        [aCoder encodeObject:self.oRGNAME forKey:kSupplyModelORGNAME];
    }
    if(self.pLATENUMBER != nil){
        [aCoder encodeObject:self.pLATENUMBER forKey:kSupplyModelPLATENUMBER];
    }
    if(self.rECEIVINGIDX != nil){
        [aCoder encodeObject:self.rECEIVINGIDX forKey:kSupplyModelRECEIVINGIDX];
    }
    if(self.rEFERENCE01 != nil){
        [aCoder encodeObject:self.rEFERENCE01 forKey:kSupplyModelREFERENCE01];
    }
    if(self.rEFERENCE02 != nil){
        [aCoder encodeObject:self.rEFERENCE02 forKey:kSupplyModelREFERENCE02];
    }
    if(self.rEFERENCE03 != nil){
        [aCoder encodeObject:self.rEFERENCE03 forKey:kSupplyModelREFERENCE03];
    }
    if(self.rEFERENCE04 != nil){
        [aCoder encodeObject:self.rEFERENCE04 forKey:kSupplyModelREFERENCE04];
    }
    if(self.rEFERENCE05 != nil){
        [aCoder encodeObject:self.rEFERENCE05 forKey:kSupplyModelREFERENCE05];
    }
    if(self.rEFERENCE06 != nil){
        [aCoder encodeObject:self.rEFERENCE06 forKey:kSupplyModelREFERENCE06];
    }
    if(self.rEFERENCE07 != nil){
        [aCoder encodeObject:self.rEFERENCE07 forKey:kSupplyModelREFERENCE07];
    }
    if(self.rEFERENCE08 != nil){
        [aCoder encodeObject:self.rEFERENCE08 forKey:kSupplyModelREFERENCE08];
    }
    if(self.rEFERENCE09 != nil){
        [aCoder encodeObject:self.rEFERENCE09 forKey:kSupplyModelREFERENCE09];
    }
    if(self.rEFERENCE10 != nil){
        [aCoder encodeObject:self.rEFERENCE10 forKey:kSupplyModelREFERENCE10];
    }
    if(self.rEQUESTISSUE != nil){
        [aCoder encodeObject:self.rEQUESTISSUE forKey:kSupplyModelREQUESTISSUE];
    }
    if(self.rEQUESTWAREHOUSE != nil){
        [aCoder encodeObject:self.rEQUESTWAREHOUSE forKey:kSupplyModelREQUESTWAREHOUSE];
    }
    if(self.rOUTESCITY != nil){
        [aCoder encodeObject:self.rOUTESCITY forKey:kSupplyModelROUTESCITY];
    }
    if(self.sHIPMENTDATEEND != nil){
        [aCoder encodeObject:self.sHIPMENTDATEEND forKey:kSupplyModelSHIPMENTDATEEND];
    }
    if(self.sHIPMENTDATESTRAT != nil){
        [aCoder encodeObject:self.sHIPMENTDATESTRAT forKey:kSupplyModelSHIPMENTDATESTRAT];
    }
    if(self.sUPPLYNO != nil){
        [aCoder encodeObject:self.sUPPLYNO forKey:kSupplyModelSUPPLYNO];
    }
    if(self.sUPPLYSTATE != nil){
        [aCoder encodeObject:self.sUPPLYSTATE forKey:kSupplyModelSUPPLYSTATE];
    }
    if(self.sUPPLYTYPE != nil){
        [aCoder encodeObject:self.sUPPLYTYPE forKey:kSupplyModelSUPPLYTYPE];
    }
    if(self.sUPPLYVEHICLESIZE != nil){
        [aCoder encodeObject:self.sUPPLYVEHICLESIZE forKey:kSupplyModelSUPPLYVEHICLESIZE];
    }
    if(self.sUPPLYVEHICLETYPE != nil){
        [aCoder encodeObject:self.sUPPLYVEHICLETYPE forKey:kSupplyModelSUPPLYVEHICLETYPE];
    }
    if(self.sUPPLYWOKERFLOW != nil){
        [aCoder encodeObject:self.sUPPLYWOKERFLOW forKey:kSupplyModelSUPPLYWOKERFLOW];
    }
    if(self.tASKDESCRIPTION != nil){
        [aCoder encodeObject:self.tASKDESCRIPTION forKey:kSupplyModelTASKDESCRIPTION];
    }
    if(self.tASKDESCRIPTIONOTHER != nil){
        [aCoder encodeObject:self.tASKDESCRIPTIONOTHER forKey:kSupplyModelTASKDESCRIPTIONOTHER];
    }
    if(self.tMSIDX != nil){
        [aCoder encodeObject:self.tMSIDX forKey:kSupplyModelTMSIDX];
    }
    if(self.tMSSHIPMENTNO != nil){
        [aCoder encodeObject:self.tMSSHIPMENTNO forKey:kSupplyModelTMSSHIPMENTNO];
    }
    if(self.tOTALAMOUNT != nil){
        [aCoder encodeObject:self.tOTALAMOUNT forKey:kSupplyModelTOTALAMOUNT];
    }
    if(self.tOTALDROP != nil){
        [aCoder encodeObject:self.tOTALDROP forKey:kSupplyModelTOTALDROP];
    }
    if(self.tOTALQTY != nil){
        [aCoder encodeObject:self.tOTALQTY forKey:kSupplyModelTOTALQTY];
    }
    if(self.tOTALROUTES != nil){
        [aCoder encodeObject:self.tOTALROUTES forKey:kSupplyModelTOTALROUTES];
    }
    if(self.tOTALVOLUME != nil){
        [aCoder encodeObject:self.tOTALVOLUME forKey:kSupplyModelTOTALVOLUME];
    }
    if(self.tOTALWEIGHT != nil){
        [aCoder encodeObject:self.tOTALWEIGHT forKey:kSupplyModelTOTALWEIGHT];
    }
    if(self.uSERNAME != nil){
        [aCoder encodeObject:self.uSERNAME forKey:kSupplyModelUSERNAME];
    }
    if(self.uSERTEL != nil){
        [aCoder encodeObject:self.uSERTEL forKey:kSupplyModelUSERTEL];
    }
    if(self.vEHICLEIDX != nil){
        [aCoder encodeObject:self.vEHICLEIDX forKey:kSupplyModelVEHICLEIDX];
    }
    if(self.vEHICLESIZE != nil){
        [aCoder encodeObject:self.vEHICLESIZE forKey:kSupplyModelVEHICLESIZE];
    }
    if(self.vEHICLETYPE != nil){
        [aCoder encodeObject:self.vEHICLETYPE forKey:kSupplyModelVEHICLETYPE];
    }
    if(self.vERSIONNUMBER != nil){
        [aCoder encodeObject:self.vERSIONNUMBER forKey:kSupplyModelVERSIONNUMBER];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDDATE = [aDecoder decodeObjectForKey:kSupplyModelADDDATE];
    self.aPPUSERIDX = [aDecoder decodeObjectForKey:kSupplyModelAPPUSERIDX];
    self.bRANDMODEL = [aDecoder decodeObjectForKey:kSupplyModelBRANDMODEL];
    self.dISTRIBUTIONEXPERIENCE = [aDecoder decodeObjectForKey:kSupplyModelDISTRIBUTIONEXPERIENCE];
    self.dRIVERIDX = [aDecoder decodeObjectForKey:kSupplyModelDRIVERIDX];
    self.dRIVERNAME = [aDecoder decodeObjectForKey:kSupplyModelDRIVERNAME];
    self.dRIVERREQUEST = [aDecoder decodeObjectForKey:kSupplyModelDRIVERREQUEST];
    self.dRIVERTEL = [aDecoder decodeObjectForKey:kSupplyModelDRIVERTEL];
    self.eDITDATE = [aDecoder decodeObjectForKey:kSupplyModelEDITDATE];
    self.fLEETIDX = [aDecoder decodeObjectForKey:kSupplyModelFLEETIDX];
    self.fLEETNAME = [aDecoder decodeObjectForKey:kSupplyModelFLEETNAME];
    self.hANDLINGDEGREE = [aDecoder decodeObjectForKey:kSupplyModelHANDLINGDEGREE];
    self.hAVELOAD = [aDecoder decodeObjectForKey:kSupplyModelHAVELOAD];
    self.hAVEUNLOAD = [aDecoder decodeObjectForKey:kSupplyModelHAVEUNLOAD];
    self.iDX = [aDecoder decodeObjectForKey:kSupplyModelIDX];
    self.iSHANDLING = [aDecoder decodeObjectForKey:kSupplyModelISHANDLING];
    self.iSRETURN = [aDecoder decodeObjectForKey:kSupplyModelISRETURN];
    self.iSRETURNSTORE = [aDecoder decodeObjectForKey:kSupplyModelISRETURNSTORE];
    self.oRGIDX = [aDecoder decodeObjectForKey:kSupplyModelORGIDX];
    self.oRGNAME = [aDecoder decodeObjectForKey:kSupplyModelORGNAME];
    self.pLATENUMBER = [aDecoder decodeObjectForKey:kSupplyModelPLATENUMBER];
    self.rECEIVINGIDX = [aDecoder decodeObjectForKey:kSupplyModelRECEIVINGIDX];
    self.rEFERENCE01 = [aDecoder decodeObjectForKey:kSupplyModelREFERENCE01];
    self.rEFERENCE02 = [aDecoder decodeObjectForKey:kSupplyModelREFERENCE02];
    self.rEFERENCE03 = [aDecoder decodeObjectForKey:kSupplyModelREFERENCE03];
    self.rEFERENCE04 = [aDecoder decodeObjectForKey:kSupplyModelREFERENCE04];
    self.rEFERENCE05 = [aDecoder decodeObjectForKey:kSupplyModelREFERENCE05];
    self.rEFERENCE06 = [aDecoder decodeObjectForKey:kSupplyModelREFERENCE06];
    self.rEFERENCE07 = [aDecoder decodeObjectForKey:kSupplyModelREFERENCE07];
    self.rEFERENCE08 = [aDecoder decodeObjectForKey:kSupplyModelREFERENCE08];
    self.rEFERENCE09 = [aDecoder decodeObjectForKey:kSupplyModelREFERENCE09];
    self.rEFERENCE10 = [aDecoder decodeObjectForKey:kSupplyModelREFERENCE10];
    self.rEQUESTISSUE = [aDecoder decodeObjectForKey:kSupplyModelREQUESTISSUE];
    self.rEQUESTWAREHOUSE = [aDecoder decodeObjectForKey:kSupplyModelREQUESTWAREHOUSE];
    self.rOUTESCITY = [aDecoder decodeObjectForKey:kSupplyModelROUTESCITY];
    self.sHIPMENTDATEEND = [aDecoder decodeObjectForKey:kSupplyModelSHIPMENTDATEEND];
    self.sHIPMENTDATESTRAT = [aDecoder decodeObjectForKey:kSupplyModelSHIPMENTDATESTRAT];
    self.sUPPLYNO = [aDecoder decodeObjectForKey:kSupplyModelSUPPLYNO];
    self.sUPPLYSTATE = [aDecoder decodeObjectForKey:kSupplyModelSUPPLYSTATE];
    self.sUPPLYTYPE = [aDecoder decodeObjectForKey:kSupplyModelSUPPLYTYPE];
    self.sUPPLYVEHICLESIZE = [aDecoder decodeObjectForKey:kSupplyModelSUPPLYVEHICLESIZE];
    self.sUPPLYVEHICLETYPE = [aDecoder decodeObjectForKey:kSupplyModelSUPPLYVEHICLETYPE];
    self.sUPPLYWOKERFLOW = [aDecoder decodeObjectForKey:kSupplyModelSUPPLYWOKERFLOW];
    self.tASKDESCRIPTION = [aDecoder decodeObjectForKey:kSupplyModelTASKDESCRIPTION];
    self.tASKDESCRIPTIONOTHER = [aDecoder decodeObjectForKey:kSupplyModelTASKDESCRIPTIONOTHER];
    self.tMSIDX = [aDecoder decodeObjectForKey:kSupplyModelTMSIDX];
    self.tMSSHIPMENTNO = [aDecoder decodeObjectForKey:kSupplyModelTMSSHIPMENTNO];
    self.tOTALAMOUNT = [aDecoder decodeObjectForKey:kSupplyModelTOTALAMOUNT];
    self.tOTALDROP = [aDecoder decodeObjectForKey:kSupplyModelTOTALDROP];
    self.tOTALQTY = [aDecoder decodeObjectForKey:kSupplyModelTOTALQTY];
    self.tOTALROUTES = [aDecoder decodeObjectForKey:kSupplyModelTOTALROUTES];
    self.tOTALVOLUME = [aDecoder decodeObjectForKey:kSupplyModelTOTALVOLUME];
    self.tOTALWEIGHT = [aDecoder decodeObjectForKey:kSupplyModelTOTALWEIGHT];
    self.uSERNAME = [aDecoder decodeObjectForKey:kSupplyModelUSERNAME];
    self.uSERTEL = [aDecoder decodeObjectForKey:kSupplyModelUSERTEL];
    self.vEHICLEIDX = [aDecoder decodeObjectForKey:kSupplyModelVEHICLEIDX];
    self.vEHICLESIZE = [aDecoder decodeObjectForKey:kSupplyModelVEHICLESIZE];
    self.vEHICLETYPE = [aDecoder decodeObjectForKey:kSupplyModelVEHICLETYPE];
    self.vERSIONNUMBER = [aDecoder decodeObjectForKey:kSupplyModelVERSIONNUMBER];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    SupplyModel *copy = [SupplyModel new];
    
    copy.aDDDATE = [self.aDDDATE copy];
    copy.aPPUSERIDX = [self.aPPUSERIDX copy];
    copy.bRANDMODEL = [self.bRANDMODEL copy];
    copy.dISTRIBUTIONEXPERIENCE = [self.dISTRIBUTIONEXPERIENCE copy];
    copy.dRIVERIDX = [self.dRIVERIDX copy];
    copy.dRIVERNAME = [self.dRIVERNAME copy];
    copy.dRIVERREQUEST = [self.dRIVERREQUEST copy];
    copy.dRIVERTEL = [self.dRIVERTEL copy];
    copy.eDITDATE = [self.eDITDATE copy];
    copy.fLEETIDX = [self.fLEETIDX copy];
    copy.fLEETNAME = [self.fLEETNAME copy];
    copy.hANDLINGDEGREE = [self.hANDLINGDEGREE copy];
    copy.hAVELOAD = [self.hAVELOAD copy];
    copy.hAVEUNLOAD = [self.hAVEUNLOAD copy];
    copy.iDX = [self.iDX copy];
    copy.iSHANDLING = [self.iSHANDLING copy];
    copy.iSRETURN = [self.iSRETURN copy];
    copy.iSRETURNSTORE = [self.iSRETURNSTORE copy];
    copy.oRGIDX = [self.oRGIDX copy];
    copy.oRGNAME = [self.oRGNAME copy];
    copy.pLATENUMBER = [self.pLATENUMBER copy];
    copy.rECEIVINGIDX = [self.rECEIVINGIDX copy];
    copy.rEFERENCE01 = [self.rEFERENCE01 copy];
    copy.rEFERENCE02 = [self.rEFERENCE02 copy];
    copy.rEFERENCE03 = [self.rEFERENCE03 copy];
    copy.rEFERENCE04 = [self.rEFERENCE04 copy];
    copy.rEFERENCE05 = [self.rEFERENCE05 copy];
    copy.rEFERENCE06 = [self.rEFERENCE06 copy];
    copy.rEFERENCE07 = [self.rEFERENCE07 copy];
    copy.rEFERENCE08 = [self.rEFERENCE08 copy];
    copy.rEFERENCE09 = [self.rEFERENCE09 copy];
    copy.rEFERENCE10 = [self.rEFERENCE10 copy];
    copy.rEQUESTISSUE = [self.rEQUESTISSUE copy];
    copy.rEQUESTWAREHOUSE = [self.rEQUESTWAREHOUSE copy];
    copy.rOUTESCITY = [self.rOUTESCITY copy];
    copy.sHIPMENTDATEEND = [self.sHIPMENTDATEEND copy];
    copy.sHIPMENTDATESTRAT = [self.sHIPMENTDATESTRAT copy];
    copy.sUPPLYNO = [self.sUPPLYNO copy];
    copy.sUPPLYSTATE = [self.sUPPLYSTATE copy];
    copy.sUPPLYTYPE = [self.sUPPLYTYPE copy];
    copy.sUPPLYVEHICLESIZE = [self.sUPPLYVEHICLESIZE copy];
    copy.sUPPLYVEHICLETYPE = [self.sUPPLYVEHICLETYPE copy];
    copy.sUPPLYWOKERFLOW = [self.sUPPLYWOKERFLOW copy];
    copy.tASKDESCRIPTION = [self.tASKDESCRIPTION copy];
    copy.tASKDESCRIPTIONOTHER = [self.tASKDESCRIPTIONOTHER copy];
    copy.tMSIDX = [self.tMSIDX copy];
    copy.tMSSHIPMENTNO = [self.tMSSHIPMENTNO copy];
    copy.tOTALAMOUNT = [self.tOTALAMOUNT copy];
    copy.tOTALDROP = [self.tOTALDROP copy];
    copy.tOTALQTY = [self.tOTALQTY copy];
    copy.tOTALROUTES = [self.tOTALROUTES copy];
    copy.tOTALVOLUME = [self.tOTALVOLUME copy];
    copy.tOTALWEIGHT = [self.tOTALWEIGHT copy];
    copy.uSERNAME = [self.uSERNAME copy];
    copy.uSERTEL = [self.uSERTEL copy];
    copy.vEHICLEIDX = [self.vEHICLEIDX copy];
    copy.vEHICLESIZE = [self.vEHICLESIZE copy];
    copy.vEHICLETYPE = [self.vEHICLETYPE copy];
    copy.vERSIONNUMBER = [self.vERSIONNUMBER copy];
    
    return copy;
}

@end
