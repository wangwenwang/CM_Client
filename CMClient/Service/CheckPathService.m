//
//  CheckPathService.m
//  CMClient
//
//  Created by 凯东源 on 17/2/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "CheckPathService.h"
#import <AFNetworking.h>
#import "LocationModel.h"

@implementation CheckPathService


#define kAPIName @"查看订单路线"


- (instancetype)init {
    if(self = [super init]) {
        _orderLocations = [[NSMutableArray alloc] init];
    }
    return self;
}


/**
 * 获取订单线路位置点集合
 *
 * orderIdx: 订单的 idx
 *
 * httpresponseProtocol: 网络请求协议
 */
- (void)getOrderLocaltions:(NSString *)idx {
    
    idx = idx ? idx : @"";
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                  idx, @"OrderId",
                  @"", @"strLicense",
                  //                  @"ios", @"UUID",
                  nil];
    
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    __weak typeof(self)wkSelf = self;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:API_GetOrderLocaltion parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
        int type = 	[responseObject[@"type"] intValue];
        if(type == 1) {
            
            NSArray *arrResult = responseObject[@"result"];
            for (int i = 0; i < arrResult.count; i++) {
                LocationModel *location = [[LocationModel alloc] init];
                [location setDict:arrResult[i]];
                location.CORDINATEY = [arrResult[i][@"CORDINATEY"] doubleValue];
                location.CORDINATEX = [arrResult[i][@"CORDINATEX"] doubleValue];
                [wkSelf.orderLocations addObject:location];
                NSLog(@"%@", location);
            }
            [self success];
        }else {
            
            NSString *msg = responseObject[@"msg"];
            [self failure:msg];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"请求失败---%@", error);
        [self failure:@"请求失败"];
    }];
}


#pragma mark - 功能函数

- (void)success {
    
    if([_delegate respondsToSelector:@selector(success)]) {
        [_delegate success];
    }
}


- (void)failure:(NSString *)msg {
    if([_delegate respondsToSelector:@selector(failure:)]) {
        [_delegate failure:msg];
    }
}

@end
