//
//  AddFleetTextField.m
//  CMClient
//
//  Created by 凯东源 on 17/3/1.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AddFleetTextField.h"

@interface AddFleetTextField () {
    
    UILabel *_leftLabel;
}

@end

@implementation AddFleetTextField

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        
        self.layer.cornerRadius = 1.0f;
        self.backgroundColor = RGB(242, 242, 242);
        self.borderStyle = UITextBorderStyleNone;
        
        _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
        [_leftLabel setFont:[UIFont systemFontOfSize:13]];
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_leftLabel];
        
        self.leftViewMode = UITextFieldViewModeAlways;
        self.leftView = _leftLabel;
        
        
        //        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return self;
}

- (void)setLabelText:(NSString *)labelText {
    _leftLabel.text = labelText;
}

@end
