//
//  OrderInfoModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/8.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "OrderInfoModel.h"

NSString *const kOrderInfoModelOrderDetailItemModel = @"OrderDetail";
NSString *const kOrderInfoModelOrderDetailModel = @"Order";

@implementation OrderInfoModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kOrderInfoModelOrderDetailItemModel] != nil && [dictionary[kOrderInfoModelOrderDetailItemModel] isKindOfClass:[NSArray class]]){
        NSArray * orderDetailItemModelDictionaries = dictionary[kOrderInfoModelOrderDetailItemModel];
        NSMutableArray * orderDetailItemModelItems = [NSMutableArray array];
        for(NSDictionary * orderDetailItemModelDictionary in orderDetailItemModelDictionaries){
            OrderDetailItemModel * orderDetailItemModelItem = [[OrderDetailItemModel alloc] initWithDictionary:orderDetailItemModelDictionary];
            [orderDetailItemModelItems addObject:orderDetailItemModelItem];
        }
        self.orderDetailItemModel = orderDetailItemModelItems;
    }
    if(![dictionary[kOrderInfoModelOrderDetailModel] isKindOfClass:[NSNull class]]){
        self.orderDetailModel = [[OrderDetailModel alloc] initWithDictionary:dictionary[kOrderInfoModelOrderDetailModel]];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.orderDetailItemModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(OrderDetailItemModel * orderDetailItemModelElement in self.orderDetailItemModel){
            [dictionaryElements addObject:[orderDetailItemModelElement toDictionary]];
        }
        dictionary[kOrderInfoModelOrderDetailItemModel] = dictionaryElements;
    }
    if(self.orderDetailModel != nil){
        dictionary[kOrderInfoModelOrderDetailModel] = [self.orderDetailModel toDictionary];
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
    if(self.orderDetailItemModel != nil){
        [aCoder encodeObject:self.orderDetailItemModel forKey:kOrderInfoModelOrderDetailItemModel];
    }
    if(self.orderDetailModel != nil){
        [aCoder encodeObject:self.orderDetailModel forKey:kOrderInfoModelOrderDetailModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.orderDetailItemModel = [aDecoder decodeObjectForKey:kOrderInfoModelOrderDetailItemModel];
    self.orderDetailModel = [aDecoder decodeObjectForKey:kOrderInfoModelOrderDetailModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    OrderInfoModel *copy = [OrderInfoModel new];
    
    copy.orderDetailItemModel = [self.orderDetailItemModel copy];
    copy.orderDetailModel = [self.orderDetailModel copy];
    
    return copy;
}

@end
