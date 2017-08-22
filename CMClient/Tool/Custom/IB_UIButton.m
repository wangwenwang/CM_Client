//
//  IB_UIButton.m
//  ZSDOrder
//
//  Created by 凯东源 on 17/4/19.
//  Copyright © 2017年 凯东源. All rights reserved.
//

#import "IB_UIButton.h"

IB_DESIGNABLE

@implementation IB_UIButton

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius  = _cornerRadius;
    self.layer.masksToBounds = YES;
}

@end
