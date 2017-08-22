//
//  RegisterService.m
//  CMClient
//
//  Created by 凯东源 on 17/1/14.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "RegisterService.h"
#import "AppDelegate.h"
#import <AFNetworking.h>

@interface RegisterService ()


@property (strong, nonatomic) AppDelegate *app;

@end

@implementation RegisterService


#define kAPIName @"注册"


#pragma mark - 注册

- (instancetype)init {
    if (self = [super init]) {
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


- (void)registerX:(NSString *)phoneNo andPassword:(NSString *)psw andUserType:(NSString *)UserType andVerificationCode:(NSString *)vCode andName:(NSString *)name andAddress:(NSString *)address andRecommenderNo:(NSString *)recommenderNo {
    
    
    phoneNo = phoneNo ? phoneNo : @"";
    psw = psw ? psw : @"";
    UserType = UserType ? UserType : @"";
    vCode = vCode ? vCode : @"";
    name = name ? name : @"";
    address = address ? address : @"";
    recommenderNo = recommenderNo ? recommenderNo : @"";
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"UserCode" : phoneNo,
                                 @"PassWord" : psw,
                                 @"UserType" : UserType,
                                 @"CompanyName" : @"",
                                 @"UserName" : name,
                                 @"strLicense" : @"",
                                 @"Address" : address
                                 };
    
    LMLog(@"请求%@参数:%@", kAPIName, parameters);
    
    [manager POST:API_register parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        @try {
            LMLog(@"%@,请求成功,返回值:%@", kAPIName, responseObject);
            
            int _type = [responseObject[@"type"] intValue];
            NSString *msg = responseObject[@"msg"];
            
            if(_type == 1) {
                
                [self successOfRegister];
                LMLog(@"%@成功，msg:%@", kAPIName, msg);
                
            } else {
                
                [self failureOfRegister:msg];
                LMLog(@"%@失败，msg:%@", kAPIName, msg);
            }
        } @catch (NSException *exception) {
            
            LMLog(@"%@失败，carsh", kAPIName);
            [self failureOfRegister:@"请求失败"];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfRegister:@"请求失败"];
        LMLog(@"%@时，请求失败，error:%@", kAPIName, error);
    }];
}


#pragma mark - 功能函数

- (void)successOfRegister {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(successOfRegister)]) {
            
            [_delegate successOfRegister];
        }
    });
}


- (void)failureOfRegister:(NSString *)msg {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if([_delegate respondsToSelector:@selector(failureOfRegister:)]) {
            
            [_delegate failureOfRegister:msg];
        }
    });
}

@end
