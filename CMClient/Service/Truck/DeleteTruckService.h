//
//  DeleteTruckService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/7.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 删除车辆 回调协议
@protocol DeleteTruckServiceDelegate <NSObject>

/// 删除车辆成功
@optional
- (void)successOfDeleteTruck:(NSIndexPath *)indexPath;

/// 删除车辆失败
@optional
- (void)failureOfDeleteTruck:(NSString *)msg;

@end

@interface DeleteTruckService : NSObject

@property (nonatomic, weak) id<DeleteTruckServiceDelegate> delegate;

- (void)DeleteVehicle:(NSString *)USER_IDX andFLEET_ID:(NSString *)FLEET_ID andVEHICLE_IDX:(NSString *)VEHICLE_IDX andCellIndexPathRow:(NSIndexPath *)indexPath;

@end
