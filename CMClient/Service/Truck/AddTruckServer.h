//
//  AddTruckServer.h
//  CMClient
//
//  Created by 凯东源 on 17/3/2.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 添加车辆 回调协议
@protocol AddTruckServerDelegate <NSObject>

/// 添加车辆成功
@optional
- (void)successOfAddTruck;

/// 添加车辆失败
@optional
- (void)failureOfAddTruck:(NSString *)msg;

@end

@interface AddTruckServer : NSObject

@property (nonatomic, weak) id<AddTruckServerDelegate> delegate;

- (void)addTruck:(NSString *)USER_IDX andFLEET_ID:(NSString *)FLEET_ID andPLATE_NUMBER:(NSString *)PLATE_NUMBER andVEHICLE_MODEL:(NSString *)VEHICLE_MODEL andVEHICLE_SIZE:(NSString *)VEHICLE_SIZE andBRAND_MODEL:(NSString *)BRAND_MODEL andVEHICLE_COLOR:(NSString *)VEHICLE_COLOR andMAX_WEIGHT:(CGFloat)MAX_WEIGHT andMAX_VOLUME:(CGFloat)MAX_VOLUME andPictureFile1:(NSString *)PictureFile1 andPictureFile2:(NSString *)PictureFile2 andAutographFile:(NSString *)AutographFile;

@end
