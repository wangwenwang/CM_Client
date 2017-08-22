//
//  DriverPayService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/11.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "DriverPayService.h"
#import <AFNetworking.h>

@implementation DriverPayService

#define kAPIName @"交付订单"

#pragma mark - 交付订单
- (void)DriverPay:(NSString *)OrderId andPictureFile1:(NSString *)PictureFile1 andPictureFile2:(NSString *)PictureFile2 andAutographFile:(NSString *)AutographFile {
    
    OrderId = OrderId ? OrderId : @"";
    PictureFile1 = PictureFile1 ? PictureFile1 : @"";
    PictureFile2 = PictureFile2 ? PictureFile2 : @"";
    AutographFile = AutographFile ? AutographFile : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"OrderId" : OrderId,
                                 @"PictureFile1" : PictureFile1,
                                 @"PictureFile2" : PictureFile2,
                                 @"AutographFile" : AutographFile,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_DriverPay parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                [self successOfDriverPay];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            }else {
                
                [self failureOfDriverPay:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
        } @catch (NSException *exception) {
            
            [self failureOfDriverPay:@"请求失败"];
            LMLog(@"%@时，请求失败，chrsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfDriverPay:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数
- (void)successOfDriverPay {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfDriverPay)]) {
            
            [_delegate successOfDriverPay];
        }
    });
}


- (void)failureOfDriverPay:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfDriverPay:)]) {
            
            [_delegate failureOfDriverPay:msg];
        }
    });
}

@end
