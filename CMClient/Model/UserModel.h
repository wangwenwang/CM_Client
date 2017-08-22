//
//  UserModel.h
//  CMDriver
//
//  Created by 凯东源 on 17/1/18.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>


//{
//    "Avatar" : "InfoImg/20170512/2017512165064162.jpg",
//    "COMPANYNAME" : "CompanyName",
//    "EDIT_DATE" : "2017/1/17 17:24:46",
//    "USERNAME" : "UserName",
//    "USER_CODE" : "13800138000",
//    "ADDRESS" : "广东  深圳",
//    "RECOMNAME" : "",
//    "ADD_DATE" : "2017/1/17 17:24:46",
//    "USERTYPE" : "Driver",
//    "FLEETTYPE" : "",
//    "IDX" : "",
//    "OPERATOR_IDX" : "",
//    "useDays" : "",
//    "pASSWORD" : ""
//}


/// 用户信息
@interface UserModel : NSObject

@property (nonatomic, strong) NSString * aDDRESS;
@property (nonatomic, strong) NSString * aDDDATE;
@property (nonatomic, strong) NSString * avatar;
@property (nonatomic, strong) NSString * cOMPANYNAME;
@property (nonatomic, strong) NSString * eDITDATE;
@property (nonatomic, strong) NSString * fLEETTYPE;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * oPERATORIDX;
@property (nonatomic, strong) NSString * rECOMNAME;
@property (nonatomic, strong) NSString * uSERNAME;
@property (nonatomic, strong) NSString * uSERTYPE;
@property (nonatomic, strong) NSString * uSERCODE;



/// 不是服务器返回

/// 注册起天数
@property (strong, nonatomic) NSString *useDays;
@property (nonatomic, strong) NSString * pASSWORD;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
