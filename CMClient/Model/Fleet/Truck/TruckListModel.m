//
//  TruckListModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "TruckListModel.h"

@implementation TruckListModel


NSString *const kTruckListModelAuthority = @"Authority";
NSString *const kTruckListModelTruck = @"Vehicle";


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kTruckListModelAuthority] isKindOfClass:[NSNull class]]){
        self.authority = [[TruckAuthorityModel alloc] initWithDictionary:dictionary[kTruckListModelAuthority]];
    }
    
    if(dictionary[kTruckListModelTruck] != nil && [dictionary[kTruckListModelTruck] isKindOfClass:[NSArray class]]){
        NSArray * truckDictionaries = dictionary[kTruckListModelTruck];
        NSMutableArray * truckItems = [NSMutableArray array];
        for(NSDictionary * driverDictionary in truckDictionaries){
            TruckModel * driverItem = [[TruckModel alloc] initWithDictionary:driverDictionary];
            [truckItems addObject:driverItem];
        }
        self.truck = truckItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.authority != nil){
        dictionary[kTruckListModelAuthority] = [self.authority toDictionary];
    }
    if(self.truck != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(TruckModel * driverElement in self.truck){
            [dictionaryElements addObject:[driverElement toDictionary]];
        }
        dictionary[kTruckListModelTruck] = dictionaryElements;
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
    if(self.authority != nil){
        [aCoder encodeObject:self.authority forKey:kTruckListModelAuthority];
    }
    if(self.truck != nil){
        [aCoder encodeObject:self.truck forKey:kTruckListModelTruck];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.authority = [aDecoder decodeObjectForKey:kTruckListModelAuthority];
    self.truck = [aDecoder decodeObjectForKey:kTruckListModelTruck];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    TruckListModel *copy = [TruckListModel new];
    
    copy.authority = [self.authority copy];
    copy.truck = [self.truck copy];
    
    return copy;
}

@end
