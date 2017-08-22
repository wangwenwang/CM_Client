//
//  OrderInfoService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "OrderInfoService.h"
#import <AFNetworking.h>

@implementation OrderInfoService


#define kAPIName @"获取订单信息"


#pragma mark - 获取订单信息

- (void)GetOrderInfo:(NSString *)IDX {
    
    IDX = IDX ? IDX : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"IDX" : IDX,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_GetOrderInfo parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                NSDictionary *dict = responseObject[@"result"];
                OrderInfoModel *m = [[OrderInfoModel alloc] initWithDictionary:dict];
            
                [self successOfOrderInfo:m];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            } else {
                
                [self failureOfOrderInfo:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
        } @catch (NSException *exception) {
            
            [self failureOfOrderInfo:@"请求失败"];
            LMLog(@"%@时，carsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfOrderInfo:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数

- (void)successOfOrderInfo:(OrderInfoModel *)orderInfo {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfOrderInfo:)]) {
            
            [_delegate successOfOrderInfo:orderInfo];
        }
    });
}


- (void)failureOfOrderInfo:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfOrderInfo:)]) {
            
            [_delegate failureOfOrderInfo:msg];
        }
    });
}

@end
