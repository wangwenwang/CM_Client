//
//  TruckDetailService.m
//  CMDriver
//
//  Created by 凯东源 on 17/5/25.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "TruckDetailService.h"
#import <AFNetworking.h>

#define kAPIName @"查询车辆"

@implementation TruckDetailService

- (void)SearchVehicle:(NSString *)PLATE_NUMBER andstrFleetIdx:(NSString *)strFleetIdx {
    
    PLATE_NUMBER = PLATE_NUMBER ? PLATE_NUMBER : @"";
    strFleetIdx = strFleetIdx ? strFleetIdx : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"PLATE_NUMBER" : PLATE_NUMBER,
                                 @"strFleetIdx" : strFleetIdx,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_SearchVehicle parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                TruckDetailModel *truckDetailM = [[TruckDetailModel alloc] initWithDictionary:responseObject[@"result"][0]];
                
                [self successOfTruckDetail:truckDetailM];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            }else {
                
                [self failureOfTruckDetail:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
        } @catch (NSException *exception) {
            
            [self failureOfTruckDetail:@"请求失败"];
            LMLog(@"%@时，请求失败，chrsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfTruckDetail:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数

- (void)successOfTruckDetail:(TruckDetailModel *)truckDetailM {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfTruckDetail:)]) {
            
            [_delegate successOfTruckDetail:truckDetailM];
        }
    });
}


- (void)failureOfTruckDetail:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfTruckDetail:)]) {
            
            [_delegate failureOfTruckDetail:msg];
        }
    });
}

@end
