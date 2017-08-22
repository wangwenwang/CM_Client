//
//  PersonalInfoService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

/// 获取个人信息 回调协议
@protocol PersonalInfoServiceDelegate <NSObject>

@optional
- (void)successOfGetUserInfo:(UserModel *)userM;

@optional
- (void)failureOfGetUserInfo:(NSString *)msg;

@end

@interface PersonalInfoService : NSObject

@property (weak, nonatomic) id<PersonalInfoServiceDelegate> delegate;

- (void)GetUserInfo:(NSString *)UserId;

@end
