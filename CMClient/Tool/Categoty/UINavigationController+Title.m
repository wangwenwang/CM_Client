//
//  UINavigationController+Title.m
//  CMClient
//
//  Created by 凯东源 on 17/2/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "UINavigationController+Title.h"

@implementation UINavigationController (Title)


- (void)titleText:(NSString *)text andColor:(UIColor *)color {
    self.navigationBar.topItem.title = text;
//    NSDictionary *dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
//    self.navigationBar.titleTextAttributes = dict;
}

@end
