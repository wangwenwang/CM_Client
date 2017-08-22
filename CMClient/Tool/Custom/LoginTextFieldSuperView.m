//
//  LoginTextFieldSuperView.m
//  CMClient
//
//  Created by 凯东源 on 17/2/24.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "LoginTextFieldSuperView.h"

@implementation LoginTextFieldSuperView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        
        self.alpha = 0.2;
        self.layer.cornerRadius = 5.0f;
    }
    return self;
}

@end
