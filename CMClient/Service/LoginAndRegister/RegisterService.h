//
//  RegisterService.h
//  CMClient
//
//  Created by 凯东源 on 17/1/14.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 用户注册协议
@protocol RegisterServiceDelegate <NSObject>

@optional
- (void)successOfRegister;

@optional
- (void)failureOfRegister:(NSString *)msg;

@end


/// RegisterService类
@interface RegisterService : NSObject

@property (weak, nonatomic)id <RegisterServiceDelegate> delegate;



/**
 注册

 @param phoneNo       手机号
 @param psw           密码
 @param UserType      用户类型
 @param vCode         验证码
 @param name          真实姓名
 @param address       常住地
 @param recommenderNo 推荐人
 */
- (void)registerX:(NSString *)phoneNo andPassword:(NSString *)psw andUserType:(NSString *)UserType andVerificationCode:(NSString *)vCode andName:(NSString *)name andAddress:(NSString *)address andRecommenderNo:(NSString *)recommenderNo;


@end
