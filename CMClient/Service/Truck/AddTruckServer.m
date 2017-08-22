//
//  AddTruckServer.m
//  CMClient
//
//  Created by 凯东源 on 17/3/2.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AddTruckServer.h"
#import <AFNetworking.h>

@implementation AddTruckServer

#define kAPIName @"添加车辆"

#pragma mark - 添加车辆
- (void)addTruck:(NSString *)USER_IDX andFLEET_ID:(NSString *)FLEET_ID andPLATE_NUMBER:(NSString *)PLATE_NUMBER andVEHICLE_MODEL:(NSString *)VEHICLE_MODEL andVEHICLE_SIZE:(NSString *)VEHICLE_SIZE andBRAND_MODEL:(NSString *)BRAND_MODEL andVEHICLE_COLOR:(NSString *)VEHICLE_COLOR andMAX_WEIGHT:(CGFloat)MAX_WEIGHT andMAX_VOLUME:(CGFloat)MAX_VOLUME andPictureFile1:(NSString *)PictureFile1 andPictureFile2:(NSString *)PictureFile2 andAutographFile:(NSString *)AutographFile {
    
    
    USER_IDX = USER_IDX ? USER_IDX : @"";
    FLEET_ID = FLEET_ID ? FLEET_ID : @"";
    PLATE_NUMBER = PLATE_NUMBER ? PLATE_NUMBER : @"";
    VEHICLE_MODEL = VEHICLE_MODEL ? VEHICLE_MODEL : @"";
    VEHICLE_SIZE = VEHICLE_SIZE ? VEHICLE_SIZE : @"";
    BRAND_MODEL = BRAND_MODEL ? BRAND_MODEL : @"";
    VEHICLE_COLOR = VEHICLE_COLOR ? VEHICLE_COLOR : @"";
    MAX_WEIGHT = MAX_WEIGHT ? MAX_WEIGHT : 0.0;
    MAX_VOLUME = MAX_VOLUME ? MAX_VOLUME : 0.0;
    PictureFile1 = PictureFile1 ? PictureFile1 : @"";
    PictureFile2 = PictureFile2 ? PictureFile2 : @"";
    AutographFile = AutographFile ? AutographFile : @"";
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"USER_IDX" : USER_IDX,
                                 @"FLEET_ID" : FLEET_ID,
                                 @"PLATE_NUMBER" : PLATE_NUMBER,
                                 @"VEHICLE_MODEL" : VEHICLE_MODEL,
                                 @"VEHICLE_SIZE" : VEHICLE_SIZE,
                                 @"BRAND_MODEL" : BRAND_MODEL,
                                 @"VEHICLE_COLOR" : VEHICLE_COLOR,
                                 @"MAX_WEIGHT" : @(MAX_WEIGHT),
                                 @"MAX_VOLUME" : @(MAX_VOLUME),
                                 @"PictureFile1" : PictureFile1,
                                 @"PictureFile2" : PictureFile2,
                                 @"AutographFile" : AutographFile,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_AddVehicle parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                [self successOfAddTruck];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            }else {
                
                [self failureOfAddTruck:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
        } @catch (NSException *exception) {
            
            [self failureOfAddTruck:@"请求失败"];
            LMLog(@"%@时，请求失败，chrsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfAddTruck:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数
- (void)successOfAddTruck {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfAddTruck)]) {
            
            [_delegate successOfAddTruck];
        }
    });
}


- (void)failureOfAddTruck:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfAddTruck:)]) {
            
            [_delegate failureOfAddTruck:msg];
        }
    });
}

@end
