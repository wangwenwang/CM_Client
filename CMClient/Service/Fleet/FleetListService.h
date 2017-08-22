//
//  FleetListService.h
//  CMClient
//
//  Created by 凯东源 on 17/2/22.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FleetListModel.h"

/// 获取车队列表模型 回调协议
@protocol FleetListServiceDelegate <NSObject>

@optional
- (void)successOfGetFleetList:(FleetListModel *)fleetListM;

@optional
- (void)successGetFleetListNoData;

@optional
- (void)failureOfGetFleetList:(NSString *)msg;

@end


@interface FleetListService : NSObject

@property (nonatomic, weak) id<FleetListServiceDelegate> delegate;

- (void)getFleetList:(NSString *)UserId;

@end
