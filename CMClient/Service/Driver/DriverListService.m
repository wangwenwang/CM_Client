//
//  DriverListService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/2.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "DriverListService.h"
#import <AFNetworking.h>

@implementation DriverListService

#define kAPIName @"获取司机列表"

#pragma mark - 获取司机列表
- (void)GetDriverList:(NSString *)UserId andFleetIdx:(NSString *)FleetIdx {
    
    UserId = UserId ? UserId : @"";
    FleetIdx = FleetIdx ? FleetIdx : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"FleetIdx" : FleetIdx,
                                 @"UserId" : UserId,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_GetDriverList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
        NSInteger type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(type == 1) {
            
            if([_delegate respondsToSelector:@selector(successOfGetDriverList:)]) {
                
                NSDictionary *dict = responseObject[@"result"];
                DriverListModel *m = [[DriverListModel alloc] initWithDictionary:dict];
                
                [self successOfGetDriverList:m];
            }
            LMLog(@"%@成功，msg:%@", kAPIName, msg);
        }else if(type == -2) {
            
            if([_delegate respondsToSelector:@selector(successOfGetDriverListNoData)]) {
                
                [self successOfGetDriverListNoData];
            }
            LMLog(@"%@成功，msg:%@", kAPIName, msg);
        }else {
            
            [self failureOfGetDriverList:msg];
            LMLog(@"%@失败，msg:%@", kAPIName, msg);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfGetDriverList:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数

- (void)successOfGetDriverList:(DriverListModel *)driverListM {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfGetDriverList:)]) {
            
            [_delegate successOfGetDriverList:driverListM];
        }
    });
}


- (void)successOfGetDriverListNoData {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfGetDriverListNoData)]) {
            
            [_delegate successOfGetDriverListNoData];
        }
    });
}


- (void)failureOfGetDriverList:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfGetDriverList:)]) {
            
            [_delegate failureOfGetDriverList:msg];
        }
    });
}

@end
