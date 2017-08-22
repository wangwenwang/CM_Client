//
//  CheckAutographService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/12.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "CheckAutographService.h"
#import <AFNetworking.h>

@implementation CheckAutographService


#define kAPIName @"查看交付订单"

#pragma mark - 查看交付订单

- (void)GetAutograph:(NSString *)OrderId {
    
    OrderId = OrderId ? OrderId : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"OrderId" : OrderId,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_GetAutograph parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                CheckAutographListModel *m = [[CheckAutographListModel alloc] initWithDictionary:responseObject];
                [self successOfCheckAutograph:m];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            }else {
                
                [self failureOfCheckAutograph:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
        } @catch (NSException *exception) {
            
            [self failureOfCheckAutograph:@"请求失败"];
            LMLog(@"%@时，请求失败，chrsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfCheckAutograph:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数
- (void)successOfCheckAutograph:(CheckAutographListModel *)checkAutographListM {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfCheckAutograph:)]) {
            
            [_delegate successOfCheckAutograph:checkAutographListM];
        }
    });
}


- (void)failureOfCheckAutograph:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfCheckAutograph:)]) {
            
            [_delegate failureOfCheckAutograph:msg];
        }
    });
}

@end
