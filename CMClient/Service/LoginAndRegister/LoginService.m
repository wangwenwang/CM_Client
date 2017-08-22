//
//  LoginService.m
//  CMClient
//
//  Created by 凯东源 on 17/1/14.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "LoginService.h"
#import "AppDelegate.h"
#import <AFNetworking.h>
#import "NSString+MD5.h"
#import "Tools.h"

@interface LoginService ()

@property (strong, nonatomic) AppDelegate *app;

@end

@implementation LoginService

- (instancetype)init {
    
    if (self = [super init]) {
        
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}


#pragma mark - 登录请求

- (void)login:(NSString *)UserCode andPassWord:(NSString *)PassWord andVerifiCode:(NSString *)VerifiCode {
    
    UserCode = UserCode ? UserCode : @"";
    PassWord = PassWord ? PassWord : @"";
    VerifiCode = VerifiCode ? VerifiCode : @"";
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"UserCode" : UserCode,
                                 @"PassWord" : [NSString MD5:PassWord],
                                 @"strLicense" : @""
                                 };
    
    NSLog(@"参数:%@", parameters);
    
    [manager POST:API_Login parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"请求成功---%@", responseObject);
        int _type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        if(_type == 1) {
            
            NSArray *arrResult = responseObject[@"result"];
            UserModel *userM = [[UserModel alloc] initWithDictionary:arrResult[0]];
            
            if([userM.uSERTYPE isEqualToString:kCLIENT]) {
                
//                "result" : [
//                {
//                    "USERTYPE" : "Client",
//                    "IDX" : "35",
//                    "USERNAME" : "fvcg"
//                }
//                            ]
                userM.uSERCODE = UserCode;
                userM.pASSWORD = PassWord;
                
                [Tools saveUserModelInUserDefaults:userM];
                
                _app.user.uSERCODE = UserCode;
                _app.user.pASSWORD = PassWord;
                _app.user.iDX = userM.iDX;
                _app.user.uSERTYPE = userM.uSERTYPE;
                
                [self successOfLogin];
            } else {
                
                [self failureOfLogin:@"帐号或密码不正确"];
            }
            
        } else {
            
            [self failureOfLogin:msg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self failureOfLogin:@"请求失败"];
        LMLog(@"请求失败---%@", error);
        
    }];
}


#pragma mark - 上传Token

- (void)uploadToken:(NSString *)UserId andCID:(NSString *)CID andToken:(NSString *)Token {
    
    UserId = UserId ? UserId : @"";
    CID = CID ? CID : @"";
    Token = Token ? Token : @"";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSDictionary *parameters = @{@"UserId" : UserId,
                                 @"CID" : CID,
                                 @"Token" : Token,
                                 @"strLicense" : @""
                                 };
    
    LMLog(@"上传Token:%@", parameters);
    
    [manager POST:API_SavaPushToken parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"请求成功---%@", responseObject);
        NSInteger type = [responseObject[@"type"] intValue];
        NSString *msg = responseObject[@"msg"];
        if(type == 1) {
            
            LMLog(@"上传Token成功，msg:%@", msg);
        }else {
            
            LMLog(@"上传Token失败，msg:%@", msg);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        LMLog(@"上传Token时，请求失败，error:%@", error);
    }];
}


#pragma mark - 功能函数

- (void)successOfLogin {
    
    if([_delegate respondsToSelector:@selector(successOfLogin)]) {
        
        [_delegate successOfLogin];
    }
}


- (void)failureOfLogin:(NSString *)msg {
    
    if([_delegate respondsToSelector:@selector(failureOfLogin:)]) {
        
        [_delegate failureOfLogin:msg];
    }
}

@end
