//
//  SupplyInfoService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SupplyInfoModel.h"


/// 获取货源详情、竞标货源 回调协议
@protocol SupplyInfoServiceDelegate <NSObject>

@optional
- (void)successOfSupplyInfo:(SupplyInfoModel *)supplyInfoM;

@optional
- (void)failureOfSupplyInfo:(NSString *)msg;

@optional
- (void)successOfReceivingSupply;

@optional
- (void)failureOfReceivingSupply:(NSString *)msg;

@end

/// 获取货源详情
@interface SupplyInfoService : NSObject

@property (nonatomic, weak) id<SupplyInfoServiceDelegate> delegate;



/**
 获取货源详情

 @param IDX 货源IDX
 */
- (void)GetSupplyInfo:(NSString *)IDX;


/**
 竞标货源

 @param RECEIVING_IDX  竞标人ID
 @param USER_TEL       联系方式
 @param FLEET_IDX      车队ID
 @param FLEET_NAME     车队名称
 @param VEHICLE_IDX    竞标车辆ID
 @param PLATE_NUMBER   车牌号
 @param VEHICLE_TYPE   车辆类型
 @param VEHICLE_SIZE   车辆尺寸
 @param BRAND_MODEL    车辆品牌
 @param IDX            装载id
 @param DRIVER_IDX     司机ID
 @param DRIVER_NAME    司机名
 @param DRIVER_TEL     司机手机
 @param VERSION_NUMBER 版本号
 */
- (void)ReceivingSupply:(NSString *)RECEIVING_IDX andUSER_TEL:(NSString *)USER_TEL andFLEET_IDX:(NSString *)FLEET_IDX andFLEET_NAME:(NSString *)FLEET_NAME andVEHICLE_IDX:(NSString *)VEHICLE_IDX andPLATE_NUMBER:(NSString *)PLATE_NUMBER andVEHICLE_TYPE:(NSString *)VEHICLE_TYPE andVEHICLE_SIZE:(NSString *)VEHICLE_SIZE andBRAND_MODEL:(NSString *)BRAND_MODEL andIDX:(NSString *)IDX andDRIVER_IDX:(NSString *)DRIVER_IDX andDRIVER_NAME:(NSString *)DRIVER_NAME andDRIVER_TEL:(NSString *)DRIVER_TEL andVERSION_NUMBER:(NSString *)VERSION_NUMBER;

@end
