//
//  TruckDetailModel.h
//  CMDriver
//
//  Created by 凯东源 on 17/5/25.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>



//{
//    "VEHICLE_MODEL" : "冷冻车",
//    "PictureFile1" : "InfoImg/20170601/201761114599321.jpg",
//    "PictureFile2" : "InfoImg/20170601/201761114591889.jpg",
//    "VEHICLE_COLOR" : "黑色",
//    "AutographFile" : "InfoImg/20170601/201761114599623.jpg",
//    "BRAND_MODEL" : "东风迈腾",
//    "CREATE_ID" : "5",
//    "MAX_WEIGHT" : "56",
//    "VEHICLE_SIZE" : "17.5M",
//    "PLATE_NUMBER" : "粤B3412",
//    "MAX_VOLUME" : "73",
//    "FLEET_ID" : "104"
//}


@interface TruckDetailModel : NSObject

@property (nonatomic, strong) NSString * autographFile;
@property (nonatomic, strong) NSString * bRANDMODEL;
@property (nonatomic, strong) NSString * cREATEID;
@property (nonatomic, strong) NSString * fLEETID;
@property (nonatomic, strong) NSString * mAXVOLUME;
@property (nonatomic, strong) NSString * mAXWEIGHT;
@property (nonatomic, strong) NSString * pLATENUMBER;
@property (nonatomic, strong) NSString * pictureFile1;
@property (nonatomic, strong) NSString * pictureFile2;
@property (nonatomic, strong) NSString * vEHICLECOLOR;
@property (nonatomic, strong) NSString * vEHICLEMODEL;
@property (nonatomic, strong) NSString * vEHICLESIZE;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;

@end
