//
//  DeleteTruckService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/7.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "DeleteTruckService.h"
#import <AFNetworking.h>

@implementation DeleteTruckService

#define kAPIName @"删除车辆"

#pragma mark - 删除车辆
- (void)DeleteVehicle:(NSString *)USER_IDX andFLEET_ID:(NSString *)FLEET_ID andVEHICLE_IDX:(NSString *)VEHICLE_IDX andCellIndexPathRow:(NSIndexPath *)indexPath {
    
    
    USER_IDX = USER_IDX ? USER_IDX : @"";
    FLEET_ID = FLEET_ID ? FLEET_ID : @"";
    VEHICLE_IDX = VEHICLE_IDX ? VEHICLE_IDX : @"";
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"USER_IDX" : USER_IDX,
                                 @"FLEET_ID" : FLEET_ID,
                                 @"VEHICLE_IDX" : VEHICLE_IDX,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_DeleteVehicle parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                [self successOfDeleteTruck:indexPath];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            }else {
                
                [self failureOfDeleteTruck:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
        } @catch (NSException *exception) {
            
            [self failureOfDeleteTruck:@"请求失败"];
            LMLog(@"%@时，请求失败，chrsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfDeleteTruck:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数
- (void)successOfDeleteTruck:(NSIndexPath *)indexPath {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfDeleteTruck:)]) {
            
            [_delegate successOfDeleteTruck:indexPath];
        }
    });
}


- (void)failureOfDeleteTruck:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfDeleteTruck:)]) {
            
            [_delegate failureOfDeleteTruck:msg];
        }
    });
}

@end
