//
//  DriverListTableViewCell.m
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "DriverListTableViewCell.h"

@interface DriverListTableViewCell ()

/// 司机姓名
@property (weak, nonatomic) IBOutlet UILabel *DRIVER_NAMELabel;

/// 联系方式
@property (weak, nonatomic) IBOutlet UILabel *CONTACT_TELLabel;

/// 权限图标
@property (weak, nonatomic) IBOutlet UIImageView *authorityImageView;

@end


@implementation DriverListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setDriverM:(DriverModel *)driverM {
    
    _DRIVER_NAMELabel.text = driverM.dRIVERNAME;
    _CONTACT_TELLabel.text = driverM.cONTACTTEL;
    
    if([driverM.driverAuthorityModel.eNABLEINFO isEqualToString:@"Y"]) {
        
        [_authorityImageView setImage:[UIImage imageNamed:@"driverAuthority_owner"]];
    } else if([driverM.driverAuthorityModel.eNABLEADD isEqualToString:@"Y"] && [driverM.driverAuthorityModel.eNABLEDELETE isEqualToString:@"Y"]) {
        
        [_authorityImageView setImage:[UIImage imageNamed:@"driverAuthority_administrator"]];
    } else {
        
        [_authorityImageView setImage:nil];
    }
}

@end
