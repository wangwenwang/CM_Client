//
//  PersonalInfoService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "PersonalInfoService.h"
#import <AFNetworking.h>
#import "AppDelegate.h"

#define kAPIName @"获取个人信息"

@implementation PersonalInfoService

- (void)GetUserInfo:(NSString *)UserId {
    
    UserId = UserId ? UserId : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"UserId" : UserId,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_GetUserInfo parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
//            NSDictionary *dict = @{
//                @"ADDRESS" : @"",
//                @"RECOMNAME" : @"",
//                @"USERNAME" : @"123",
//                @"EDIT_DATE" : @"2017/1/17 16:52:13",
//                @"USER_CODE" : @"13726027405",
//                @"COMPANYNAME" : @"123",
//                @"ADD_DATE" : @"2017/1/17 16:52:13",
//                @"USERTYPE" : @"",
//                @"FLEETTYPE" : @""
//                };
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                NSDictionary *dict = responseObject[@"result"];
                UserModel *m = [[UserModel alloc] initWithDictionary:dict];
                [self successOfGetUserInfo:m];
                
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            } else {
                
                [self failureOfGetUserInfo:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
            
        } @catch (NSException *exception) {
            
            [self failureOfGetUserInfo:@"请求失败"];
            LMLog(@"%@时，carsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfGetUserInfo:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数

- (void)successOfGetUserInfo:(UserModel *)userM {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfGetUserInfo:)]) {
            
            [_delegate successOfGetUserInfo:userM];
        }
    });
}


- (void)failureOfGetUserInfo:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfGetUserInfo:)]) {
            
            [_delegate failureOfGetUserInfo:msg];
        }
    });
}

@end
