//
//  PushNewsTableViewCell.m
//  CMClient
//
//  Created by 凯东源 on 17/3/30.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "PushNewsTableViewCell.h"

@interface PushNewsTableViewCell ()

// 图标
@property (weak, nonatomic) IBOutlet UIImageView *typeIcon;

// 消息类型
@property (weak, nonatomic) IBOutlet UILabel *typeTitleLabel;

// 公告标题
@property (weak, nonatomic) IBOutlet UILabel *TITLE;

// 推送时间
@property (weak, nonatomic) IBOutlet UILabel *ADD_DATE;

// 未读小红点
@property (weak, nonatomic) IBOutlet UIImageView *badge;

@end

@implementation PushNewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setPushNewsM:(PushNewsModel *)pushNewsM {
    
    if([pushNewsM.tYPE isEqualToString:@"0"]) {
        
        _TITLE.text = pushNewsM.sHIPMENTNO;
        _ADD_DATE.text = pushNewsM.aDDDATE;
        _typeTitleLabel.text = @"装运编号";
        _typeIcon.image = [UIImage imageNamed:@"ic_order_notification"];
        _typeIcon.image = ([pushNewsM.iSREAD isEqualToString:@"0"]) ? [UIImage imageNamed:@"badge"] : nil;
    } else if([pushNewsM.tYPE isEqualToString:@"1"]) {
        
        _TITLE.text = pushNewsM.tITLE;
        _ADD_DATE.text = pushNewsM.aDDDATE;
        _typeTitleLabel.text = @"公告";
        _typeIcon.image = [UIImage imageNamed:@"ic_msg_notification"];
        _badge.image = [pushNewsM.iSREAD isEqualToString:@"0"] ? [UIImage imageNamed:@"badge"] : nil;
    }
}

@end
