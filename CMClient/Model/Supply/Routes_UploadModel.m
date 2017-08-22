//
//  Routes_UploadModel.m
//  CMClient
//
//  Created by 凯东源 on 17/5/15.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "Routes_UploadModel.h"

NSString *const kRoutes_UploadModelADDRESSADDRESS = @"ADDRESS_ADDRESS";
NSString *const kRoutes_UploadModelADDRESSAREA = @"ADDRESS_AREA";
NSString *const kRoutes_UploadModelADDRESSCITY = @"ADDRESS_CITY";
NSString *const kRoutes_UploadModelADDRESSINFO = @"ADDRESS_INFO";
NSString *const kRoutes_UploadModelADDRESSNAME = @"ADDRESS_NAME";
NSString *const kRoutes_UploadModelADDRESSPERSON = @"ADDRESS_PERSON";
NSString *const kRoutes_UploadModelADDRESSPROVINCE = @"ADDRESS_PROVINCE";
NSString *const kRoutes_UploadModelADDRESSREMARK = @"ADDRESS_REMARK";
NSString *const kRoutes_UploadModelADDRESSRURAL = @"ADDRESS_RURAL";
NSString *const kRoutes_UploadModelADDRESSTEL = @"ADDRESS_TEL";
NSString *const kRoutes_UploadModelADDRESSZIP = @"ADDRESS_ZIP";
NSString *const kRoutes_UploadModelOPERATORIDX = @"OPERATOR_IDX";
NSString *const kRoutes_UploadModelROUTESTYPE = @"ROUTES_TYPE";

@implementation Routes_UploadModel


/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kRoutes_UploadModelADDRESSADDRESS] isKindOfClass:[NSNull class]]){
        self.aDDRESSADDRESS = dictionary[kRoutes_UploadModelADDRESSADDRESS];
    }
    if(![dictionary[kRoutes_UploadModelADDRESSAREA] isKindOfClass:[NSNull class]]){
        self.aDDRESSAREA = dictionary[kRoutes_UploadModelADDRESSAREA];
    }
    if(![dictionary[kRoutes_UploadModelADDRESSCITY] isKindOfClass:[NSNull class]]){
        self.aDDRESSCITY = dictionary[kRoutes_UploadModelADDRESSCITY];
    }
    if(![dictionary[kRoutes_UploadModelADDRESSINFO] isKindOfClass:[NSNull class]]){
        self.aDDRESSINFO = dictionary[kRoutes_UploadModelADDRESSINFO];
    }
    if(![dictionary[kRoutes_UploadModelADDRESSNAME] isKindOfClass:[NSNull class]]){
        self.aDDRESSNAME = dictionary[kRoutes_UploadModelADDRESSNAME];
    }
    if(![dictionary[kRoutes_UploadModelADDRESSPERSON] isKindOfClass:[NSNull class]]){
        self.aDDRESSPERSON = dictionary[kRoutes_UploadModelADDRESSPERSON];
    }
    if(![dictionary[kRoutes_UploadModelADDRESSPROVINCE] isKindOfClass:[NSNull class]]){
        self.aDDRESSPROVINCE = dictionary[kRoutes_UploadModelADDRESSPROVINCE];
    }
    if(![dictionary[kRoutes_UploadModelADDRESSREMARK] isKindOfClass:[NSNull class]]){
        self.aDDRESSREMARK = dictionary[kRoutes_UploadModelADDRESSREMARK];
    }
    if(![dictionary[kRoutes_UploadModelADDRESSRURAL] isKindOfClass:[NSNull class]]){
        self.aDDRESSRURAL = dictionary[kRoutes_UploadModelADDRESSRURAL];
    }
    if(![dictionary[kRoutes_UploadModelADDRESSTEL] isKindOfClass:[NSNull class]]){
        self.aDDRESSTEL = dictionary[kRoutes_UploadModelADDRESSTEL];
    }
    if(![dictionary[kRoutes_UploadModelADDRESSZIP] isKindOfClass:[NSNull class]]){
        self.aDDRESSZIP = dictionary[kRoutes_UploadModelADDRESSZIP];
    }
    if(![dictionary[kRoutes_UploadModelOPERATORIDX] isKindOfClass:[NSNull class]]){
        self.oPERATORIDX = dictionary[kRoutes_UploadModelOPERATORIDX];
    }
    if(![dictionary[kRoutes_UploadModelROUTESTYPE] isKindOfClass:[NSNull class]]){
        self.rOUTESTYPE = dictionary[kRoutes_UploadModelROUTESTYPE];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aDDRESSADDRESS != nil){
        dictionary[kRoutes_UploadModelADDRESSADDRESS] = self.aDDRESSADDRESS;
    }
    if(self.aDDRESSAREA != nil){
        dictionary[kRoutes_UploadModelADDRESSAREA] = self.aDDRESSAREA;
    }
    if(self.aDDRESSCITY != nil){
        dictionary[kRoutes_UploadModelADDRESSCITY] = self.aDDRESSCITY;
    }
    if(self.aDDRESSINFO != nil){
        dictionary[kRoutes_UploadModelADDRESSINFO] = self.aDDRESSINFO;
    }
    if(self.aDDRESSNAME != nil){
        dictionary[kRoutes_UploadModelADDRESSNAME] = self.aDDRESSNAME;
    }
    if(self.aDDRESSPERSON != nil){
        dictionary[kRoutes_UploadModelADDRESSPERSON] = self.aDDRESSPERSON;
    }
    if(self.aDDRESSPROVINCE != nil){
        dictionary[kRoutes_UploadModelADDRESSPROVINCE] = self.aDDRESSPROVINCE;
    }
    if(self.aDDRESSREMARK != nil){
        dictionary[kRoutes_UploadModelADDRESSREMARK] = self.aDDRESSREMARK;
    }
    if(self.aDDRESSRURAL != nil){
        dictionary[kRoutes_UploadModelADDRESSRURAL] = self.aDDRESSRURAL;
    }
    if(self.aDDRESSTEL != nil){
        dictionary[kRoutes_UploadModelADDRESSTEL] = self.aDDRESSTEL;
    }
    if(self.aDDRESSZIP != nil){
        dictionary[kRoutes_UploadModelADDRESSZIP] = self.aDDRESSZIP;
    }
    if(self.oPERATORIDX != nil){
        dictionary[kRoutes_UploadModelOPERATORIDX] = self.oPERATORIDX;
    }
    if(self.rOUTESTYPE != nil){
        dictionary[kRoutes_UploadModelROUTESTYPE] = self.rOUTESTYPE;
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
    if(self.aDDRESSADDRESS != nil){
        [aCoder encodeObject:self.aDDRESSADDRESS forKey:kRoutes_UploadModelADDRESSADDRESS];
    }
    if(self.aDDRESSAREA != nil){
        [aCoder encodeObject:self.aDDRESSAREA forKey:kRoutes_UploadModelADDRESSAREA];
    }
    if(self.aDDRESSCITY != nil){
        [aCoder encodeObject:self.aDDRESSCITY forKey:kRoutes_UploadModelADDRESSCITY];
    }
    if(self.aDDRESSINFO != nil){
        [aCoder encodeObject:self.aDDRESSINFO forKey:kRoutes_UploadModelADDRESSINFO];
    }
    if(self.aDDRESSNAME != nil){
        [aCoder encodeObject:self.aDDRESSNAME forKey:kRoutes_UploadModelADDRESSNAME];
    }
    if(self.aDDRESSPERSON != nil){
        [aCoder encodeObject:self.aDDRESSPERSON forKey:kRoutes_UploadModelADDRESSPERSON];
    }
    if(self.aDDRESSPROVINCE != nil){
        [aCoder encodeObject:self.aDDRESSPROVINCE forKey:kRoutes_UploadModelADDRESSPROVINCE];
    }
    if(self.aDDRESSREMARK != nil){
        [aCoder encodeObject:self.aDDRESSREMARK forKey:kRoutes_UploadModelADDRESSREMARK];
    }
    if(self.aDDRESSRURAL != nil){
        [aCoder encodeObject:self.aDDRESSRURAL forKey:kRoutes_UploadModelADDRESSRURAL];
    }
    if(self.aDDRESSTEL != nil){
        [aCoder encodeObject:self.aDDRESSTEL forKey:kRoutes_UploadModelADDRESSTEL];
    }
    if(self.aDDRESSZIP != nil){
        [aCoder encodeObject:self.aDDRESSZIP forKey:kRoutes_UploadModelADDRESSZIP];
    }
    if(self.oPERATORIDX != nil){
        [aCoder encodeObject:self.oPERATORIDX forKey:kRoutes_UploadModelOPERATORIDX];
    }
    if(self.rOUTESTYPE != nil){
        [aCoder encodeObject:self.rOUTESTYPE forKey:kRoutes_UploadModelROUTESTYPE];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDRESSADDRESS = [aDecoder decodeObjectForKey:kRoutes_UploadModelADDRESSADDRESS];
    self.aDDRESSAREA = [aDecoder decodeObjectForKey:kRoutes_UploadModelADDRESSAREA];
    self.aDDRESSCITY = [aDecoder decodeObjectForKey:kRoutes_UploadModelADDRESSCITY];
    self.aDDRESSINFO = [aDecoder decodeObjectForKey:kRoutes_UploadModelADDRESSINFO];
    self.aDDRESSNAME = [aDecoder decodeObjectForKey:kRoutes_UploadModelADDRESSNAME];
    self.aDDRESSPERSON = [aDecoder decodeObjectForKey:kRoutes_UploadModelADDRESSPERSON];
    self.aDDRESSPROVINCE = [aDecoder decodeObjectForKey:kRoutes_UploadModelADDRESSPROVINCE];
    self.aDDRESSREMARK = [aDecoder decodeObjectForKey:kRoutes_UploadModelADDRESSREMARK];
    self.aDDRESSRURAL = [aDecoder decodeObjectForKey:kRoutes_UploadModelADDRESSRURAL];
    self.aDDRESSTEL = [aDecoder decodeObjectForKey:kRoutes_UploadModelADDRESSTEL];
    self.aDDRESSZIP = [aDecoder decodeObjectForKey:kRoutes_UploadModelADDRESSZIP];
    self.oPERATORIDX = [aDecoder decodeObjectForKey:kRoutes_UploadModelOPERATORIDX];
    self.rOUTESTYPE = [aDecoder decodeObjectForKey:kRoutes_UploadModelROUTESTYPE];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    Routes_UploadModel *copy = [Routes_UploadModel new];
    
    copy.aDDRESSADDRESS = [self.aDDRESSADDRESS copy];
    copy.aDDRESSAREA = [self.aDDRESSAREA copy];
    copy.aDDRESSCITY = [self.aDDRESSCITY copy];
    copy.aDDRESSINFO = [self.aDDRESSINFO copy];
    copy.aDDRESSNAME = [self.aDDRESSNAME copy];
    copy.aDDRESSPERSON = [self.aDDRESSPERSON copy];
    copy.aDDRESSPROVINCE = [self.aDDRESSPROVINCE copy];
    copy.aDDRESSREMARK = [self.aDDRESSREMARK copy];
    copy.aDDRESSRURAL = [self.aDDRESSRURAL copy];
    copy.aDDRESSTEL = [self.aDDRESSTEL copy];
    copy.aDDRESSZIP = [self.aDDRESSZIP copy];
    copy.oPERATORIDX = [self.oPERATORIDX copy];
    copy.rOUTESTYPE = [self.rOUTESTYPE copy];
    
    return copy;
}

@end
