//
//  PushNewsListModel.m
//  CMClient
//
//  Created by 凯东源 on 17/2/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "PushNewsListModel.h"


NSString *const kPushNewsListModelPushNewsModel = @"result";


@implementation PushNewsListModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kPushNewsListModelPushNewsModel] != nil && [dictionary[kPushNewsListModelPushNewsModel] isKindOfClass:[NSArray class]]){
        NSArray * pushNewsModelDictionaries = dictionary[kPushNewsListModelPushNewsModel];
        NSMutableArray * pushNewsModelItems = [NSMutableArray array];
        for(NSDictionary * pushNewsModelDictionary in pushNewsModelDictionaries){
            PushNewsModel * pushNewsModelItem = [[PushNewsModel alloc] initWithDictionary:pushNewsModelDictionary];
            [pushNewsModelItems addObject:pushNewsModelItem];
        }
        self.pushNewsModel = pushNewsModelItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.pushNewsModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(PushNewsModel * pushNewsModelElement in self.pushNewsModel){
            [dictionaryElements addObject:[pushNewsModelElement toDictionary]];
        }
        dictionary[kPushNewsListModelPushNewsModel] = dictionaryElements;
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
    if(self.pushNewsModel != nil){
        [aCoder encodeObject:self.pushNewsModel forKey:kPushNewsListModelPushNewsModel];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.pushNewsModel = [aDecoder decodeObjectForKey:kPushNewsListModelPushNewsModel];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    PushNewsListModel *copy = [PushNewsListModel new];
    
    copy.pushNewsModel = [self.pushNewsModel copy];
    
    return copy;
}

@end
