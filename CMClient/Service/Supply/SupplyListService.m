//
//  SupplyListService.m
//  CMClient
//
//  Created by 凯东源 on 17/3/1.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "SupplyListService.h"
#import <AFNetworking.h>
#import "SupplyListModel.h"

@implementation SupplyListService

#define kAPIName @"获取货源列表"

#pragma mark - 获取货源列表

- (void)GetSupplyList:(NSString *)result andSTART_DATE:(NSString *)START_DATE andEND_DATE:(NSString *)END_DATE andSUPPLY_STATE:(NSString *)SUPPLY_STATE andPAGE:(NSUInteger)PAGE andPAGE_COUNT:(NSUInteger)PAGE_COUNT andUSER_IDX:(NSString *)USER_IDX andSUPPLY_WOKERFLOW:(NSString *)SUPPLY_WOKERFLOW andDRIVER_IDX:(NSString *)DRIVER_IDX {
    
    result = result ? result : @"";
    START_DATE = START_DATE ? START_DATE : @"";
    END_DATE = END_DATE ? END_DATE : @"";
    SUPPLY_STATE = SUPPLY_STATE ? SUPPLY_STATE : @"";
    PAGE = PAGE ? PAGE : 0;
    PAGE_COUNT = PAGE_COUNT ? PAGE_COUNT : 0;
    SUPPLY_WOKERFLOW = SUPPLY_WOKERFLOW ? SUPPLY_WOKERFLOW : @"";
    USER_IDX = USER_IDX ? USER_IDX : @"";
    DRIVER_IDX = DRIVER_IDX ? DRIVER_IDX : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"strJson" : result,
                                 @"START_DATE" : START_DATE,
                                 @"END_DATE" : END_DATE,
                                 @"SUPPLY_STATE" : SUPPLY_STATE,
                                 @"PAGE" : @(PAGE),
                                 @"PAGE_COUNT" : @(PAGE_COUNT),
                                 @"USER_IDX" : USER_IDX,
                                 @"SUPPLY_WOKERFLOW" : SUPPLY_WOKERFLOW,
                                 @"DRIVER_IDX" : DRIVER_IDX,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_GetSupplyList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
        NSInteger type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(type == 1) {
            
            NSDictionary *dict = responseObject[@"result"];
            NSArray *array = dict[@"Supply"];
            
            NSMutableArray *arrM = [[NSMutableArray alloc] init];
            for(int i = 0; i < array.count; i++) {
                
                SupplyListModel *m = [[SupplyListModel alloc] initWithDictionary:array[i]];
                [arrM addObject:m];
            }
            
            [self successOfSupplyList:arrM];
            LMLog(@"%@成功，msg:%@", kAPIName, msg);
        } else if(type == -2) {
            
            [self successOfSupplyListNoData];
        } else {
            
            [self failureOfSupplyList:msg];
            LMLog(@"%@失败，msg:%@", kAPIName, msg);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfSupplyList:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数
- (void)successOfSupplyList:(NSArray *)supplys {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if([_delegate respondsToSelector:@selector(successOfSupplyList:)]) {
            [_delegate successOfSupplyList:supplys];
        }
    });
}


- (void)successOfSupplyListNoData {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if([_delegate respondsToSelector:@selector(successOfSupplyListNoData)]) {
            [_delegate successOfSupplyListNoData];
        }
    });
}


- (void)failureOfSupplyList:(NSString *)msg {
    dispatch_async(dispatch_get_main_queue(), ^{
        if([_delegate respondsToSelector:@selector(failureOfSupplyList:)]) {
            [_delegate failureOfSupplyList:msg];
        }
    });
}

@end
