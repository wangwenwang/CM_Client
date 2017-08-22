//
//  AddFleetService.m
//  CMClient
//
//  Created by 凯东源 on 17/2/23.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AddFleetService.h"
#import <AFNetworking.h>

@implementation AddFleetService

#define kAPIName @"添加车队"

#pragma mark - 添加车队
- (void)addFleet:(NSString *)USER_IDX andFLEET_PROPERTY:(NSString *)FLEET_PROPERTY andTMS_NAME:(NSString *)TMS_NAME andFLEET_NAME:(NSString *)FLEET_NAME andFLEET_DESC:(NSString *)FLEET_DESC andCONTACT_PERSON:(NSString *)CONTACT_PERSON andCONTACT_TEL:(NSString *)CONTACT_TEL {
    
    USER_IDX = USER_IDX ? USER_IDX : @"";
    FLEET_PROPERTY = FLEET_PROPERTY ? FLEET_PROPERTY : @"";
    TMS_NAME = TMS_NAME ? TMS_NAME : @"";
    FLEET_NAME = FLEET_NAME ? FLEET_NAME : @"";
    FLEET_DESC = FLEET_DESC ? FLEET_DESC : @"";
    CONTACT_PERSON = CONTACT_PERSON ? CONTACT_PERSON : @"";
    CONTACT_TEL = CONTACT_TEL ? CONTACT_TEL : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"USER_IDX" : USER_IDX,
                                 @"FLEET_PROPERTY" : FLEET_PROPERTY,
                                 @"TMS_NAME" : TMS_NAME,
                                 @"FLEET_NAME" : FLEET_NAME,
                                 @"FLEET_DESC" : FLEET_DESC,
                                 @"CONTACT_PERSON" : CONTACT_PERSON,
                                 @"CONTACT_TEL" : CONTACT_TEL,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_AddFleet parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
        NSInteger type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        
        if(type == 1) {
            
            LMLog(@"%@成功，msg:%@", kAPIName, msg);
            if([_delegate respondsToSelector:@selector(successOfAddFleet:)]) {
                [_delegate successOfAddFleet:msg];
            }
        }else {
            
            LMLog(@"%@失败，msg:%@", kAPIName, msg);
            [self failureOfAddFleet:[NSString stringWithFormat:@"添加失败:%@", msg]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
        [self failureOfAddFleet:@"请求失败"];
    }];
}


- (void)failureOfAddFleet:(NSString *)msg {
    if([_delegate respondsToSelector:@selector(failureOfAddFleet:)]) {
        [_delegate failureOfAddFleet:msg];
    }
}

@end
