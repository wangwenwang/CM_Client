//
//  FleetListService.m
//  CMClient
//
//  Created by 凯东源 on 17/2/22.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "FleetListService.h"
#import <AFNetworking.h>
#import "FleetListModel.h"

@implementation FleetListService

#define kAPIName @"获取车队列表"

#pragma mark - 获取车队列表
- (void)getFleetList:(NSString *)UserId {
    
    UserId = UserId ? UserId : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"UserId" : UserId,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_GetFleetList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
        
        @try {
            
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            
            if(type == 1) {
                
                NSDictionary *result = responseObject[@"result"];
                
                FleetListModel *m = [[FleetListModel alloc] initWithDictionary:result];
                
                if([_delegate respondsToSelector:@selector(successOfGetFleetList:)]) {
                    
                    [_delegate successOfGetFleetList:m];
                }
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            } else if(type == -1) {  //请求成功，没有数据
                
                if([_delegate respondsToSelector:@selector(successGetFleetListNoData)]) {
                    
                    [_delegate successGetFleetListNoData];
                }
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            } else if(type == 0) {
                
                [self failureOfGetFleetList:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            } else {
                
                [self failureOfGetFleetList:msg];
                LMLog(@"%@失败，msg:%@，未知type", kAPIName, msg);
            }
        } @catch (NSException *exception) {
            
            [self failureOfGetFleetList:[NSString stringWithFormat:@"%@失败，carsh", kAPIName]];
            LMLog(@"%@失败，msg:%@", kAPIName, @"carsh");
        }
        
    }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
              [self failureOfGetFleetList:@"请求失败"];
              LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
          }];
}


- (void)failureOfGetFleetList:(NSString *)msg {
    if([_delegate respondsToSelector:@selector(failureOfGetFleetList:)]) {
        [_delegate failureOfGetFleetList:msg];
    }
}

@end
