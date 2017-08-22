//
//  DriverListService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/2.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DriverListModel.h"


/// 获取车队列表 回调协议
@protocol DriverListServiceDelegate <NSObject>

@optional
- (void)successOfGetDriverList:(DriverListModel *)driverListM;

@optional
- (void)successOfGetDriverListNoData;

@optional
- (void)failureOfGetDriverList:(NSString *)msg;

@end


/// 获取司机列表
@interface DriverListService : NSObject

@property (nonatomic, weak) id<DriverListServiceDelegate> delegate;

- (void)GetDriverList:(NSString *)UserId andFleetIdx:(NSString *)FleetIdx;

@end
