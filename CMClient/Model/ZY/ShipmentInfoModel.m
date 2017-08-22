//
//  ShipmentInfoModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/7.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "ShipmentInfoModel.h"


NSString *const kShipmentInfoModelOrderModel = @"Order";
NSString *const kShipmentInfoModelShipmentModel = @"Shipment";


@implementation ShipmentInfoModel


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kShipmentInfoModelOrderModel] != nil && [dictionary[kShipmentInfoModelOrderModel] isKindOfClass:[NSArray class]]){
        NSArray * orderModelDictionaries = dictionary[kShipmentInfoModelOrderModel];
        NSMutableArray * orderModelItems = [NSMutableArray array];
        for(NSDictionary * orderModelDictionary in orderModelDictionaries){
            OrderModel * orderModelItem = [[OrderModel alloc] initWithDictionary:orderModelDictionary];
            [orderModelItems addObject:orderModelItem];
        }
        self.orderModel = orderModelItems;
    }
    if(![dictionary[kShipmentInfoModelShipmentModel] isKindOfClass:[NSNull class]]){
        self.shipmentModel = [[ShipmentModel alloc] initWithDictionary:dictionary[kShipmentInfoModelShipmentModel]];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.orderModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(OrderModel * orderModelElement in self.orderModel){
            [dictionaryElements addObject:[orderModelElement toDictionary]];
        }
        dictionary[kShipmentInfoModelOrderModel] = dictionaryElements;
    }
    if(self.shipmentModel != nil){
        dictionary[kShipmentInfoModelShipmentModel] = [self.shipmentModel toDictionary];
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
    if(self.orderModel != nil){
        [aCoder encodeObject:self.orderModel forKey:kShipmentInfoModelOrderModel];
    }
    if(self.shipmentModel != nil){
        [aCoder encodeObject:self.shipmentModel forKey:kShipmentInfoModelShipmentModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.orderModel = [aDecoder decodeObjectForKey:kShipmentInfoModelOrderModel];
    self.shipmentModel = [aDecoder decodeObjectForKey:kShipmentInfoModelShipmentModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    ShipmentInfoModel *copy = [ShipmentInfoModel new];
    
    copy.orderModel = [self.orderModel copy];
    copy.shipmentModel = [self.shipmentModel copy];
    
    return copy;
}

@end
