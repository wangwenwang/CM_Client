//
//  CheckAutograph.m
//  CMClient
//
//  Created by 凯东源 on 17/3/13.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "CheckAutograph.h"


NSString *const kCheckAutographIDX = @"IDX";
NSString *const kCheckAutographPRODUCTIDX = @"PRODUCT_IDX";
NSString *const kCheckAutographPRODUCTURL = @"PRODUCT_URL";
NSString *const kCheckAutographREMARK = @"REMARK";


@implementation CheckAutograph

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kCheckAutographIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kCheckAutographIDX];
    }
    if(![dictionary[kCheckAutographPRODUCTIDX] isKindOfClass:[NSNull class]]){
        self.pRODUCTIDX = dictionary[kCheckAutographPRODUCTIDX];
    }
    if(![dictionary[kCheckAutographPRODUCTURL] isKindOfClass:[NSNull class]]){
        self.pRODUCTURL = dictionary[kCheckAutographPRODUCTURL];
    }
    if(![dictionary[kCheckAutographREMARK] isKindOfClass:[NSNull class]]){
        self.rEMARK = dictionary[kCheckAutographREMARK];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.iDX != nil){
        dictionary[kCheckAutographIDX] = self.iDX;
    }
    if(self.pRODUCTIDX != nil){
        dictionary[kCheckAutographPRODUCTIDX] = self.pRODUCTIDX;
    }
    if(self.pRODUCTURL != nil){
        dictionary[kCheckAutographPRODUCTURL] = self.pRODUCTURL;
    }
    if(self.rEMARK != nil){
        dictionary[kCheckAutographREMARK] = self.rEMARK;
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
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kCheckAutographIDX];
    }
    if(self.pRODUCTIDX != nil){
        [aCoder encodeObject:self.pRODUCTIDX forKey:kCheckAutographPRODUCTIDX];
    }
    if(self.pRODUCTURL != nil){
        [aCoder encodeObject:self.pRODUCTURL forKey:kCheckAutographPRODUCTURL];
    }
    if(self.rEMARK != nil){
        [aCoder encodeObject:self.rEMARK forKey:kCheckAutographREMARK];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.iDX = [aDecoder decodeObjectForKey:kCheckAutographIDX];
    self.pRODUCTIDX = [aDecoder decodeObjectForKey:kCheckAutographPRODUCTIDX];
    self.pRODUCTURL = [aDecoder decodeObjectForKey:kCheckAutographPRODUCTURL];
    self.rEMARK = [aDecoder decodeObjectForKey:kCheckAutographREMARK];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CheckAutograph *copy = [CheckAutograph new];
    
    copy.iDX = [self.iDX copy];
    copy.pRODUCTIDX = [self.pRODUCTIDX copy];
    copy.pRODUCTURL = [self.pRODUCTURL copy];
    copy.rEMARK = [self.rEMARK copy];
    
    return copy;
}

@end
