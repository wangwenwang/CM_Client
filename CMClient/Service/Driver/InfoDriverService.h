//
//  InfoDriverService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/11.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 受权司机 回调协议
@protocol InfoDriverServiceDelegate <NSObject>

/// 受权司机成功
@optional
- (void)successOfInfoDriver;

/// 受权司机失败
@optional
- (void)failureOfInfoDriver:(NSString *)msg;

@end

@interface InfoDriverService : NSObject

@property (nonatomic, weak) id<InfoDriverServiceDelegate> delegate;

- (void)InfoDriver:(NSString *)USER_IDX andFLEET_ID:(NSString *)FLEET_ID andINFO_USER_IDX:(NSString *)INFO_USER_IDX andINFO_TYPE:(NSString *)INFO_TYPE;

@end
