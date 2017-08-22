//
//  ShipmentModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/7.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>


/// json在  ShipmentInfoModel.h


/// 装运信息
@interface ShipmentModel : NSObject


@property (nonatomic, strong) NSString * aUDITFLAG;
@property (nonatomic, strong) NSString * dATEADD;
@property (nonatomic, strong) NSString * dATECONFIRMED;
@property (nonatomic, strong) NSString * dATEEDIT;
@property (nonatomic, strong) NSString * dATEISSUE;
@property (nonatomic, strong) NSString * dATELOAD;
@property (nonatomic, strong) NSString * dRIVERIDX;
@property (nonatomic, strong) NSString * dRIVERNAME;
@property (nonatomic, strong) NSString * dRIVERTEL;
@property (nonatomic, strong) NSString * fLEETIDX;
@property (nonatomic, strong) NSString * fLEETNAME;
@property (nonatomic, strong) NSString * fROMCITY;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * oRGIDX;
@property (nonatomic, strong) NSString * oRGNAME;
@property (nonatomic, strong) NSString * pLATENUMBER;
@property (nonatomic, strong) NSString * rEFERENCE01;
@property (nonatomic, strong) NSString * rEFERENCE02;
@property (nonatomic, strong) NSString * rEFERENCE03;
@property (nonatomic, strong) NSString * rEFERENCE04;
@property (nonatomic, strong) NSString * rEFERENCE05;
@property (nonatomic, strong) NSString * rEFERENCE06;
@property (nonatomic, strong) NSString * sHIPMENTNO;
@property (nonatomic, strong) NSString * sHIPMENTSTATE;
@property (nonatomic, strong) NSString * sUPPLYIDX;
@property (nonatomic, strong) NSString * tMSIDX;
@property (nonatomic, strong) NSString * tMSSHIPMENTNO;
@property (nonatomic, strong) NSString * tOTALVOLUME;
@property (nonatomic, strong) NSString * tOTALWEIGHT;
@property (nonatomic, strong) NSString * tOCITY;
@property (nonatomic, strong) NSString * uSERNAME;
@property (nonatomic, strong) NSString * vEHICLEIDX;
@property (nonatomic, strong) NSString * vEHICLESIZE;
@property (nonatomic, strong) NSString * vEHICLETYPE;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;


@end
