//
//  CheckAutographListModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/13.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckAutograph.h"

@interface CheckAutographListModel : NSObject

@property (nonatomic, strong) NSArray * CheckAutograph;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
