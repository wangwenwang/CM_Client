//
//  TruckListService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/2.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "TruckListService.h"
#import <AFNetworking.h>

@implementation TruckListService

#define kGetVehicleList @"获取车辆列表"

#pragma mark - 获取APP推送消息
- (void)GetVehicleList:(NSString *)FleetIdx andUserId:(NSString *)UserId {
    
    FleetIdx = FleetIdx ? FleetIdx : @"";
    UserId = UserId ? UserId : @"";
    
    @try {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        NSDictionary *parameters = @{@"FleetIdx" : FleetIdx,
                                     @"UserId" : UserId,
                                     @"strLicense" : @""
                                     };
        
        LMLog(@"请求%@参数:%@", kGetVehicleList, parameters);
        
        [manager POST:API_GetVehicleList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            nil;
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            LMLog(@"%@,请求成功,返回值:%@", kGetVehicleList, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                NSDictionary *dict = responseObject[@"result"];
                
                TruckListModel *m = [[TruckListModel alloc] initWithDictionary:dict];
                
                // 由于安卓没处理type = -2，所以麻烦点
                if(m.truck.count == 0) {
                    
                    [self successGetTruckListNoData];
                } else {
                    
                    [self successOfGetTruckList:m];
                }
                LMLog(@"%@成功，msg:%@", kGetVehicleList, msg);
            } else if(type == -2) {
                
                [self successGetTruckListNoData];
            } else {
                
                [self failureOfGetTruckList:msg];
                LMLog(@"%@失败，msg:%@", kGetVehicleList, msg);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self failureOfGetTruckList:@"请求失败"];
            LMLog(@"%@时，请求失败，error:%@", kGetVehicleList, error);
        }];
    } @catch (NSException *exception) {
        
        [self failureOfGetTruckList:exception.description];
    }
}


#pragma mark - 功能函数
- (void)failureOfGetTruckList:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfGetTruckList:)]) {
            
            [_delegate failureOfGetTruckList:msg];
        }
    });
}


- (void)successGetTruckListNoData {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successGetTruckListNoData)]) {
            
            [_delegate successGetTruckListNoData];
        }
    });
}


- (void)successOfGetTruckList:(TruckListModel *)trucks {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfGetTruckList:)]) {
            
            [_delegate successOfGetTruckList:trucks];
        }
    });
}

@end
