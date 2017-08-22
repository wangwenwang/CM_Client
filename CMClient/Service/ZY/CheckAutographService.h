//
//  CheckAutographService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/12.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckAutographListModel.h"


/// 查看交付订单 回调协议
@protocol CheckAutographServiceDelegate <NSObject>

/// 查看交付订单成功
@optional
- (void)successOfCheckAutograph:(CheckAutographListModel *)checkAutographListM;

/// 查看交付订单失败
@optional
- (void)failureOfCheckAutograph:(NSString *)msg;

@end

@interface CheckAutographService : NSObject

@property (nonatomic, weak) id<CheckAutographServiceDelegate> delegate;


/**
 查看交付订单

 @param OrderId 订单id
 */
- (void)GetAutograph:(NSString *)OrderId;

@end
