//
//  TruckDetailModel.m
//  CMDriver
//
//  Created by 凯东源 on 17/5/25.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "TruckDetailModel.h"

NSString *const kTruckDetailModelAutographFile = @"AutographFile";
NSString *const kTruckDetailModelBRANDMODEL = @"BRAND_MODEL";
NSString *const kTruckDetailModelCREATEID = @"CREATE_ID";
NSString *const kTruckDetailModelFLEETID = @"FLEET_ID";
NSString *const kTruckDetailModelMAXVOLUME = @"MAX_VOLUME";
NSString *const kTruckDetailModelMAXWEIGHT = @"MAX_WEIGHT";
NSString *const kTruckDetailModelPLATENUMBER = @"PLATE_NUMBER";
NSString *const kTruckDetailModelPictureFile1 = @"PictureFile1";
NSString *const kTruckDetailModelPictureFile2 = @"PictureFile2";
NSString *const kTruckDetailModelVEHICLECOLOR = @"VEHICLE_COLOR";
NSString *const kTruckDetailModelVEHICLEMODEL = @"VEHICLE_MODEL";
NSString *const kTruckDetailModelVEHICLESIZE = @"VEHICLE_SIZE";

@implementation TruckDetailModel


/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kTruckDetailModelAutographFile] isKindOfClass:[NSNull class]]){
        self.autographFile = dictionary[kTruckDetailModelAutographFile];
    }
    if(![dictionary[kTruckDetailModelBRANDMODEL] isKindOfClass:[NSNull class]]){
        self.bRANDMODEL = dictionary[kTruckDetailModelBRANDMODEL];
    }
    if(![dictionary[kTruckDetailModelCREATEID] isKindOfClass:[NSNull class]]){
        self.cREATEID = dictionary[kTruckDetailModelCREATEID];
    }
    if(![dictionary[kTruckDetailModelFLEETID] isKindOfClass:[NSNull class]]){
        self.fLEETID = dictionary[kTruckDetailModelFLEETID];
    }
    if(![dictionary[kTruckDetailModelMAXVOLUME] isKindOfClass:[NSNull class]]){
        self.mAXVOLUME = dictionary[kTruckDetailModelMAXVOLUME];
    }
    if(![dictionary[kTruckDetailModelMAXWEIGHT] isKindOfClass:[NSNull class]]){
        self.mAXWEIGHT = dictionary[kTruckDetailModelMAXWEIGHT];
    }
    if(![dictionary[kTruckDetailModelPLATENUMBER] isKindOfClass:[NSNull class]]){
        self.pLATENUMBER = dictionary[kTruckDetailModelPLATENUMBER];
    }
    if(![dictionary[kTruckDetailModelPictureFile1] isKindOfClass:[NSNull class]]){
        self.pictureFile1 = dictionary[kTruckDetailModelPictureFile1];
    }
    if(![dictionary[kTruckDetailModelPictureFile2] isKindOfClass:[NSNull class]]){
        self.pictureFile2 = dictionary[kTruckDetailModelPictureFile2];
    }
    if(![dictionary[kTruckDetailModelVEHICLECOLOR] isKindOfClass:[NSNull class]]){
        self.vEHICLECOLOR = dictionary[kTruckDetailModelVEHICLECOLOR];
    }
    if(![dictionary[kTruckDetailModelVEHICLEMODEL] isKindOfClass:[NSNull class]]){
        self.vEHICLEMODEL = dictionary[kTruckDetailModelVEHICLEMODEL];
    }
    if(![dictionary[kTruckDetailModelVEHICLESIZE] isKindOfClass:[NSNull class]]){
        self.vEHICLESIZE = dictionary[kTruckDetailModelVEHICLESIZE];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.autographFile != nil){
        dictionary[kTruckDetailModelAutographFile] = self.autographFile;
    }
    if(self.bRANDMODEL != nil){
        dictionary[kTruckDetailModelBRANDMODEL] = self.bRANDMODEL;
    }
    if(self.cREATEID != nil){
        dictionary[kTruckDetailModelCREATEID] = self.cREATEID;
    }
    if(self.fLEETID != nil){
        dictionary[kTruckDetailModelFLEETID] = self.fLEETID;
    }
    if(self.mAXVOLUME != nil){
        dictionary[kTruckDetailModelMAXVOLUME] = self.mAXVOLUME;
    }
    if(self.mAXWEIGHT != nil){
        dictionary[kTruckDetailModelMAXWEIGHT] = self.mAXWEIGHT;
    }
    if(self.pLATENUMBER != nil){
        dictionary[kTruckDetailModelPLATENUMBER] = self.pLATENUMBER;
    }
    if(self.pictureFile1 != nil){
        dictionary[kTruckDetailModelPictureFile1] = self.pictureFile1;
    }
    if(self.pictureFile2 != nil){
        dictionary[kTruckDetailModelPictureFile2] = self.pictureFile2;
    }
    if(self.vEHICLECOLOR != nil){
        dictionary[kTruckDetailModelVEHICLECOLOR] = self.vEHICLECOLOR;
    }
    if(self.vEHICLEMODEL != nil){
        dictionary[kTruckDetailModelVEHICLEMODEL] = self.vEHICLEMODEL;
    }
    if(self.vEHICLESIZE != nil){
        dictionary[kTruckDetailModelVEHICLESIZE] = self.vEHICLESIZE;
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if(self.autographFile != nil){
        [aCoder encodeObject:self.autographFile forKey:kTruckDetailModelAutographFile];
    }
    if(self.bRANDMODEL != nil){
        [aCoder encodeObject:self.bRANDMODEL forKey:kTruckDetailModelBRANDMODEL];
    }
    if(self.cREATEID != nil){
        [aCoder encodeObject:self.cREATEID forKey:kTruckDetailModelCREATEID];
    }
    if(self.fLEETID != nil){
        [aCoder encodeObject:self.fLEETID forKey:kTruckDetailModelFLEETID];
    }
    if(self.mAXVOLUME != nil){
        [aCoder encodeObject:self.mAXVOLUME forKey:kTruckDetailModelMAXVOLUME];
    }
    if(self.mAXWEIGHT != nil){
        [aCoder encodeObject:self.mAXWEIGHT forKey:kTruckDetailModelMAXWEIGHT];
    }
    if(self.pLATENUMBER != nil){
        [aCoder encodeObject:self.pLATENUMBER forKey:kTruckDetailModelPLATENUMBER];
    }
    if(self.pictureFile1 != nil){
        [aCoder encodeObject:self.pictureFile1 forKey:kTruckDetailModelPictureFile1];
    }
    if(self.pictureFile2 != nil){
        [aCoder encodeObject:self.pictureFile2 forKey:kTruckDetailModelPictureFile2];
    }
    if(self.vEHICLECOLOR != nil){
        [aCoder encodeObject:self.vEHICLECOLOR forKey:kTruckDetailModelVEHICLECOLOR];
    }
    if(self.vEHICLEMODEL != nil){
        [aCoder encodeObject:self.vEHICLEMODEL forKey:kTruckDetailModelVEHICLEMODEL];
    }
    if(self.vEHICLESIZE != nil){
        [aCoder encodeObject:self.vEHICLESIZE forKey:kTruckDetailModelVEHICLESIZE];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.autographFile = [aDecoder decodeObjectForKey:kTruckDetailModelAutographFile];
    self.bRANDMODEL = [aDecoder decodeObjectForKey:kTruckDetailModelBRANDMODEL];
    self.cREATEID = [aDecoder decodeObjectForKey:kTruckDetailModelCREATEID];
    self.fLEETID = [aDecoder decodeObjectForKey:kTruckDetailModelFLEETID];
    self.mAXVOLUME = [aDecoder decodeObjectForKey:kTruckDetailModelMAXVOLUME];
    self.mAXWEIGHT = [aDecoder decodeObjectForKey:kTruckDetailModelMAXWEIGHT];
    self.pLATENUMBER = [aDecoder decodeObjectForKey:kTruckDetailModelPLATENUMBER];
    self.pictureFile1 = [aDecoder decodeObjectForKey:kTruckDetailModelPictureFile1];
    self.pictureFile2 = [aDecoder decodeObjectForKey:kTruckDetailModelPictureFile2];
    self.vEHICLECOLOR = [aDecoder decodeObjectForKey:kTruckDetailModelVEHICLECOLOR];
    self.vEHICLEMODEL = [aDecoder decodeObjectForKey:kTruckDetailModelVEHICLEMODEL];
    self.vEHICLESIZE = [aDecoder decodeObjectForKey:kTruckDetailModelVEHICLESIZE];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    TruckDetailModel *copy = [TruckDetailModel new];
    
    copy.autographFile = [self.autographFile copy];
    copy.bRANDMODEL = [self.bRANDMODEL copy];
    copy.cREATEID = [self.cREATEID copy];
    copy.fLEETID = [self.fLEETID copy];
    copy.mAXVOLUME = [self.mAXVOLUME copy];
    copy.mAXWEIGHT = [self.mAXWEIGHT copy];
    copy.pLATENUMBER = [self.pLATENUMBER copy];
    copy.pictureFile1 = [self.pictureFile1 copy];
    copy.pictureFile2 = [self.pictureFile2 copy];
    copy.vEHICLECOLOR = [self.vEHICLECOLOR copy];
    copy.vEHICLEMODEL = [self.vEHICLEMODEL copy];
    copy.vEHICLESIZE = [self.vEHICLESIZE copy];
    
    return copy;
}

@end
