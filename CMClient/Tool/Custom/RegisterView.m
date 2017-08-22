//
//  RegisterView.m
//  CMClient
//
//  Created by 凯东源 on 17/3/1.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "RegisterView.h"
#import <Masonry.h>

@implementation RegisterView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        
        self.layer.cornerRadius = 5.0f;
        self.backgroundColor = [UIColor colorWithRed:217 / 255.0 green:217 / 255.0 blue:217 / 255.0 alpha:1.0];
        
        UILabel *label = [[UILabel alloc] init];
        label.text = _text;
    
        
//        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return self;
}

@end
