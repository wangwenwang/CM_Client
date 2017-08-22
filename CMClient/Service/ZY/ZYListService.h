//
//  ZYListService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/2.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 获取装运列表 回调协议
@protocol ZYListServiceDelegate <NSObject>

@optional
- (void)successOfZYList:(NSArray *)zys;

@optional
- (void)successOfZYListNoData;

@optional
- (void)failureOfZYList:(NSString *)msg;

@end

@interface ZYListService : NSObject

@property (nonatomic, weak) id<ZYListServiceDelegate> delegate;

- (void)GetShipmentList:(NSString *)UserId andSHIPMENT_STATE:(NSString *)SHIPMENT_STATE andSTART_DATE:(NSString *)START_DATE andEND_DATE:(NSString *)END_DATE  andPAGE:(NSUInteger)PAGE andPAGE_COUNT:(NSUInteger)PAGE_COUNT;

@end
