//
//  FleetListModel.m
//  CMClient
//
//  Created by 凯东源 on 17/2/16.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "FleetListModel.h"


NSString *const kFleetListModelFleetModel = @"Fleet";


@implementation FleetListModel

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kFleetListModelFleetModel] != nil && [dictionary[kFleetListModelFleetModel] isKindOfClass:[NSArray class]]){
        NSArray * fleetModelDictionaries = dictionary[kFleetListModelFleetModel];
        NSMutableArray * fleetModelItems = [NSMutableArray array];
        for(NSDictionary * fleetModelDictionary in fleetModelDictionaries){
            FleetModel * fleetModelItem = [[FleetModel alloc] initWithDictionary:fleetModelDictionary];
            [fleetModelItems addObject:fleetModelItem];
        }
        self.fleetModel = fleetModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.fleetModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(FleetModel * fleetModelElement in self.fleetModel){
            [dictionaryElements addObject:[fleetModelElement toDictionary]];
        }
        dictionary[kFleetListModelFleetModel] = dictionaryElements;
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
    if(self.fleetModel != nil){
        [aCoder encodeObject:self.fleetModel forKey:kFleetListModelFleetModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.fleetModel = [aDecoder decodeObjectForKey:kFleetListModelFleetModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    FleetListModel *copy = [FleetListModel new];
    
    copy.fleetModel = [self.fleetModel copy];
    
    return copy;
}

@end
