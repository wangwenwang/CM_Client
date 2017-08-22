//
//  AppDelegate.h
//  CMClient
//
//  Created by 凯东源 on 17/1/14.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UserModel *user;

@property (strong, nonatomic) NSString *DEVICE_TOKEN;

@property (strong, nonatomic) NSString *CID;

@property (assign, nonatomic) int lastPayloadIndex;

@end

