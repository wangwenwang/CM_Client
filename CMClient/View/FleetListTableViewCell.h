//
//  FleetListTableViewCell.h
//  CMClient
//
//  Created by 凯东源 on 17/3/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FleetListTableViewCell : UITableViewCell

/// 车队名称
@property (weak, nonatomic) IBOutlet UILabel *fleetNameLabel;

/// 公司名称
@property (weak, nonatomic) IBOutlet UILabel *companyNameLabel;

/// 联系人电话
@property (weak, nonatomic) IBOutlet UILabel *comtactTelLabel;

/// 车队类型图片
@property (weak, nonatomic) IBOutlet UIImageView *fleetTypeImageView;

@end
