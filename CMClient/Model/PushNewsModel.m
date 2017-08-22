//
//  PushNewsModel.m
//  CMClient
//
//  Created by 凯东源 on 17/3/30.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "PushNewsModel.h"


NSString *const kPushNewsModelADDDATE = @"ADD_DATE";
NSString *const kPushNewsModelIDX = @"IDX";
NSString *const kPushNewsModelISREAD = @"ISREAD";
NSString *const kPushNewsModelMESSAGE = @"MESSAGE";
NSString *const kPushNewsModelOrderNoListModel = @"SHIPMENT_List";
NSString *const kPushNewsModelSHIPMENTIDX = @"SHIPMENTIDX";
NSString *const kPushNewsModelSHIPMENTNO = @"SHIPMENTNO";
NSString *const kPushNewsModelTITLE = @"TITLE";
NSString *const kPushNewsModelTYPE = @"TYPE";
NSString *const kPushNewsModelUSERID = @"USER_ID";


@implementation PushNewsModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kPushNewsModelADDDATE] isKindOfClass:[NSNull class]]){
        self.aDDDATE = dictionary[kPushNewsModelADDDATE];
    }
    if(![dictionary[kPushNewsModelIDX] isKindOfClass:[NSNull class]]){
        self.iDX = dictionary[kPushNewsModelIDX];
    }
    if(![dictionary[kPushNewsModelISREAD] isKindOfClass:[NSNull class]]){
        self.iSREAD = dictionary[kPushNewsModelISREAD];
    }
    if(![dictionary[kPushNewsModelMESSAGE] isKindOfClass:[NSNull class]]){
        self.mESSAGE = dictionary[kPushNewsModelMESSAGE];
    }
    if(dictionary[kPushNewsModelOrderNoListModel] != nil && [dictionary[kPushNewsModelOrderNoListModel] isKindOfClass:[NSArray class]]){
        NSArray * orderNoListModelDictionaries = dictionary[kPushNewsModelOrderNoListModel];
        NSMutableArray * orderNoListModelItems = [NSMutableArray array];
        for(NSDictionary * orderNoListModelDictionary in orderNoListModelDictionaries){
            OrderNoListModel * orderNoListModelItem = [[OrderNoListModel alloc] initWithDictionary:orderNoListModelDictionary];
            [orderNoListModelItems addObject:orderNoListModelItem];
        }
        self.orderNoListModel = orderNoListModelItems;
    }
    if(![dictionary[kPushNewsModelSHIPMENTIDX] isKindOfClass:[NSNull class]]){
        self.sHIPMENTIDX = dictionary[kPushNewsModelSHIPMENTIDX];
    }
    if(![dictionary[kPushNewsModelSHIPMENTNO] isKindOfClass:[NSNull class]]){
        self.sHIPMENTNO = dictionary[kPushNewsModelSHIPMENTNO];
    }
    if(![dictionary[kPushNewsModelTITLE] isKindOfClass:[NSNull class]]){
        self.tITLE = dictionary[kPushNewsModelTITLE];
    }
    if(![dictionary[kPushNewsModelTYPE] isKindOfClass:[NSNull class]]){
        self.tYPE = dictionary[kPushNewsModelTYPE];
    }
    if(![dictionary[kPushNewsModelUSERID] isKindOfClass:[NSNull class]]){
        self.uSERID = dictionary[kPushNewsModelUSERID];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.aDDDATE != nil){
        dictionary[kPushNewsModelADDDATE] = self.aDDDATE;
    }
    if(self.iDX != nil){
        dictionary[kPushNewsModelIDX] = self.iDX;
    }
    if(self.iSREAD != nil){
        dictionary[kPushNewsModelISREAD] = self.iSREAD;
    }
    if(self.mESSAGE != nil){
        dictionary[kPushNewsModelMESSAGE] = self.mESSAGE;
    }
    if(self.orderNoListModel != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(OrderNoListModel * orderNoListModelElement in self.orderNoListModel){
            [dictionaryElements addObject:[orderNoListModelElement toDictionary]];
        }
        dictionary[kPushNewsModelOrderNoListModel] = dictionaryElements;
    }
    if(self.sHIPMENTIDX != nil){
        dictionary[kPushNewsModelSHIPMENTIDX] = self.sHIPMENTIDX;
    }
    if(self.sHIPMENTNO != nil){
        dictionary[kPushNewsModelSHIPMENTNO] = self.sHIPMENTNO;
    }
    if(self.tITLE != nil){
        dictionary[kPushNewsModelTITLE] = self.tITLE;
    }
    if(self.tYPE != nil){
        dictionary[kPushNewsModelTYPE] = self.tYPE;
    }
    if(self.uSERID != nil){
        dictionary[kPushNewsModelUSERID] = self.uSERID;
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
    if(self.aDDDATE != nil){
        [aCoder encodeObject:self.aDDDATE forKey:kPushNewsModelADDDATE];
    }
    if(self.iDX != nil){
        [aCoder encodeObject:self.iDX forKey:kPushNewsModelIDX];
    }
    if(self.iSREAD != nil){
        [aCoder encodeObject:self.iSREAD forKey:kPushNewsModelISREAD];
    }
    if(self.mESSAGE != nil){
        [aCoder encodeObject:self.mESSAGE forKey:kPushNewsModelMESSAGE];
    }
    if(self.orderNoListModel != nil){
        [aCoder encodeObject:self.orderNoListModel forKey:kPushNewsModelOrderNoListModel];
    }
    if(self.sHIPMENTIDX != nil){
        [aCoder encodeObject:self.sHIPMENTIDX forKey:kPushNewsModelSHIPMENTIDX];
    }
    if(self.sHIPMENTNO != nil){
        [aCoder encodeObject:self.sHIPMENTNO forKey:kPushNewsModelSHIPMENTNO];
    }
    if(self.tITLE != nil){
        [aCoder encodeObject:self.tITLE forKey:kPushNewsModelTITLE];
    }
    if(self.tYPE != nil){
        [aCoder encodeObject:self.tYPE forKey:kPushNewsModelTYPE];
    }
    if(self.uSERID != nil){
        [aCoder encodeObject:self.uSERID forKey:kPushNewsModelUSERID];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.aDDDATE = [aDecoder decodeObjectForKey:kPushNewsModelADDDATE];
    self.iDX = [aDecoder decodeObjectForKey:kPushNewsModelIDX];
    self.iSREAD = [aDecoder decodeObjectForKey:kPushNewsModelISREAD];
    self.mESSAGE = [aDecoder decodeObjectForKey:kPushNewsModelMESSAGE];
    self.orderNoListModel = [aDecoder decodeObjectForKey:kPushNewsModelOrderNoListModel];
    self.sHIPMENTIDX = [aDecoder decodeObjectForKey:kPushNewsModelSHIPMENTIDX];
    self.sHIPMENTNO = [aDecoder decodeObjectForKey:kPushNewsModelSHIPMENTNO];
    self.tITLE = [aDecoder decodeObjectForKey:kPushNewsModelTITLE];
    self.tYPE = [aDecoder decodeObjectForKey:kPushNewsModelTYPE];
    self.uSERID = [aDecoder decodeObjectForKey:kPushNewsModelUSERID];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    PushNewsModel *copy = [PushNewsModel new];
    
    copy.aDDDATE = [self.aDDDATE copy];
    copy.iDX = [self.iDX copy];
    copy.iSREAD = [self.iSREAD copy];
    copy.mESSAGE = [self.mESSAGE copy];
    copy.orderNoListModel = [self.orderNoListModel copy];
    copy.sHIPMENTIDX = [self.sHIPMENTIDX copy];
    copy.sHIPMENTNO = [self.sHIPMENTNO copy];
    copy.tITLE = [self.tITLE copy];
    copy.tYPE = [self.tYPE copy];
    copy.uSERID = [self.uSERID copy];
    
    return copy;
}

@end
