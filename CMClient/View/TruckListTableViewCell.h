//
//  TruckListTableViewCell.h
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SWTableViewCell.h>

@interface TruckListTableViewCell : SWTableViewCell

/// 车牌号
@property (weak, nonatomic) IBOutlet UILabel *plateNumberLabel;

/// 车辆类型
@property (weak, nonatomic) IBOutlet UILabel *truckTypeLabel;

/// 车辆尺寸
@property (weak, nonatomic) IBOutlet UILabel *truckSizeLabel;
@end
