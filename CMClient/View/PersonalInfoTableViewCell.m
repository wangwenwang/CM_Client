//
//  PersonalInfoTableViewCell.m
//  CMClient
//
//  Created by 凯东源 on 17/3/10.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "PersonalInfoTableViewCell.h"

@interface PersonalInfoTableViewCell ()

// 个人信息提示
@property (weak, nonatomic) IBOutlet UILabel *namePromptLabel;

// 个人信息
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *name_trailing;

@end

@implementation PersonalInfoTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}

- (void)setCellData:(NSString *)title andKey:(NSString *)key andSection:(NSUInteger)section andRow:(NSUInteger)row {
    
    _namePromptLabel.text = title;
    _nameLabel.text = key;
    
    // 箭头
    if(section == 1 && row == 3) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        _name_trailing.constant = 0;
    } else {
        
        self.accessoryType = UITableViewCellAccessoryNone;
        
        _name_trailing.constant = 12;
    }
}

@end
