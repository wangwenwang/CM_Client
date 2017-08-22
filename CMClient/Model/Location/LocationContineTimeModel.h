//
//  LocationContineTimeModel.h
//  CMClient
//
//  Created by 凯东源 on 17/2/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 位置点信息包含时间
@interface LocationContineTimeModel : NSObject



//{
//    "ID": "x",
//    "USERIDX": "x",
//    "CORDINATEX": 22.629344,
//    "CORDINATEY": 114.047021,
//    "ADDRESS": "x",
//    "TIME": "x"
//}



/// 位置的地址
@property (nonatomic, strong) NSString * aDDRESS;

/// 位置纬度
@property (nonatomic, assign) CGFloat cORDINATEX;

/// 位置经度
@property (nonatomic, assign) CGFloat cORDINATEY;

/// 递增序列，用于给后台插入数据库排序用
@property (nonatomic, strong) NSString * iDField;

/// 位置创建的时间
@property (nonatomic, strong) NSString * tIME;

/// 保存位置用户的 id
@property (nonatomic, strong) NSString * uSERIDX;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
