//
//  SupplyListService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/1.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>


/// 获取货源列表 回调协议
@protocol SupplyListServiceDelegate <NSObject>

@optional
- (void)successOfSupplyList:(NSArray *)supplys;

@optional
- (void)successOfSupplyListNoData;

@optional
- (void)failureOfSupplyList:(NSString *)msg;

@end

/// 获取货源列表
@interface SupplyListService : NSObject

@property (nonatomic, weak) id<SupplyListServiceDelegate> delegate;

- (void)GetSupplyList:(NSString *)result andSTART_DATE:(NSString *)START_DATE andEND_DATE:(NSString *)END_DATE andSUPPLY_STATE:(NSString *)SUPPLY_STATE andPAGE:(NSUInteger)PAGE andPAGE_COUNT:(NSUInteger)PAGE_COUNT andUSER_IDX:(NSString *)USER_IDX andSUPPLY_WOKERFLOW:(NSString *)SUPPLY_WOKERFLOW andDRIVER_IDX:(NSString *)DRIVER_IDX;

@end
