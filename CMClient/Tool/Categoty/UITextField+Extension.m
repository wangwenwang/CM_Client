//
//  UITextField+Extension.m
//  CMClient
//
//  Created by 凯东源 on 17/3/1.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)


- (NSString *)textTrim {
    NSCharacterSet  *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self.text stringByTrimmingCharactersInSet:set];
}

- (BOOL)isPureFloat {
    NSScanner* scan = [NSScanner scannerWithString:[self textTrim]];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

@end
