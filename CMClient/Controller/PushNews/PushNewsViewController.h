//
//  PushNewsViewController.h
//  CMClient
//
//  Created by 凯东源 on 17/2/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushNewsViewController : UIViewController

/// 是否开启定位
- (instancetype)initWithStartLocation:(BOOL)startLocation;

/// 计时器，固定间隔时间上传位置信息
@property (strong, nonatomic) NSTimer *localTimer;

@end
