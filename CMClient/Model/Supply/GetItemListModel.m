//
//  GetItemListModel.m
//  CMClient
//
//  Created by 凯东源 on 17/5/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "GetItemListModel.h"

NSString *const kGetItemListModelSupplyType = @"SupplyType";
NSString *const kGetItemListModelVehicleSize = @"VehicleSize";
NSString *const kGetItemListModelVehicleType = @"VehicleType";

@implementation GetItemListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kGetItemListModelSupplyType] isKindOfClass:[NSNull class]]){
        self.supplyType = dictionary[kGetItemListModelSupplyType];
    }
    if(![dictionary[kGetItemListModelVehicleSize] isKindOfClass:[NSNull class]]){
        self.vehicleSize = dictionary[kGetItemListModelVehicleSize];
    }
    if(![dictionary[kGetItemListModelVehicleType] isKindOfClass:[NSNull class]]){
        self.vehicleType = dictionary[kGetItemListModelVehicleType];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.supplyType != nil){
        dictionary[kGetItemListModelSupplyType] = self.supplyType;
    }
    if(self.vehicleSize != nil){
        dictionary[kGetItemListModelVehicleSize] = self.vehicleSize;
    }
    if(self.vehicleType != nil){
        dictionary[kGetItemListModelVehicleType] = self.vehicleType;
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
    if(self.supplyType != nil){
        [aCoder encodeObject:self.supplyType forKey:kGetItemListModelSupplyType];
    }
    if(self.vehicleSize != nil){
        [aCoder encodeObject:self.vehicleSize forKey:kGetItemListModelVehicleSize];
    }
    if(self.vehicleType != nil){
        [aCoder encodeObject:self.vehicleType forKey:kGetItemListModelVehicleType];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.supplyType = [aDecoder decodeObjectForKey:kGetItemListModelSupplyType];
    self.vehicleSize = [aDecoder decodeObjectForKey:kGetItemListModelVehicleSize];
    self.vehicleType = [aDecoder decodeObjectForKey:kGetItemListModelVehicleType];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    GetItemListModel *copy = [GetItemListModel new];
    
    copy.supplyType = [self.supplyType copy];
    copy.vehicleSize = [self.vehicleSize copy];
    copy.vehicleType = [self.vehicleType copy];
    
    return copy;
}

@end
