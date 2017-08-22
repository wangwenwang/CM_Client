//
//  CheckPathService.h
//  CMClient
//
//  Created by 凯东源 on 17/2/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>


/// 查看订单路线 回调协议
@protocol CheckPathServiceDelegate <NSObject>

@optional
- (void)success;

@optional
- (void)failure:(NSString *)msg;

@end


/// 查看订单路线
@interface CheckPathService : NSObject


@property (weak, nonatomic)id <CheckPathServiceDelegate> delegate;

/**
 订单线路位置点集合
 */
@property(strong, nonatomic) NSMutableArray *orderLocations;

/**
 * 获取订单线路位置点集合
 *
 * orderIdx: 订单的 idx
 *
 * httpresponseProtocol: 网络请求协议
 */
- (void)getOrderLocaltions:(NSString *)idx;


@end
