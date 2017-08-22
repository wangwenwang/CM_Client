//
//  CopyPaste.m
//  CMClient
//
//  Created by 凯东源 on 17/2/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "CopyPaste.h"
#import <AFNetworking.h>

@implementation CopyPaste

#define kAPIName @"<#APIName#>"

#pragma mark - 获取APP推送消息
- (void)Method:(NSString *)UserId andPageNumber:(NSString *)PageNumber andPageSize:(NSString *)PageSize andStrLicense:(NSString *)strLicense {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"UserId" : UserId,
                                 @"PageNumber" : PageNumber,
                                 @"PageSize" : PageSize,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:@"API" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
        NSInteger type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(type == 1) {
            
            LMLog(@"%@成功，msg:%@", kAPIName, msg);
        }else {
            
            LMLog(@"%@失败，msg:%@", kAPIName, msg);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}

@end
