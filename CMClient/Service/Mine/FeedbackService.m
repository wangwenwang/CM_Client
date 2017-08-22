//
//  FeedbackService.m
//  CMClient
//
//  Created by 凯东源 on 17/5/18.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "FeedbackService.h"
#import <AFNetworking.h>

#define kAPIName @"提交意见反馈"

@implementation FeedbackService

- (void)UserFeedback:(NSString *)UserId andContent:(NSString *)Content {
    
    UserId = UserId ? UserId : @"";
    Content = Content ? Content : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"UserId" : UserId,
                                 @"Content" : Content,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_UserFeedback parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                [self successOfUserFeedback:msg];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            } else {
                
                [self failureOfUserFeedback:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
            
        } @catch (NSException *exception) {
            
            [self failureOfUserFeedback:@"请求失败"];
            LMLog(@"%@时，carsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfUserFeedback:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数

- (void)successOfUserFeedback:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfUserFeedback:)]) {
            
            [_delegate successOfUserFeedback:msg];
        }
    });
}


- (void)failureOfUserFeedback:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfUserFeedback:)]) {
            
            [_delegate failureOfUserFeedback:msg];
        }
    });
}

@end
