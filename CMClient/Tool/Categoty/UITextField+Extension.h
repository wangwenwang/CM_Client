//
//  UITextField+Extension.h
//  CMClient
//
//  Created by 凯东源 on 17/3/1.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)


/**
 字符串去前后空格

 @return 已经去前后空格的字符串
 */
- (NSString *)textTrim;



/**
 判断字符串是否小数或整数

 @return 是否小数或整数
 */
- (BOOL)isPureFloat;

@end
