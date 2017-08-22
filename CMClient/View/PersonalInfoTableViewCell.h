//
//  PersonalInfoTableViewCell.h
//  CMClient
//
//  Created by 凯东源 on 17/3/10.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface PersonalInfoTableViewCell : UITableViewCell


- (void)setCellData:(NSString *)title andKey:(NSString *)key andSection:(NSUInteger)section andRow:(NSUInteger)row;

@end
