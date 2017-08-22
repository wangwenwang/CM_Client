//
//  AddFleetButton.m
//  CMClient
//
//  Created by 凯东源 on 17/3/1.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AddFleetButton.h"

@implementation AddFleetButton

#define kvo_enabled @"enabled"

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        
        self.layer.cornerRadius = 1.0f;
        self.backgroundColor = RGB(217, 217, 217);
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addKVO];
    }
    return self;
}


- (void)dealloc {
    
    [self removeKVO];
}


#pragma mark - 功能方法
- (void)addKVO {
    
    [self addObserver:self forKeyPath:kvo_enabled options:NSKeyValueObservingOptionNew context:nil];
}


- (void)removeKVO {
    
    [self removeObserver:self forKeyPath:kvo_enabled];
}


#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if (object == self  && [keyPath isEqualToString:kvo_enabled]) {
        
        NSUInteger old = [change[@"old"] integerValue];
        NSUInteger new = [change[@"new"] integerValue];
        NSLog(@"old:%lu, new:%lu", (unsigned long)old, (unsigned long)new);
        
        if(new == 1) {
            
            self.backgroundColor = [UIColor orangeColor];
        } else {
            
            self.backgroundColor = RGB(217, 217, 217);
        }
    } else {
        
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
