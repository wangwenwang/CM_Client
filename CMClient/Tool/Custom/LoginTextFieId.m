//
//  LoginTextFieId.m
//  CMClient
//
//  Created by 凯东源 on 17/2/24.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "LoginTextFieId.h"

@implementation LoginTextFieId

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        
        self.alpha = 0.8;
        self.layer.cornerRadius = 5.0f;
        self.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor clearColor];
//        [self setValue:[UIColor colorWithRed:166 / 255.0 green:232 / 255.0 blue:184 / 255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
       [self setValue:[UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:236 / 255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    }
    return self;
}

@end
