//
//  TruckModel.h
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>


//{
//    "VEHICLE_SIZE" : "",
//    "PLATE_NUMBER" : "123",
//    "VEHICLE_MODEL" : "",
//    "IDX" : "9"
//}


@interface TruckModel : NSObject

@property (nonatomic, strong) NSString * iDX;
@property (nonatomic, strong) NSString * pLATENUMBER;
@property (nonatomic, strong) NSString * vEHICLEMODEL;
@property (nonatomic, strong) NSString * vEHICLESIZE;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
