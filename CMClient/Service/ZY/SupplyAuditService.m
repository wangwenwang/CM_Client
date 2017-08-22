//
//  SupplyAuditService.m
//  CMClient
//
//  Created by 凯东源 on 17/6/1.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "SupplyAuditService.h"
#import <AFNetworking.h>

@implementation SupplyAuditService

#define kAPINameUpdateAudit @"货源正向审核"

#define kAPINameRuturnAudit @"货源反向审核"

#pragma mark - 货源审核

- (void)UpdateAudit:(NSString *)strSupplyIdx andstrUserIdx:(NSString *)strUserIdx {
    
    strSupplyIdx = strSupplyIdx ? strSupplyIdx : @"";
    strUserIdx = strUserIdx ? strUserIdx : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strSupplyIdx" : strSupplyIdx,
                                 @"strUserIdx" : strUserIdx,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPINameUpdateAudit, parameters);
    
    [manager POST:API_UpdateAudit parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPINameUpdateAudit, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                [self successOfUpdateAudit:msg];
                LMLog(@"%@成功，msg:%@", kAPINameUpdateAudit, msg);
            } else {
                
                [self failureOfUpdateAudit:msg];
                LMLog(@"%@失败，msg:%@", kAPINameUpdateAudit, msg);
            }
        } @catch (NSException *exception) {
            
            [self failureOfUpdateAudit:@"请求失败"];
            LMLog(@"%@时，carsh", kAPINameUpdateAudit);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfUpdateAudit:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPINameUpdateAudit, error);
    }];
}


- (void)RuturnAudit:(NSString *)strSupplyIdx andstrUserIdx:(NSString *)strUserIdx {
    
    strSupplyIdx = strSupplyIdx ? strSupplyIdx : @"";
    strUserIdx = strUserIdx ? strUserIdx : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{
                                 @"strSupplyIdx" : strSupplyIdx,
                                 @"strUserIdx" : strUserIdx,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPINameRuturnAudit, parameters);
    
    [manager POST:API_RuturnAudit parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPINameRuturnAudit, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                [self successOfRuturnAudit:msg];
                LMLog(@"%@成功，msg:%@", kAPINameRuturnAudit, msg);
            } else {
                
                [self failureOfRuturnAudit:msg];
                LMLog(@"%@失败，msg:%@", kAPINameRuturnAudit, msg);
            }
        } @catch (NSException *exception) {
            
            [self failureOfRuturnAudit:@"请求失败"];
            LMLog(@"%@时，carsh", kAPINameRuturnAudit);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfRuturnAudit:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPINameRuturnAudit, error);
    }];
}


#pragma mark - 功能函数

// 正向
- (void)successOfUpdateAudit:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfUpdateAudit:)]) {
            
            [_delegate successOfUpdateAudit:msg];
        }
    });
}


- (void)failureOfUpdateAudit:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfUpdateAudit:)]) {
            
            [_delegate failureOfUpdateAudit:msg];
        }
    });
}


// 反向
- (void)successOfRuturnAudit:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfRuturnAudit:)]) {
            
            [_delegate successOfRuturnAudit:msg];
        }
    });
}


- (void)failureOfRuturnAudit:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfRuturnAudit:)]) {
            
            [_delegate failureOfRuturnAudit:msg];
        }
    });
}

@end
