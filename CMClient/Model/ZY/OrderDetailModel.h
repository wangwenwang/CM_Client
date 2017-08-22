//
//  OrderDetailModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>


/// json在  OrderInfoModel.h

/// 订单详细
@interface OrderDetailModel : NSObject

@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * oMSREMARKAUDIT;
@property (nonatomic, strong) NSString * oRDDATEADD;
@property (nonatomic, strong) NSString * oRDDATEEDIT;
@property (nonatomic, strong) NSString * oRDFROMADDRESS;
@property (nonatomic, strong) NSString * oRDFROMCNAME;
@property (nonatomic, strong) NSString * oRDFROMCTEL;
@property (nonatomic, strong) NSString * oRDFROMNAME;
@property (nonatomic, strong) NSString * oRDISSUEQTY;
@property (nonatomic, strong) NSString * oRDISSUEVOLUME;
@property (nonatomic, strong) NSString * oRDISSUEWEIGHT;
@property (nonatomic, strong) NSString * oRDNO;
@property (nonatomic, strong) NSString * oRDNOCLIENT;
@property (nonatomic, strong) NSString * oRDNOCONSIGNEE;
@property (nonatomic, strong) NSString * oRDPROJECTEDDELIVERY;
@property (nonatomic, strong) NSString * oRDREMARKCLIENT;
@property (nonatomic, strong) NSString * oRDREMARKCONSIGNEE;
@property (nonatomic, strong) NSString * oRDREQUESTDELIVERY;
@property (nonatomic, strong) NSString * oRDREQUESTISSUE;
@property (nonatomic, strong) NSString * oRDTOADDRESS;
@property (nonatomic, strong) NSString * oRDTOCNAME;
@property (nonatomic, strong) NSString * oRDTOCTEL;
@property (nonatomic, strong) NSString * oRDTONAME;
@property (nonatomic, strong) NSString * oRDTYPECLIENT;
@property (nonatomic, strong) NSString * oRDVEHICLESIZE;
@property (nonatomic, strong) NSString * oRDVEHICLETYPE;
@property (nonatomic, strong) NSString * oTSDELIVERYACTUAL;
@property (nonatomic, strong) NSString * oTSDELIVERYNOTICE;
@property (nonatomic, strong) NSString * oTSREMARKDELIVERY;
@property (nonatomic, strong) NSString * oTSREMARKRETURN;
@property (nonatomic, strong) NSString * oTSRETURNDATE;
@property (nonatomic, strong) NSString * tMSORDNO;
@property (nonatomic, strong) NSString * uPDATE03;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
