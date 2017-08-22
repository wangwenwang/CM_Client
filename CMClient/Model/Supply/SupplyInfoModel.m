//
//  SupplyInfoModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/4.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "SupplyInfoModel.h"


NSString *const kSupplyInfoModelRoutesModel = @"Routes";
NSString *const kSupplyInfoModelSupplyModel = @"Supply";


@implementation SupplyInfoModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kSupplyInfoModelRoutesModel] != nil && [dictionary[kSupplyInfoModelRoutesModel] isKindOfClass:[NSArray class]]){
        NSArray * routesModelDictionaries = dictionary[kSupplyInfoModelRoutesModel];
        NSMutableArray * routesModelItems = [NSMutableArray array];
        for(NSDictionary * routesModelDictionary in routesModelDictionaries){
            RoutesModel * routesModelItem = [[RoutesModel alloc] initWithDictionary:routesModelDictionary];
            [routesModelItems addObject:routesModelItem];
        }
        self.routesModel = routesModelItems;
    }
    if(![dictionary[kSupplyInfoModelSupplyModel] isKindOfClass:[NSNull class]]){
        self.supplyModel = [[SupplyModel alloc] initWithDictionary:dictionary[kSupplyInfoModelSupplyModel]];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.routesModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(RoutesModel * routesModelElement in self.routesModel){
            [dictionaryElements addObject:[routesModelElement toDictionary]];
        }
        dictionary[kSupplyInfoModelRoutesModel] = dictionaryElements;
    }
    if(self.supplyModel != nil){
        dictionary[kSupplyInfoModelSupplyModel] = [self.supplyModel toDictionary];
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
    if(self.routesModel != nil){
        [aCoder encodeObject:self.routesModel forKey:kSupplyInfoModelRoutesModel];
    }
    if(self.supplyModel != nil){
        [aCoder encodeObject:self.supplyModel forKey:kSupplyInfoModelSupplyModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.routesModel = [aDecoder decodeObjectForKey:kSupplyInfoModelRoutesModel];
    self.supplyModel = [aDecoder decodeObjectForKey:kSupplyInfoModelSupplyModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    SupplyInfoModel *copy = [SupplyInfoModel new];
    
    copy.routesModel = [self.routesModel copy];
    copy.supplyModel = [self.supplyModel copy];
    
    return copy;
}

@end
