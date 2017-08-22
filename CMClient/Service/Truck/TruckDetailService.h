//
//  TruckDetailService.h
//  CMDriver
//
//  Created by 凯东源 on 17/5/25.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TruckDetailModel.h"

/// 查询车辆 回调协议
@protocol TruckDetailServiceDelegate <NSObject>

/// 查询车辆成功
@optional
- (void)successOfTruckDetail:(TruckDetailModel *)truckDetailM;

/// 查询车辆失败
@optional
- (void)failureOfTruckDetail:(NSString *)msg;

@end

@interface TruckDetailService : NSObject

@property (nonatomic, weak) id<TruckDetailServiceDelegate> delegate;

- (void)SearchVehicle:(NSString *)PLATE_NUMBER andstrFleetIdx:(NSString *)strFleetIdx;

@end
