//
//  DriverPayService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/11.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 交付订单 回调协议
@protocol DriverPayServiceDelegate <NSObject>

/// 交付订单成功
@optional
- (void)successOfDriverPay;

/// 交付订单失败
@optional
- (void)failureOfDriverPay:(NSString *)msg;

@end


@interface DriverPayService : NSObject

@property (nonatomic, weak) id<DriverPayServiceDelegate> delegate;

- (void)DriverPay:(NSString *)OrderId andPictureFile1:(NSString *)PictureFile1 andPictureFile2:(NSString *)PictureFile2 andAutographFile:(NSString *)AutographFile;

@end
