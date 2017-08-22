//
//  OrderInfoService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderInfoModel.h"


/// 获取装运信息 回调协议
@protocol OrderInfoServiceDelegate <NSObject>

@optional
- (void)successOfOrderInfo:(OrderInfoModel *)orderInfo;

@optional
- (void)failureOfOrderInfo:(NSString *)msg;

@end


/// 获取装运信息
@interface OrderInfoService : NSObject

@property (nonatomic, weak) id<OrderInfoServiceDelegate> delegate;

- (void)GetOrderInfo:(NSString *)IDX;

@end
