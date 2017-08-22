//
//  NSString+MD5.h
//  CMClient
//
//  Created by 凯东源 on 17/1/17.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

/** 将字符串经MD5加密 */
+ (NSString *)MD5:(NSString *)str;

- (NSString *)MD5;
@end
