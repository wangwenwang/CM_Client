//
//  ModifyUserInfoService.m
//  CMClient
//
//  Created by 凯东源 on 17/5/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "ModifyUserInfoService.h"
#import <AFNetworking.h>
#import "Tools.h"

#define kAPIName @"修改个人信息"

@implementation ModifyUserInfoService


- (void)ModifyUserInfo:(NSDictionary *)UserInfo {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    NSString *json = [Tools JsonStringWithDictonary:UserInfo];
    
    NSDictionary *parameters = @{@"UserInfo" : json,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_ModifyUserInfo parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                [self successOfModifyUserInfo];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            } else {
                
                [self failureOfModifyUserInfo:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
            
        } @catch (NSException *exception) {
            
            [self failureOfModifyUserInfo:@"请求失败"];
            LMLog(@"%@时，carsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfModifyUserInfo:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数

- (void)successOfModifyUserInfo {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfModifyUserInfo)]) {
            
            [_delegate successOfModifyUserInfo];
        }
    });
}


- (void)failureOfModifyUserInfo:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfModifyUserInfo:)]) {
            
            [_delegate failureOfModifyUserInfo:msg];
        }
    });
}

@end
