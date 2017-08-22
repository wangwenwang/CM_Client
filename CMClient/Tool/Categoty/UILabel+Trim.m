//
//  UILabel+Trim.m
//  CMClient
//
//  Created by 凯东源 on 17/5/17.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "UILabel+Trim.h"

@implementation UILabel (Trim)


- (NSString *)textTrim {
    NSCharacterSet  *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self.text stringByTrimmingCharactersInSet:set];
}

@end
