//
//  TextFieldView_Underline.m
//  CMClient
//
//  Created by 凯东源 on 17/5/10.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "TextFieldView_Underline.h"
#import "Tools.h"
#import <Masonry.h>

@implementation TextFieldView_Underline

- (void)setLeftTitle:(NSString *)leftTitle {
    
    UILabel *label = [[UILabel alloc] init];
    [label setTextColor:RGB(36, 36, 36)];
    label.text = leftTitle;
    [label setFont:[UIFont systemFontOfSize:15.0]];
    [self addSubview:label];
    
    UITextField *textF = [[UITextField alloc] init];
    [self addSubview:textF];
    
    UIView *underLine = [[UIView alloc] init];
    underLine.backgroundColor = [UIColor grayColor];
    [label addSubview:underLine];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
    
    [textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.top.equalTo(@0);
        make.bottom.equalTo(label.mas_bottom).offset(0);
    }];
    
    [underLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(1));
        make.left.equalTo(textF.mas_left).offset(0);
        make.right.equalTo(textF.mas_right).offset(0);
        make.bottom.equalTo(textF.mas_bottom).offset(0);
    }];
}

@end
