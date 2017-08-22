//
//  RoutesModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoutesModel : NSObject

@property (nonatomic, strong) NSString * aDDRESSCLASS;
@property (nonatomic, strong) NSString * aDDRESSINFO;
@property (nonatomic, strong) NSString * aDDRESSNAME;
@property (nonatomic, strong) NSString * aDDRESSPERSON;
@property (nonatomic, strong) NSString * aDDRESSREMARK;
@property (nonatomic, strong) NSString * aDDRESSTEL;
@property (nonatomic, strong) NSString * aDDRESSTYPE;
@property (nonatomic, strong) NSString * rEFERENCE01;
@property (nonatomic, strong) NSString * rEFERENCE02;
@property (nonatomic, strong) NSString * rEFERENCE03;
@property (nonatomic, strong) NSString * rEFERENCE04;
@property (nonatomic, strong) NSString * rEFERENCE05;
@property (nonatomic, strong) NSString * rOUTESTYPE;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

/// cell 高度
@property (nonatomic, assign) CGFloat cellHeight;

@end
