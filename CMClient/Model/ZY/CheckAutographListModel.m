//
//  CheckAutographListModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/13.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "CheckAutographListModel.h"


NSString *const kCheckAutographListModelCheckAutograph = @"result";


@implementation CheckAutographListModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kCheckAutographListModelCheckAutograph] != nil && [dictionary[kCheckAutographListModelCheckAutograph] isKindOfClass:[NSArray class]]){
        NSArray * CheckAutographDictionaries = dictionary[kCheckAutographListModelCheckAutograph];
        NSMutableArray * CheckAutographItems = [NSMutableArray array];
        for(NSDictionary * CheckAutographDictionary in CheckAutographDictionaries){
            CheckAutograph * CheckAutographItem = [[CheckAutograph alloc] initWithDictionary:CheckAutographDictionary];
            [CheckAutographItems addObject:CheckAutographItem];
        }
        self.CheckAutograph = CheckAutographItems;
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.CheckAutograph != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(CheckAutograph * CheckAutographElement in self.CheckAutograph){
            [dictionaryElements addObject:[CheckAutographElement toDictionary]];
        }
        dictionary[kCheckAutographListModelCheckAutograph] = dictionaryElements;
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
    if(self.CheckAutograph != nil){
        [aCoder encodeObject:self.CheckAutograph forKey:kCheckAutographListModelCheckAutograph];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.CheckAutograph = [aDecoder decodeObjectForKey:kCheckAutographListModelCheckAutograph];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CheckAutographListModel *copy = [CheckAutographListModel new];
    
    copy.CheckAutograph = [self.CheckAutograph copy];
    
    return copy;
}

@end
