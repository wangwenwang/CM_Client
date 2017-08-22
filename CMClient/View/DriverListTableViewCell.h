//
//  DriverListTableViewCell.h
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DriverListModel.h"
#import <SWTableViewCell.h>

@interface DriverListTableViewCell : SWTableViewCell

@property (strong, nonatomic) DriverModel *driverM;

@end
