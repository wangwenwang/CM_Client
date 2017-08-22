//
//  UpdatePasswordService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 修改用户密码 回调协议
@protocol UpdatePasswordServiceDelegate <NSObject>

@optional
- (void)successOfUpdatePassword;

@optional
- (void)failureOfUpdatePassword:(NSString *)msg;

@end

@interface UpdatePasswordService : NSObject

@property (weak, nonatomic) id<UpdatePasswordServiceDelegate> delegate;


/**
 修改用户密码

 @param UserId      ID
 @param OldPassWord 旧密码
 @param NewPassWord 新密码
 */
- (void)UpdatePassword:(NSString *)UserId andOldPassWord:(NSString *)OldPassWord  andNewPassWord:(NSString *)NewPassWord;

@end
