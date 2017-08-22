//
//  DeleteDriverService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "DeleteDriverService.h"
#import <AFNetworking.h>

#define kAPIName @"删除司机"

@implementation DeleteDriverService

- (void)DeleteDriver:(NSString *)USER_IDX andFLEET_ID:(NSString *)FLEET_ID andDRIVER_IDX:(NSString *)DRIVER_IDX andCellIndexPathRow:(NSIndexPath *)indexPath {
    
    USER_IDX = USER_IDX ? USER_IDX : @"";
    FLEET_ID = FLEET_ID ? FLEET_ID : @"";
    DRIVER_IDX = DRIVER_IDX ? DRIVER_IDX : @"";
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"USER_IDX" : USER_IDX,
                                 @"FLEET_ID" : FLEET_ID,
                                 @"DRIVER_IDX" : DRIVER_IDX,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_DeleteDriver parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                [self successOfDeleteDriver:indexPath];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            }else {
                
                [self failureOfDeleteDriver:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
        } @catch (NSException *exception) {
            
            [self failureOfDeleteDriver:@"请求失败"];
            LMLog(@"%@时，请求失败，chrsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfDeleteDriver:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数
- (void)successOfDeleteDriver:(NSIndexPath *)indexPath {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfDeleteDriver:)]) {
            
            [_delegate successOfDeleteDriver:indexPath];
        }
    });
}


- (void)failureOfDeleteDriver:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfDeleteDriver:)]) {
            
            [_delegate failureOfDeleteDriver:msg];
        }
    });
}

@end
