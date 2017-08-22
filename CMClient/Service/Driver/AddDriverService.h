//
//  AddDriverService.h
//  CMClient
//
//  Created by 凯东源 on 17/2/23.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

/// 添加司机 回调协议
@protocol AddDriverServiceDelegate <NSObject>

/// 通过用户电话 --> 获取用户信息 成功
@optional
- (void)successOfGetDriverInfo:(UserModel *)userModel;

/// 通过用户电话 --> 获取用户信息 失败
@optional
- (void)failureOfGetDriverInfo;


/// 添加司机成功（个人车队）
@optional
- (void)successOfAddDriver;

/// 添加司机失败（个人车队）
@optional
- (void)failureOfAddDriver:(NSString *)msg;

@end


@interface AddDriverService : NSObject

@property (nonatomic, weak) id<AddDriverServiceDelegate> delegate;


/**
 通过用户电话

 @param DRIVER_TEL 司机电话
 */
- (void)GetDriverInfo:(NSString *)DRIVER_TEL;


/**
 添加司机

 @param USER_IDX     司机ID
 @param FLEET_IDX    车队ID
 @param ADD_USER_IDX 操作人ID
 */
- (void)addDriver:(NSString *)USER_IDX andFLEET_IDX:(NSString *)FLEET_IDX andADD_USER_IDX:(NSString *)ADD_USER_IDX;

@end
