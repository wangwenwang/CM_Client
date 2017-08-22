//
//  LoginButton.m
//  CMClient
//
//  Created by 凯东源 on 17/2/24.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "LoginButton.h"

@implementation LoginButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        
        self.layer.cornerRadius = 5.0f;
        self.backgroundColor = [UIColor whiteColor];
        [self setTitleColor:[UIColor colorWithRed:0 / 255.0 green:90 / 255.0 blue:55 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    }
    return self;
}
@end
