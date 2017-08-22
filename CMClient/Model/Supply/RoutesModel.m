//
//  RoutesModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "RoutesModel.h"


NSString *const kRoutesModelADDRESSCLASS = @"ADDRESS_CLASS";
NSString *const kRoutesModelADDRESSINFO = @"ADDRESS_INFO";
NSString *const kRoutesModelADDRESSNAME = @"ADDRESS_NAME";
NSString *const kRoutesModelADDRESSPERSON = @"ADDRESS_PERSON";
NSString *const kRoutesModelADDRESSREMARK = @"ADDRESS_REMARK";
NSString *const kRoutesModelADDRESSTEL = @"ADDRESS_TEL";
NSString *const kRoutesModelADDRESSTYPE = @"ADDRESS_TYPE";
NSString *const kRoutesModelREFERENCE01 = @"REFERENCE01";
NSString *const kRoutesModelREFERENCE02 = @"REFERENCE02";
NSString *const kRoutesModelREFERENCE03 = @"REFERENCE03";
NSString *const kRoutesModelREFERENCE04 = @"REFERENCE04";
NSString *const kRoutesModelREFERENCE05 = @"REFERENCE05";
NSString *const kRoutesModelROUTESTYPE = @"ROUTES_TYPE";


@implementation RoutesModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kRoutesModelADDRESSCLASS] isKindOfClass:[NSNull class]]){
        self.aDDRESSCLASS = dictionary[kRoutesModelADDRESSCLASS];
    }
    if(![dictionary[kRoutesModelADDRESSINFO] isKindOfClass:[NSNull class]]){
        self.aDDRESSINFO = dictionary[kRoutesModelADDRESSINFO];
    }
    if(![dictionary[kRoutesModelADDRESSNAME] isKindOfClass:[NSNull class]]){
        self.aDDRESSNAME = dictionary[kRoutesModelADDRESSNAME];
    }
    if(![dictionary[kRoutesModelADDRESSPERSON] isKindOfClass:[NSNull class]]){
        self.aDDRESSPERSON = dictionary[kRoutesModelADDRESSPERSON];
    }
    if(![dictionary[kRoutesModelADDRESSREMARK] isKindOfClass:[NSNull class]]){
        self.aDDRESSREMARK = dictionary[kRoutesModelADDRESSREMARK];
    }
    if(![dictionary[kRoutesModelADDRESSTEL] isKindOfClass:[NSNull class]]){
        self.aDDRESSTEL = dictionary[kRoutesModelADDRESSTEL];
    }
    if(![dictionary[kRoutesModelADDRESSTYPE] isKindOfClass:[NSNull class]]){
        self.aDDRESSTYPE = dictionary[kRoutesModelADDRESSTYPE];
    }
    if(![dictionary[kRoutesModelREFERENCE01] isKindOfClass:[NSNull class]]){
        self.rEFERENCE01 = dictionary[kRoutesModelREFERENCE01];
    }
    if(![dictionary[kRoutesModelREFERENCE02] isKindOfClass:[NSNull class]]){
        self.rEFERENCE02 = dictionary[kRoutesModelREFERENCE02];
    }
    if(![dictionary[kRoutesModelREFERENCE03] isKindOfClass:[NSNull class]]){
        self.rEFERENCE03 = dictionary[kRoutesModelREFERENCE03];
    }
    if(![dictionary[kRoutesModelREFERENCE04] isKindOfClass:[NSNull class]]){
        self.rEFERENCE04 = dictionary[kRoutesModelREFERENCE04];
    }
    if(![dictionary[kRoutesModelREFERENCE05] isKindOfClass:[NSNull class]]){
        self.rEFERENCE05 = dictionary[kRoutesModelREFERENCE05];
    }
    if(![dictionary[kRoutesModelROUTESTYPE] isKindOfClass:[NSNull class]]){
        self.rOUTESTYPE = dictionary[kRoutesModelROUTESTYPE];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aDDRESSCLASS != nil){
        dictionary[kRoutesModelADDRESSCLASS] = self.aDDRESSCLASS;
    }
    if(self.aDDRESSINFO != nil){
        dictionary[kRoutesModelADDRESSINFO] = self.aDDRESSINFO;
    }
    if(self.aDDRESSNAME != nil){
        dictionary[kRoutesModelADDRESSNAME] = self.aDDRESSNAME;
    }
    if(self.aDDRESSPERSON != nil){
        dictionary[kRoutesModelADDRESSPERSON] = self.aDDRESSPERSON;
    }
    if(self.aDDRESSREMARK != nil){
        dictionary[kRoutesModelADDRESSREMARK] = self.aDDRESSREMARK;
    }
    if(self.aDDRESSTEL != nil){
        dictionary[kRoutesModelADDRESSTEL] = self.aDDRESSTEL;
    }
    if(self.aDDRESSTYPE != nil){
        dictionary[kRoutesModelADDRESSTYPE] = self.aDDRESSTYPE;
    }
    if(self.rEFERENCE01 != nil){
        dictionary[kRoutesModelREFERENCE01] = self.rEFERENCE01;
    }
    if(self.rEFERENCE02 != nil){
        dictionary[kRoutesModelREFERENCE02] = self.rEFERENCE02;
    }
    if(self.rEFERENCE03 != nil){
        dictionary[kRoutesModelREFERENCE03] = self.rEFERENCE03;
    }
    if(self.rEFERENCE04 != nil){
        dictionary[kRoutesModelREFERENCE04] = self.rEFERENCE04;
    }
    if(self.rEFERENCE05 != nil){
        dictionary[kRoutesModelREFERENCE05] = self.rEFERENCE05;
    }
    if(self.rOUTESTYPE != nil){
        dictionary[kRoutesModelROUTESTYPE] = self.rOUTESTYPE;
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
    if(self.aDDRESSCLASS != nil){
        [aCoder encodeObject:self.aDDRESSCLASS forKey:kRoutesModelADDRESSCLASS];
    }
    if(self.aDDRESSINFO != nil){
        [aCoder encodeObject:self.aDDRESSINFO forKey:kRoutesModelADDRESSINFO];
    }
    if(self.aDDRESSNAME != nil){
        [aCoder encodeObject:self.aDDRESSNAME forKey:kRoutesModelADDRESSNAME];
    }
    if(self.aDDRESSPERSON != nil){
        [aCoder encodeObject:self.aDDRESSPERSON forKey:kRoutesModelADDRESSPERSON];
    }
    if(self.aDDRESSREMARK != nil){
        [aCoder encodeObject:self.aDDRESSREMARK forKey:kRoutesModelADDRESSREMARK];
    }
    if(self.aDDRESSTEL != nil){
        [aCoder encodeObject:self.aDDRESSTEL forKey:kRoutesModelADDRESSTEL];
    }
    if(self.aDDRESSTYPE != nil){
        [aCoder encodeObject:self.aDDRESSTYPE forKey:kRoutesModelADDRESSTYPE];
    }
    if(self.rEFERENCE01 != nil){
        [aCoder encodeObject:self.rEFERENCE01 forKey:kRoutesModelREFERENCE01];
    }
    if(self.rEFERENCE02 != nil){
        [aCoder encodeObject:self.rEFERENCE02 forKey:kRoutesModelREFERENCE02];
    }
    if(self.rEFERENCE03 != nil){
        [aCoder encodeObject:self.rEFERENCE03 forKey:kRoutesModelREFERENCE03];
    }
    if(self.rEFERENCE04 != nil){
        [aCoder encodeObject:self.rEFERENCE04 forKey:kRoutesModelREFERENCE04];
    }
    if(self.rEFERENCE05 != nil){
        [aCoder encodeObject:self.rEFERENCE05 forKey:kRoutesModelREFERENCE05];
    }
    if(self.rOUTESTYPE != nil){
        [aCoder encodeObject:self.rOUTESTYPE forKey:kRoutesModelROUTESTYPE];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDRESSCLASS = [aDecoder decodeObjectForKey:kRoutesModelADDRESSCLASS];
    self.aDDRESSINFO = [aDecoder decodeObjectForKey:kRoutesModelADDRESSINFO];
    self.aDDRESSNAME = [aDecoder decodeObjectForKey:kRoutesModelADDRESSNAME];
    self.aDDRESSPERSON = [aDecoder decodeObjectForKey:kRoutesModelADDRESSPERSON];
    self.aDDRESSREMARK = [aDecoder decodeObjectForKey:kRoutesModelADDRESSREMARK];
    self.aDDRESSTEL = [aDecoder decodeObjectForKey:kRoutesModelADDRESSTEL];
    self.aDDRESSTYPE = [aDecoder decodeObjectForKey:kRoutesModelADDRESSTYPE];
    self.rEFERENCE01 = [aDecoder decodeObjectForKey:kRoutesModelREFERENCE01];
    self.rEFERENCE02 = [aDecoder decodeObjectForKey:kRoutesModelREFERENCE02];
    self.rEFERENCE03 = [aDecoder decodeObjectForKey:kRoutesModelREFERENCE03];
    self.rEFERENCE04 = [aDecoder decodeObjectForKey:kRoutesModelREFERENCE04];
    self.rEFERENCE05 = [aDecoder decodeObjectForKey:kRoutesModelREFERENCE05];
    self.rOUTESTYPE = [aDecoder decodeObjectForKey:kRoutesModelROUTESTYPE];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    RoutesModel *copy = [RoutesModel new];
    
    copy.aDDRESSCLASS = [self.aDDRESSCLASS copy];
    copy.aDDRESSINFO = [self.aDDRESSINFO copy];
    copy.aDDRESSNAME = [self.aDDRESSNAME copy];
    copy.aDDRESSPERSON = [self.aDDRESSPERSON copy];
    copy.aDDRESSREMARK = [self.aDDRESSREMARK copy];
    copy.aDDRESSTEL = [self.aDDRESSTEL copy];
    copy.aDDRESSTYPE = [self.aDDRESSTYPE copy];
    copy.rEFERENCE01 = [self.rEFERENCE01 copy];
    copy.rEFERENCE02 = [self.rEFERENCE02 copy];
    copy.rEFERENCE03 = [self.rEFERENCE03 copy];
    copy.rEFERENCE04 = [self.rEFERENCE04 copy];
    copy.rEFERENCE05 = [self.rEFERENCE05 copy];
    copy.rOUTESTYPE = [self.rOUTESTYPE copy];
    
    return copy;
}

@end
