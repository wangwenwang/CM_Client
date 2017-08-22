//
//  OrderModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/7.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>


/// json在  ShipmentInfoModel.h

/// 订单简介
@interface OrderModel : NSObject


@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * oRDFROMADDRESS;
@property (nonatomic, strong) NSString * oRDFROMCNAME;
@property (nonatomic, strong) NSString * oRDFROMCTEL;
@property (nonatomic, strong) NSString * oRDFROMNAME;
@property (nonatomic, strong) NSString * oRDISSUEQTY;
@property (nonatomic, strong) NSString * oRDISSUEVOLUME;
@property (nonatomic, strong) NSString * oRDISSUEWEIGHT;
@property (nonatomic, strong) NSString * oRDNO;
@property (nonatomic, strong) NSString * oRDNOCLIENT;
@property (nonatomic, strong) NSString * oRDTOADDRESS;
@property (nonatomic, strong) NSString * oRDTOCNAME;
@property (nonatomic, strong) NSString * oRDTOCTEL;
@property (nonatomic, strong) NSString * oRDTONAME;
@property (nonatomic, strong) NSString * tMSORDNO;
@property (nonatomic, strong) NSString * uPDATE03;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

// Cell 高度
@property (assign, nonatomic) CGFloat cellHeight;

@end
