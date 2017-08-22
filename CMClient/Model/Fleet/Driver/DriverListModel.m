//
//  DriverListModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "DriverListModel.h"


NSString *const kDriverListModelDriverAuthorityModel = @"Authority";
NSString *const kDriverListModelDriverModel = @"Driver";


@implementation DriverListModel


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kDriverListModelDriverAuthorityModel] isKindOfClass:[NSNull class]]){
        self.driverAuthorityModel = [[DriverAuthorityModel alloc] initWithDictionary:dictionary[kDriverListModelDriverAuthorityModel]];
    }
    
    if(dictionary[kDriverListModelDriverModel] != nil && [dictionary[kDriverListModelDriverModel] isKindOfClass:[NSArray class]]){
        NSArray * driverModelDictionaries = dictionary[kDriverListModelDriverModel];
        NSMutableArray * driverModelItems = [NSMutableArray array];
        for(NSDictionary * driverModelDictionary in driverModelDictionaries){
            DriverModel * driverModelItem = [[DriverModel alloc] initWithDictionary:driverModelDictionary];
            [driverModelItems addObject:driverModelItem];
        }
        self.driverModel = driverModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.driverAuthorityModel != nil){
        dictionary[kDriverListModelDriverAuthorityModel] = [self.driverAuthorityModel toDictionary];
    }
    if(self.driverModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(DriverModel * driverModelElement in self.driverModel){
            [dictionaryElements addObject:[driverModelElement toDictionary]];
        }
        dictionary[kDriverListModelDriverModel] = dictionaryElements;
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
    if(self.driverAuthorityModel != nil){
        [aCoder encodeObject:self.driverAuthorityModel forKey:kDriverListModelDriverAuthorityModel];
    }
    if(self.driverModel != nil){
        [aCoder encodeObject:self.driverModel forKey:kDriverListModelDriverModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.driverAuthorityModel = [aDecoder decodeObjectForKey:kDriverListModelDriverAuthorityModel];
    self.driverModel = [aDecoder decodeObjectForKey:kDriverListModelDriverModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    DriverListModel *copy = [DriverListModel new];
    
    copy.driverAuthorityModel = [self.driverAuthorityModel copy];
    copy.driverModel = [self.driverModel copy];
    
    return copy;
}

@end
