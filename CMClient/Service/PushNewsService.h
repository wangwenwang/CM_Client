//
//  PushNewsService.h
//  CMClient
//
//  Created by 凯东源 on 17/2/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PushNewsListModel.h"

/// 回调协议
@protocol PushNewsServiceDelegate <NSObject>

@optional
- (void)successOfGetPushNews:(PushNewsListModel *)pushNewsListM;

@optional
- (void)successGetPushNewsNoData;

@optional
- (void)failureOfGetPushNews:(NSString *)msg;

@end

@interface PushNewsService : NSObject

@property (weak, nonatomic)id <PushNewsServiceDelegate> delegate;


/**
 获取APP推送消息

 @param UserId     用户ID
 @param PageNumber 页数（要请求第几页）
 */
- (void)getPushNews:(NSString *)UserId andPageNumber:(NSUInteger)PageNumber;


@end
