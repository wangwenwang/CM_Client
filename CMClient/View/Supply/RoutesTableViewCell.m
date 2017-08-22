//
//  RoutesTableViewCell.m
//  CMDriver
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "RoutesTableViewCell.h"
#import "Tools.h"


@interface RoutesTableViewCell ()

// 联系人
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_PERSON;

// 联系电话
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_TEL;

// 地址类型
@property (weak, nonatomic) IBOutlet UILabel *ROUTES_TYPE;

// 地址
@property (weak, nonatomic) IBOutlet UILabel *ADDRESS_NAME;

// 地址提示 靠左距离
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ADDRESS_NAME_Prompt_leading;

// 地址 靠右距离
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ADDRESS_NAME_trailing;

@end


@implementation RoutesTableViewCell


- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self initUI];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
}


- (void)setRoutesM:(RoutesModel *)routesM {
    
    _ADDRESS_PERSON.text = routesM.aDDRESSPERSON;
    _ADDRESS_TEL.text = routesM.aDDRESSTEL;
    _ROUTES_TYPE.text = [self routesType:routesM.rOUTESTYPE isLastTo:_lastTO];
    _ADDRESS_NAME.text = [NSString stringWithFormat:@"%@(%@)", routesM.aDDRESSNAME, routesM.aDDRESSINFO];
}


- (void)initUI {
    
    _ADDRESS_PERSON.text = @"";
    _ADDRESS_TEL.text = @"";
    _ROUTES_TYPE.text = @"";
    _ADDRESS_NAME.text = @"";
}


/**
 路线类型 FROM 起点, TO 途经点, 最后一个TO 终点

 @param type   转义前类型
 @param lastTo 是否最后一个TO

 @return 转义后类型
 */
- (NSString *)routesType:(NSString *)type isLastTo:(BOOL)lastTo {
    
    if([type isEqualToString:@"FROM"]) {
        
        return @"起　点: ";
    } else {
        
        if(lastTo) {
            
            return @"终　点: ";
        } else {
            
            return @"途经点: ";
        }
    }
}

@end
