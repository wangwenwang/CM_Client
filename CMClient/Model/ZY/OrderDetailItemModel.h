//
//  OrderDetailItemModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// json在  OrderInfoModel.h

/// 订单详细item(产品信息)
@interface OrderDetailItemModel : NSObject

@property (nonatomic, strong) NSString * eNTIDX;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * iSSUEQTY;
@property (nonatomic, strong) NSString * iSSUEUOM;
@property (nonatomic, strong) NSString * iSSUEVOLUME;
@property (nonatomic, strong) NSString * iSSUEWEIGHT;
@property (nonatomic, strong) NSString * oRDERIDX;
@property (nonatomic, strong) NSString * pRODUCTDESC;
@property (nonatomic, strong) NSString * pRODUCTNAME;
@property (nonatomic, strong) NSString * pRODUCTNO;
@property (nonatomic, strong) NSString * rEMARKSUPPLIER;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
