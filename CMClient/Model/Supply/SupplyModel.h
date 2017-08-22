//
//  SupplyModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SupplyModel : NSObject

@property (nonatomic, strong) NSString * aDDDATE;
@property (nonatomic, strong) NSString * aPPUSERIDX;
@property (nonatomic, strong) NSString * bRANDMODEL;
@property (nonatomic, strong) NSString * dISTRIBUTIONEXPERIENCE;
@property (nonatomic, strong) NSString * dRIVERIDX;
@property (nonatomic, strong) NSString * dRIVERNAME;
@property (nonatomic, strong) NSString * dRIVERREQUEST;
@property (nonatomic, strong) NSString * dRIVERTEL;
@property (nonatomic, strong) NSString * eDITDATE;
@property (nonatomic, strong) NSString * fLEETIDX;
@property (nonatomic, strong) NSString * fLEETNAME;
@property (nonatomic, strong) NSString * hANDLINGDEGREE;
@property (nonatomic, strong) NSString * hAVELOAD;
@property (nonatomic, strong) NSString * hAVEUNLOAD;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * iSHANDLING;
@property (nonatomic, strong) NSString * iSRETURN;
@property (nonatomic, strong) NSString * iSRETURNSTORE;
@property (nonatomic, strong) NSString * oRGIDX;
@property (nonatomic, strong) NSString * oRGNAME;
@property (nonatomic, strong) NSString * pLATENUMBER;
@property (nonatomic, strong) NSString * rECEIVINGIDX;
@property (nonatomic, strong) NSString * rEFERENCE01;
@property (nonatomic, strong) NSString * rEFERENCE02;
@property (nonatomic, strong) NSString * rEFERENCE03;
@property (nonatomic, strong) NSString * rEFERENCE04;
@property (nonatomic, strong) NSString * rEFERENCE05;
@property (nonatomic, strong) NSString * rEFERENCE06;
@property (nonatomic, strong) NSString * rEFERENCE07;
@property (nonatomic, strong) NSString * rEFERENCE08;
@property (nonatomic, strong) NSString * rEFERENCE09;
@property (nonatomic, strong) NSString * rEFERENCE10;
@property (nonatomic, strong) NSString * rEQUESTISSUE;
@property (nonatomic, strong) NSString * rEQUESTWAREHOUSE;
@property (nonatomic, strong) NSString * rOUTESCITY;
@property (nonatomic, strong) NSString * sHIPMENTDATEEND;
@property (nonatomic, strong) NSString * sHIPMENTDATESTRAT;
@property (nonatomic, strong) NSString * sUPPLYNO;
@property (nonatomic, strong) NSString * sUPPLYSTATE;
@property (nonatomic, strong) NSString * sUPPLYTYPE;
@property (nonatomic, strong) NSString * sUPPLYVEHICLESIZE;
@property (nonatomic, strong) NSString * sUPPLYVEHICLETYPE;
@property (nonatomic, strong) NSString * sUPPLYWOKERFLOW;
@property (nonatomic, strong) NSString * tASKDESCRIPTION;
@property (nonatomic, strong) NSString * tASKDESCRIPTIONOTHER;
@property (nonatomic, strong) NSString * tMSIDX;
@property (nonatomic, strong) NSString * tMSSHIPMENTNO;
@property (nonatomic, strong) NSString * tOTALAMOUNT;
@property (nonatomic, strong) NSString * tOTALDROP;
@property (nonatomic, strong) NSString * tOTALQTY;
@property (nonatomic, strong) NSString * tOTALROUTES;
@property (nonatomic, strong) NSString * tOTALVOLUME;
@property (nonatomic, strong) NSString * tOTALWEIGHT;
@property (nonatomic, strong) NSString * uSERNAME;
@property (nonatomic, strong) NSString * uSERTEL;
@property (nonatomic, strong) NSString * vEHICLEIDX;
@property (nonatomic, strong) NSString * vEHICLESIZE;
@property (nonatomic, strong) NSString * vEHICLETYPE;
@property (nonatomic, strong) NSString * vERSIONNUMBER;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
