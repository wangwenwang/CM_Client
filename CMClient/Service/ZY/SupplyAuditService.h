//
//  SupplyAuditService.h
//  CMClient
//
//  Created by 凯东源 on 17/6/1.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 货源审核 回调协议
@protocol SupplyAuditServiceDelegate <NSObject>

@optional
- (void)successOfUpdateAudit:(NSString *)msg;

@optional
- (void)failureOfUpdateAudit:(NSString *)msg;

@optional
- (void)successOfRuturnAudit:(NSString *)msg;

@optional
- (void)failureOfRuturnAudit:(NSString *)msg;

@end

@interface SupplyAuditService : NSObject

@property (nonatomic, weak) id<SupplyAuditServiceDelegate> delegate;


// 流程正向
- (void)UpdateAudit:(NSString *)strSupplyIdx andstrUserIdx:(NSString *)strUserIdx;


/// 流程反向
- (void)RuturnAudit:(NSString *)strSupplyIdx andstrUserIdx:(NSString *)strUserIdx;

@end
