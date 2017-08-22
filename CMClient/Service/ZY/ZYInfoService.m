//
//  ZYInfoService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "ZYInfoService.h"
#import <AFNetworking.h>

@implementation ZYInfoService

#define kAPIName @"获取装运信息"

#pragma mark - 获取装运信息
- (void)GetShipmentInfo:(NSString *)IDX {
    
    IDX = IDX ? IDX : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"IDX" : IDX,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_GetShipmentInfo parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                NSDictionary *dict = responseObject[@"result"];
                
                ShipmentInfoModel *m = [[ShipmentInfoModel alloc] initWithDictionary:dict];
                
                [self successOfZYInfo:m];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            } else if(type == -2) {
                
                [self successOfZYInfoNoData];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            } else {
                
                [self failureOfZYInfo:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
            
        } @catch (NSException *exception) {
            
            [self failureOfZYInfo:@"请求失败"];
            LMLog(@"%@时，carsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfZYInfo:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数
- (void)successOfZYInfo:(ShipmentInfoModel *)zyInfo {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfZYInfo:)]) {
            
            [_delegate successOfZYInfo:zyInfo];
        }
    });
}


- (void)successOfZYInfoNoData {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfZYInfoNoData)]) {
            
            [_delegate successOfZYInfoNoData];
        }
    });
}


- (void)failureOfZYInfo:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfZYInfo:)]) {
            
            [_delegate failureOfZYInfo:msg];
        }
    });
}

@end
