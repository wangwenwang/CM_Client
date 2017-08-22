//
//  PushNewsModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/30.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderNoListModel.h"

@interface PushNewsModel : NSObject

@property (nonatomic, strong) NSString * aDDDATE;
@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * iSREAD;
@property (nonatomic, strong) NSString * mESSAGE;
@property (nonatomic, strong) NSArray * orderNoListModel;
@property (nonatomic, strong) NSString * sHIPMENTIDX;
@property (nonatomic, strong) NSString * sHIPMENTNO;
@property (nonatomic, strong) NSString * tITLE;
@property (nonatomic, strong) NSString * tYPE;
@property (nonatomic, strong) NSString * uSERID;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
