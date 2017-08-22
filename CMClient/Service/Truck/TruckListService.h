//
//  TruckListService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/2.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TruckListModel.h"

/// 获取车辆列表 回调协议
@protocol TruckListServiceDelegate <NSObject>

@optional
- (void)successOfGetTruckList:(TruckListModel *)trucks;

@optional
- (void)successGetTruckListNoData;

@optional
- (void)failureOfGetTruckList:(NSString *)msg;

@end


/// 获取车辆列表
@interface TruckListService : NSObject


@property (nonatomic, weak) id<TruckListServiceDelegate> delegate;

/**
 获取车辆列表

 @param FleetIdx 车队id
 */
- (void)GetVehicleList:(NSString *)FleetIdx andUserId:(NSString *)UserId;

@end
