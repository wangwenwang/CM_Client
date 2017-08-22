//
//  TruckListViewController.h
//  CMClient
//
//  Created by 凯东源 on 17/2/17.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TruckListViewController : UIViewController


/**
 车队id
 */
@property (nonatomic, copy) NSString *fleetIdx;


/**
 车队类型（公司车队只能查看）
 */
@property (nonatomic, copy) NSString *FLEET_PROPERTY;

@end
