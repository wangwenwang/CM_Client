//
//  RoutesTableViewCell.h
//  CMDriver
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoutesModel.h"

@interface RoutesTableViewCell : UITableViewCell

/// 是否最后一个TO，终点
@property (assign, nonatomic) BOOL lastTO;


@property (strong, nonatomic) RoutesModel *routesM;

@end
