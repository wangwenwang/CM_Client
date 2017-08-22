//
//  LoginService.h
//  CMClient
//
//  Created by 凯东源 on 17/1/14.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 回调协议
@protocol LoginServiceDelegate <NSObject>

@optional
- (void)successOfLogin;

@optional
- (void)failureOfLogin:(NSString *)msg;

@end


/// LoginService类
@interface LoginService : NSObject

@property (weak, nonatomic)id <LoginServiceDelegate> delegate;

/**
 * 登陆
 *
 * userName: 用户名
 *
 * password: 用户登陆密码
 *
 */
- (void)login:(NSString *)UserCode andPassWord:(NSString *)PassWord andVerifiCode:(NSString *)VerifiCode;


/**
 上传Token

 @param UserId 用户ID
 @param CID    推送CID
 @param Token  设备Token
 */
- (void)uploadToken:(NSString *)UserId andCID:(NSString *)CID andToken:(NSString *)Token;

@end
