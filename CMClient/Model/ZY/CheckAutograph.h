//
//  CheckAutograph.h
//  CMClient
//
//  Created by 凯东源 on 17/3/13.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckAutograph : NSObject

@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * pRODUCTIDX;
@property (nonatomic, strong) NSString * pRODUCTURL;
@property (nonatomic, strong) NSString * rEMARK;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
