//
//  AutoGraphView.h
//  CMClient
//
//  Created by 凯东源 on 17/2/22.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoGraphView : UIView

/// 保存已有的线条
@property (strong, nonatomic) NSMutableArray *allLine;


/**
 清空签名
 */
- (void)clear;

@end
