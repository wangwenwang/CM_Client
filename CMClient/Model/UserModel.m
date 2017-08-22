//
//  UserModel.m
//  CMDriver
//
//  Created by 凯东源 on 17/1/18.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "UserModel.h"


NSString *const kUserModelADDRESS = @"ADDRESS";
NSString *const kUserModelADDDATE = @"ADD_DATE";
NSString *const kUserModelAvatar = @"Avatar";
NSString *const kUserModelCOMPANYNAME = @"COMPANYNAME";
NSString *const kUserModelEDITDATE = @"EDIT_DATE";
NSString *const kUserModelFLEETTYPE = @"FLEETTYPE";
NSString *const kUserModelIDX = @"IDX";
NSString *const kUserModelOPERATORIDX = @"OPERATOR_IDX";
NSString *const kUserModelRECOMNAME = @"RECOMNAME";
NSString *const kUserModelUSERNAME = @"USERNAME";
NSString *const kUserModelUSERTYPE = @"USERTYPE";
NSString *const kUserModelUSERCODE = @"USER_CODE";
NSString *const kUserModelPASSWORD = @"pASSWORD";
NSString *const kUserModelUseDays = @"useDays";



@interface UserModel ()<NSCoding>

@end


@implementation UserModel


/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kUserModelADDRESS] isKindOfClass:[NSNull class]]){
        self.aDDRESS = dictionary[kUserModelADDRESS];
    }
    if(![dictionary[kUserModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kUserModelADDDATE];
    }
    if(![dictionary[kUserModelAvatar] isKindOfClass:[NSNull class]]){
        self.avatar = dictionary[kUserModelAvatar];
    }
    if(![dictionary[kUserModelCOMPANYNAME] isKindOfClass:[NSNull class]]){
        self.cOMPANYNAME = dictionary[kUserModelCOMPANYNAME];
    }
    if(![dictionary[kUserModelEDITDATE] isKindOfClass:[NSNull class]]){
        self.eDITDATE = dictionary[kUserModelEDITDATE];
    }
    if(![dictionary[kUserModelFLEETTYPE] isKindOfClass:[NSNull class]]){
        self.fLEETTYPE = dictionary[kUserModelFLEETTYPE];
    }
    if(![dictionary[kUserModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kUserModelIDX];
    }
    if(![dictionary[kUserModelOPERATORIDX] isKindOfClass:[NSNull class]]){
        self.oPERATORIDX = dictionary[kUserModelOPERATORIDX];
    }
    if(![dictionary[kUserModelRECOMNAME] isKindOfClass:[NSNull class]]){
        self.rECOMNAME = dictionary[kUserModelRECOMNAME];
    }
    if(![dictionary[kUserModelUSERNAME] isKindOfClass:[NSNull class]]){
        self.uSERNAME = dictionary[kUserModelUSERNAME];
    }
    if(![dictionary[kUserModelUSERTYPE] isKindOfClass:[NSNull class]]){
        self.uSERTYPE = dictionary[kUserModelUSERTYPE];
    }
    if(![dictionary[kUserModelUSERCODE] isKindOfClass:[NSNull class]]){
        self.uSERCODE = dictionary[kUserModelUSERCODE];
    }
    if(![dictionary[kUserModelPASSWORD] isKindOfClass:[NSNull class]]){
        self.pASSWORD = dictionary[kUserModelPASSWORD];
    }
    if(![dictionary[kUserModelUseDays] isKindOfClass:[NSNull class]]){
        self.useDays = dictionary[kUserModelUseDays];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aDDRESS != nil){
        dictionary[kUserModelADDRESS] = self.aDDRESS;
    }
    if(self.aDDDATE != nil){
        dictionary[kUserModelADDDATE] = self.aDDDATE;
    }
    if(self.avatar != nil){
        dictionary[kUserModelAvatar] = self.avatar;
    }
    if(self.cOMPANYNAME != nil){
        dictionary[kUserModelCOMPANYNAME] = self.cOMPANYNAME;
    }
    if(self.eDITDATE != nil){
        dictionary[kUserModelEDITDATE] = self.eDITDATE;
    }
    if(self.fLEETTYPE != nil){
        dictionary[kUserModelFLEETTYPE] = self.fLEETTYPE;
    }
    if(self.iDX != nil){
        dictionary[kUserModelIDX] = self.iDX;
    }
    if(self.oPERATORIDX != nil){
        dictionary[kUserModelOPERATORIDX] = self.oPERATORIDX;
    }
    if(self.rECOMNAME != nil){
        dictionary[kUserModelRECOMNAME] = self.rECOMNAME;
    }
    if(self.uSERNAME != nil){
        dictionary[kUserModelUSERNAME] = self.uSERNAME;
    }
    if(self.uSERTYPE != nil){
        dictionary[kUserModelUSERTYPE] = self.uSERTYPE;
    }
    if(self.uSERCODE != nil){
        dictionary[kUserModelUSERCODE] = self.uSERCODE;
    }
    if(self.pASSWORD != nil){
        dictionary[kUserModelPASSWORD] = self.pASSWORD;
    }
    if(self.useDays != nil){
        dictionary[kUserModelUseDays] = self.useDays;
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
    if(self.aDDRESS != nil){
        [aCoder encodeObject:self.aDDRESS forKey:kUserModelADDRESS];
    }
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kUserModelADDDATE];
    }
    if(self.avatar != nil){
        [aCoder encodeObject:self.avatar forKey:kUserModelAvatar];
    }
    if(self.cOMPANYNAME != nil){
        [aCoder encodeObject:self.cOMPANYNAME forKey:kUserModelCOMPANYNAME];
    }
    if(self.eDITDATE != nil){
        [aCoder encodeObject:self.eDITDATE forKey:kUserModelEDITDATE];
    }
    if(self.fLEETTYPE != nil){
        [aCoder encodeObject:self.fLEETTYPE forKey:kUserModelFLEETTYPE];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kUserModelIDX];
    }
    if(self.oPERATORIDX != nil){
        [aCoder encodeObject:self.oPERATORIDX forKey:kUserModelOPERATORIDX];
    }
    if(self.rECOMNAME != nil){
        [aCoder encodeObject:self.rECOMNAME forKey:kUserModelRECOMNAME];
    }
    if(self.uSERNAME != nil){
        [aCoder encodeObject:self.uSERNAME forKey:kUserModelUSERNAME];
    }
    if(self.uSERTYPE != nil){
        [aCoder encodeObject:self.uSERTYPE forKey:kUserModelUSERTYPE];
    }
    if(self.uSERCODE != nil){
        [aCoder encodeObject:self.uSERCODE forKey:kUserModelUSERCODE];
    }
    if(self.pASSWORD != nil){
        [aCoder encodeObject:self.pASSWORD forKey:kUserModelPASSWORD];
    }
    if(self.useDays != nil){
        [aCoder encodeObject:self.useDays forKey:kUserModelUseDays];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDRESS = [aDecoder decodeObjectForKey:kUserModelADDRESS];
    self.aDDDATE = [aDecoder decodeObjectForKey:kUserModelADDDATE];
    self.avatar = [aDecoder decodeObjectForKey:kUserModelAvatar];
    self.cOMPANYNAME = [aDecoder decodeObjectForKey:kUserModelCOMPANYNAME];
    self.eDITDATE = [aDecoder decodeObjectForKey:kUserModelEDITDATE];
    self.fLEETTYPE = [aDecoder decodeObjectForKey:kUserModelFLEETTYPE];
    self.iDX = [aDecoder decodeObjectForKey:kUserModelIDX];
    self.oPERATORIDX = [aDecoder decodeObjectForKey:kUserModelOPERATORIDX];
    self.rECOMNAME = [aDecoder decodeObjectForKey:kUserModelRECOMNAME];
    self.uSERNAME = [aDecoder decodeObjectForKey:kUserModelUSERNAME];
    self.uSERTYPE = [aDecoder decodeObjectForKey:kUserModelUSERTYPE];
    self.uSERCODE = [aDecoder decodeObjectForKey:kUserModelUSERCODE];
    self.pASSWORD = [aDecoder decodeObjectForKey:kUserModelPASSWORD];
    self.useDays = [aDecoder decodeObjectForKey:kUserModelUseDays];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    UserModel *copy = [UserModel new];
    
    copy.aDDRESS = [self.aDDRESS copy];
    copy.aDDDATE = [self.aDDDATE copy];
    copy.avatar = [self.avatar copy];
    copy.cOMPANYNAME = [self.cOMPANYNAME copy];
    copy.eDITDATE = [self.eDITDATE copy];
    copy.fLEETTYPE = [self.fLEETTYPE copy];
    copy.iDX = [self.iDX copy];
    copy.oPERATORIDX = [self.oPERATORIDX copy];
    copy.rECOMNAME = [self.rECOMNAME copy];
    copy.uSERNAME = [self.uSERNAME copy];
    copy.uSERTYPE = [self.uSERTYPE copy];
    copy.uSERCODE = [self.uSERCODE copy];
    copy.pASSWORD = [self.pASSWORD copy];
    copy.useDays = [self.useDays copy];
    
    return copy;
}

@end
