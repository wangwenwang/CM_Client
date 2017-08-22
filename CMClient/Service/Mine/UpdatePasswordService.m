//
//  UpdatePasswordService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "UpdatePasswordService.h"
#import <AFNetworking.h>
#import "LoginViewController.h"

#define kAPIName @"修改用户密码"

@implementation UpdatePasswordService

- (void)UpdatePassword:(NSString *)UserId andOldPassWord:(NSString *)OldPassWord  andNewPassWord:(NSString *)NewPassWord {
    
    UserId = UserId ? UserId : @"";
    OldPassWord = OldPassWord ? OldPassWord : @"";
    NewPassWord = NewPassWord ? NewPassWord : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"UserId" : UserId,
                                 @"OldPassWord" : OldPassWord,
                                 @"NewPassWord" : NewPassWord,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_UpdatePassword parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                [self successOfUpdatePassword];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            } else {
                
                [self failureOfUpdatePassword:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
            
        } @catch (NSException *exception) {
            
            [self failureOfUpdatePassword:@"请求失败"];
            LMLog(@"%@时，carsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfUpdatePassword:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数

- (void)successOfUpdatePassword {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfUpdatePassword)]) {
            
            [_delegate successOfUpdatePassword];
        }
    });
}


- (void)failureOfUpdatePassword:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfUpdatePassword:)]) {
            
            [_delegate failureOfUpdatePassword:msg];
        }
    });
}

@end
