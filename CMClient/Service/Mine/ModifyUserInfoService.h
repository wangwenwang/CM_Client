//
//  ModifyUserInfoService.h
//  CMClient
//
//  Created by 凯东源 on 17/5/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 修改个人信息 回调协议
@protocol ModifyUserInfoServiceDelegate <NSObject>

@optional
- (void)successOfModifyUserInfo;

@optional
- (void)failureOfModifyUserInfo:(NSString *)msg;

@end

@interface ModifyUserInfoService : NSObject

@property (weak, nonatomic) id<ModifyUserInfoServiceDelegate> delegate;



/**
 修改个人信息

 @param UserInfo 个人信息
 */
- (void)ModifyUserInfo:(NSDictionary *)UserInfo;

@end
