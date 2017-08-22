//
//  AddDriverService.m
//  CMClient
//
//  Created by 凯东源 on 17/2/23.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AddDriverService.h"
#import <AFNetworking.h>

@implementation AddDriverService

#define kAPINameAddDriver @"添加司机"

#define kAPINameGetDriverInfo @"获取司机信息"

#pragma mark - 添加司机
- (void)addDriver:(NSString *)USER_IDX andFLEET_IDX:(NSString *)FLEET_IDX andADD_USER_IDX:(NSString *)ADD_USER_IDX {
    
    USER_IDX = USER_IDX ? USER_IDX : @"";
    FLEET_IDX = FLEET_IDX ? FLEET_IDX : @"";
    ADD_USER_IDX = ADD_USER_IDX ? ADD_USER_IDX : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"USER_IDX" : USER_IDX,
                                 @"FLEET_IDX" : FLEET_IDX,
                                 @"ADD_USER_IDX" : ADD_USER_IDX,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPINameAddDriver, parameters);
    
    [manager POST:API_AddDriver parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"%@,请求成功,返回值:%@", kAPINameAddDriver, responseObject);
        NSInteger type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(type == 1) {
            
            [self successOfAddDriver];
            LMLog(@"%@成功，msg:%@", kAPINameAddDriver, msg);
        }else {
            
            [self failureOfAddDriver:msg];
            LMLog(@"%@失败，msg:%@", kAPINameAddDriver, msg);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfAddDriver:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPINameAddDriver, error);
    }];
}


- (void)GetDriverInfo:(NSString *)DRIVER_TEL {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"DRIVER_TEL" : DRIVER_TEL,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPINameGetDriverInfo, parameters);
    
    [manager POST:API_GetDriverInfo parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"%@,请求成功,返回值:%@", kAPINameGetDriverInfo, responseObject);
        NSInteger type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(type == 1) {
            
            NSDictionary *dict = responseObject[@"result"];
            UserModel *m = [[UserModel alloc] initWithDictionary:dict[kDRIVER]];
            
            [self successOfGetDriverInfo:m];
            LMLog(@"%@成功，msg:%@", kAPINameGetDriverInfo, msg);
        }else {
            
            [self failureOfGetDriverInfo];
            LMLog(@"%@失败，msg:%@", kAPINameGetDriverInfo, msg);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfGetDriverInfo];
        LMLog(@"%@时，请求失败，error:%@", kAPINameGetDriverInfo, error);
    }];
}


#pragma mark - 功能函数
- (void)successOfGetDriverInfo:(UserModel *)userModel {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfGetDriverInfo:)]) {
            
            [_delegate successOfGetDriverInfo:userModel];
        }
    });
}


- (void)failureOfGetDriverInfo {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfGetDriverInfo)]) {
            
            [_delegate failureOfGetDriverInfo];
        }
    });
}


- (void)successOfAddDriver {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfAddDriver)]) {
            
            [_delegate successOfAddDriver];
        }
    });
}


- (void)failureOfAddDriver:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfAddDriver:)]) {
            
            [_delegate failureOfAddDriver:msg];
        }
    });
}

@end
