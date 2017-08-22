//
//  ZYListService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/2.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "ZYListService.h"
#import <AFNetworking.h>
#import "ShipmentListModel.h"

@implementation ZYListService

#define kAPIName @"获取装运列表"

#pragma mark - 获取装运列表
- (void)GetShipmentList:(NSString *)UserIdx andSHIPMENT_STATE:(NSString *)SHIPMENT_STATE andSTART_DATE:(NSString *)START_DATE andEND_DATE:(NSString *)END_DATE  andPAGE:(NSUInteger)PAGE andPAGE_COUNT:(NSUInteger)PAGE_COUNT {
    
    UserIdx = UserIdx ? UserIdx : @"";
    SHIPMENT_STATE = SHIPMENT_STATE ? SHIPMENT_STATE : @"";
    START_DATE = START_DATE ? START_DATE : @"";
    END_DATE = END_DATE ? END_DATE : @"";
    PAGE = PAGE ? PAGE : 0;
    PAGE_COUNT = PAGE_COUNT ? PAGE_COUNT : 0;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"UserIdx" : @"",
                                 @"SHIPMENT_STATE" : SHIPMENT_STATE,
                                 @"START_DATE" : START_DATE,
                                 @"END_DATE" : END_DATE,
                                 @"PAGE" : @(PAGE),
                                 @"PAGE_COUNT" : @(PAGE_COUNT),
                                 @"AppUserIdx" : UserIdx,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_GetShipmentList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            NSInteger type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(type == 1) {
                
                NSDictionary *result = responseObject[@"result"];
                NSArray *array = result[@"Shipment"];
                
                NSMutableArray *arrM = [[NSMutableArray alloc] init];
                for (int i = 0; i < array.count; i++) {
                    
                    ShipmentListModel *m = [[ShipmentListModel alloc] initWithDictionary:array[i]];
                    [arrM addObject:m];
                }
                
                [self successOfZYList:[arrM copy]];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            } else if(type == -2) {
                
                [self successOfZYListNoData];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
            } else {
                
                [self failureOfZYList:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
            
            
        } @catch (NSException *exception) {
            
            [self failureOfZYList:@"请求失败"];
            LMLog(@"%@时，carsh", kAPIName);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfZYList:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数
- (void)successOfZYList:(NSArray *)zys {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if([_delegate respondsToSelector:@selector(successOfZYList:)]) {
            [_delegate successOfZYList:zys];
        }
    });
}


- (void)successOfZYListNoData {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if([_delegate respondsToSelector:@selector(successOfZYListNoData)]) {
            [_delegate successOfZYListNoData];
        }
    });
}


- (void)failureOfZYList:(NSString *)msg {
    dispatch_async(dispatch_get_main_queue(), ^{
        if([_delegate respondsToSelector:@selector(failureOfZYList:)]) {
            [_delegate failureOfZYList:msg];
        }
    });
}

@end
