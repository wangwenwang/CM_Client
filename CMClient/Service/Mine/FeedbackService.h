//
//  FeedbackService.h
//  CMClient
//
//  Created by 凯东源 on 17/5/18.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 提交意见反馈 回调协议
@protocol FeedbackServiceDelegate <NSObject>

@optional
- (void)successOfUserFeedback:(NSString *)msg;

@optional
- (void)failureOfUserFeedback:(NSString *)msg;

@end

@interface FeedbackService : NSObject

@property (weak, nonatomic) id<FeedbackServiceDelegate> delegate;

- (void)UserFeedback:(NSString *)UserId andContent:(NSString *)Content;

@end
