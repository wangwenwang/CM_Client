//
//  Routes_UploadModel.h
//  CMClient
//
//  Created by 凯东源 on 17/5/15.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Routes_UploadModel : NSObject

// 地址名称
@property (nonatomic, strong) NSString * aDDRESSNAME;

// 省
@property (nonatomic, strong) NSString * aDDRESSPROVINCE;

// 市
@property (nonatomic, strong) NSString * aDDRESSCITY;

// 区/县
@property (nonatomic, strong) NSString * aDDRESSAREA;

// 街道/乡镇
@property (nonatomic, strong) NSString * aDDRESSRURAL;

// 详细地址
@property (nonatomic, strong) NSString * aDDRESSADDRESS;

// 地址汇总
@property (nonatomic, strong) NSString * aDDRESSINFO;

// 地址备注
@property (nonatomic, strong) NSString * aDDRESSREMARK;

// 联系人
@property (nonatomic, strong) NSString * aDDRESSPERSON;

// 联系电话
@property (nonatomic, strong) NSString * aDDRESSTEL;

// 邮编
@property (nonatomic, strong) NSString * aDDRESSZIP;

// 操作人id
@property (nonatomic, strong) NSString * oPERATORIDX;

// 地址类型 FROM TO
@property (nonatomic, strong) NSString * rOUTESTYPE;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

// 地址类型转义 起点 途径 终点
@property (nonatomic, strong) NSString * rOUTESTYPE_Convert;

@end
