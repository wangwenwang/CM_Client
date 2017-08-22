//
//  PushNewsService.m
//  CMClient
//
//  Created by 凯东源 on 17/2/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "PushNewsService.h"
#import <AFNetworking.h>

@implementation PushNewsService


#define kAPIName @"获取APP推送消息"

/// 分页条数
#define kPageSize @"20"


#pragma mark - 获取APP推送消息
- (void)getPushNews:(NSString *)UserId andPageNumber:(NSUInteger)PageNumber {
    
    UserId = UserId ? UserId : @"";
    PageNumber = PageNumber ? PageNumber : 0;
    
    NSString *PageNumberStr = [NSString stringWithFormat:@"%lu",(unsigned long)PageNumber];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"UserId" : UserId,
                                 @"PageNumber" : PageNumberStr,
                                 @"PageSize" : kPageSize,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_GetPushMessage parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
        NSInteger type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        // 返回数据TYPE:0为订单;     1为公告
        // 返回数据ISREAD:0为未读;   1为已读
        if(type == 0 || type == 1) {
            
            LMLog(@"%@成功，msg:%@", kAPIName, msg);
            PushNewsListModel *m = [[PushNewsListModel alloc] initWithDictionary:responseObject];
            [self successOfGetPushNews:m];
        } else if(type == -2){
            
            LMLog(@"%@成功，没有消息，msg:%@", kAPIName, msg);
            [self successGetPushNewsNoData];
        }else {
            
            LMLog(@"%@失败，msg:%@", kAPIName, msg);
            [self failureOfGetPushNews:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfGetPushNews:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数

- (void)successOfGetPushNews:(PushNewsListModel *)pushNewsListM {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfGetPushNews:)]) {
            
            [_delegate successOfGetPushNews:pushNewsListM];
        }
    });
}


- (void)successGetPushNewsNoData {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successGetPushNewsNoData)]) {
            
            [_delegate successGetPushNewsNoData];
        }
    });
}


- (void)failureOfGetPushNews:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfGetPushNews:)]) {
            
            [_delegate failureOfGetPushNews:msg];
        }
    });
}

@end
