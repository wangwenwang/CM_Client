//
//  ZYInfoService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShipmentInfoModel.h"

/// 获取装运信息 回调协议
@protocol ZYInfoServiceDelegate <NSObject>

@optional
- (void)successOfZYInfo:(ShipmentInfoModel *)zyInfo;

@optional
- (void)successOfZYInfoNoData;

@optional
- (void)failureOfZYInfo:(NSString *)msg;

@end

/**
 获取装运信息
 */
@interface ZYInfoService : NSObject

@property (nonatomic, weak) id<ZYInfoServiceDelegate> delegate;


- (void)GetShipmentInfo:(NSString *)IDX;

@end
