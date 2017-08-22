//
//  InfoDriverService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/11.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "InfoDriverService.h"
#import <AFNetworking.h>

#define kAPIName @"受权司机"

@implementation InfoDriverService

- (void)InfoDriver:(NSString *)USER_IDX andFLEET_ID:(NSString *)FLEET_ID andINFO_USER_IDX:(NSString *)INFO_USER_IDX andINFO_TYPE:(NSString *)INFO_TYPE {
    
    
    USER_IDX = USER_IDX ? USER_IDX : @"";
    FLEET_ID = FLEET_ID ? FLEET_ID : @"";
    INFO_USER_IDX = INFO_USER_IDX ? INFO_USER_IDX : @"";
    INFO_TYPE = INFO_TYPE ? INFO_TYPE : @"";
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"USER_IDX" : USER_IDX,
                                 @"FLEET_ID" : FLEET_ID,
                                 @"INFO_USER_IDX" : INFO_USER_IDX,
                                 @"INFO_TYPE" : INFO_TYPE,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_InfoDriver parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                [self successOfInfoDriver];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            }else {
                
                [self failureOfInfoDriver:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
        } @catch (NSException *exception) {
            
            [self failureOfInfoDriver:@"请求失败"];
            LMLog(@"%@时，请求失败，chrsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfInfoDriver:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数

- (void)successOfInfoDriver {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfInfoDriver)]) {
            
            [_delegate successOfInfoDriver];
        }
    });
}


- (void)failureOfInfoDriver:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfInfoDriver:)]) {
            
            [_delegate failureOfInfoDriver:msg];
        }
    });
}

@end
