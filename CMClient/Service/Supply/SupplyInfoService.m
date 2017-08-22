//
//  SupplyInfoService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "SupplyInfoService.h"
#import <AFNetworking.h>

@implementation SupplyInfoService

#define kAPIGetSupplyInfo @"获取货源详情"

#define kAPIReceivingSupply @"竞标货源"

#pragma mark - 获取货源详情

- (void)GetSupplyInfo:(NSString *)IDX {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    IDX = IDX ? IDX : @"";
    
    NSDictionary *parameters = @{@"IDX" : IDX,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIGetSupplyInfo, parameters);
    
    [manager POST:API_GetSupplyInfo parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"%@,请求成功,返回值:%@", kAPIGetSupplyInfo, responseObject);
        NSInteger type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(type == 1) {
            
            NSDictionary *dict = responseObject[@"result"];
            
            SupplyInfoModel *m = [[SupplyInfoModel alloc] initWithDictionary:dict];
            
            [self successOfSupplyInfo:m];
            LMLog(@"%@成功，msg:%@", kAPIGetSupplyInfo, msg);
        } else {
            
            [self failureOfSupplyInfo:msg];
            LMLog(@"%@失败，msg:%@", kAPIGetSupplyInfo, msg);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfSupplyInfo:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIGetSupplyInfo, error);
    }];
}


#pragma mark - 竞标货源

- (void)ReceivingSupply:(NSString *)RECEIVING_IDX andUSER_TEL:(NSString *)USER_TEL andFLEET_IDX:(NSString *)FLEET_IDX andFLEET_NAME:(NSString *)FLEET_NAME andVEHICLE_IDX:(NSString *)VEHICLE_IDX andPLATE_NUMBER:(NSString *)PLATE_NUMBER andVEHICLE_TYPE:(NSString *)VEHICLE_TYPE andVEHICLE_SIZE:(NSString *)VEHICLE_SIZE andBRAND_MODEL:(NSString *)BRAND_MODEL andIDX:(NSString *)IDX andDRIVER_IDX:(NSString *)DRIVER_IDX andDRIVER_NAME:(NSString *)DRIVER_NAME andDRIVER_TEL:(NSString *)DRIVER_TEL andVERSION_NUMBER:(NSString *)VERSION_NUMBER {
    
    
    RECEIVING_IDX = RECEIVING_IDX ? RECEIVING_IDX : @"";
    USER_TEL = USER_TEL ? USER_TEL : @"";
    FLEET_IDX = FLEET_IDX ? FLEET_IDX : @"";
    FLEET_NAME = FLEET_NAME ? FLEET_NAME : @"";
    VEHICLE_IDX = VEHICLE_IDX ? VEHICLE_IDX : @"";
    PLATE_NUMBER = PLATE_NUMBER ? PLATE_NUMBER : @"";
    VEHICLE_TYPE = VEHICLE_TYPE ? VEHICLE_TYPE : @"";
    VEHICLE_SIZE = VEHICLE_SIZE ? VEHICLE_SIZE : @"";
    BRAND_MODEL = BRAND_MODEL ? BRAND_MODEL : @"";
    IDX = IDX ? IDX : @"";
    DRIVER_IDX = DRIVER_IDX ? DRIVER_IDX : @"";
    DRIVER_NAME = DRIVER_NAME ? DRIVER_NAME : @"";
    DRIVER_TEL = DRIVER_TEL ? DRIVER_TEL : @"";
    VERSION_NUMBER = VERSION_NUMBER ? VERSION_NUMBER : @"";
    
    
    NSDictionary *parameters = @{@"RECEIVING_IDX" : RECEIVING_IDX,
                                 @"USER_TEL" : USER_TEL,
                                 @"FLEET_IDX" : FLEET_IDX,
                                 @"FLEET_NAME" : FLEET_NAME,
                                 @"VEHICLE_IDX" : VEHICLE_IDX,
                                 @"PLATE_NUMBER" : PLATE_NUMBER,
                                 @"VEHICLE_TYPE" : VEHICLE_TYPE,
                                 @"VEHICLE_SIZE" : VEHICLE_SIZE,
                                 @"BRAND_MODEL" : BRAND_MODEL,
                                 @"IDX" : IDX,
                                 @"DRIVER_IDX" : DRIVER_IDX,
                                 @"DRIVER_NAME" : DRIVER_NAME,
                                 @"DRIVER_TEL" : DRIVER_TEL,
                                 @"VERSION_NUMBER" : VERSION_NUMBER,
                                 @"strLicense" : @""
                                 };
    
    
    LMLog(@"请求%@参数:%@", kAPIReceivingSupply, parameters);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:API_ReceivingSupply parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"%@,请求成功,返回值:%@", kAPIReceivingSupply, responseObject);
        NSInteger type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(type == 1) {
            
            [self successOfReceivingSupply];
            LMLog(@"%@成功，msg:%@", kAPIReceivingSupply, msg);
        } else {
            
            [self failureOfReceivingSupply:msg];
            LMLog(@"%@失败，msg:%@", kAPIReceivingSupply, msg);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfReceivingSupply:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIReceivingSupply, error);
    }];
}


#pragma mark - 功能函数
- (void)successOfSupplyInfo:(SupplyInfoModel *)supplyInfoM {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfSupplyInfo:)]) {
            
            [_delegate successOfSupplyInfo:supplyInfoM];
        }
    });
}


- (void)failureOfSupplyInfo:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfSupplyInfo:)]) {
            
            [_delegate failureOfSupplyInfo:msg];
        }
    });
}


- (void)successOfReceivingSupply {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfReceivingSupply)]) {
            
            [_delegate successOfReceivingSupply];
        }
    });
}


- (void)failureOfReceivingSupply:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfReceivingSupply:)]) {
            
            [_delegate failureOfReceivingSupply:msg];
        }
    });
}

@end
