//
//  AddFleetService.h
//  CMClient
//
//  Created by 凯东源 on 17/2/23.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 添加车队 回调协议
@protocol AddFleetServiceDelegate <NSObject>

@optional
- (void)successOfAddFleet:(NSString *)msg;

@optional
- (void)failureOfAddFleet:(NSString *)msg;

@end


@interface AddFleetService : NSObject

@property (nonatomic, weak) id<AddFleetServiceDelegate> delegate;

- (void)addFleet:(NSString *)USER_IDX andFLEET_PROPERTY:(NSString *)FLEET_PROPERTY andTMS_NAME:(NSString *)TMS_NAME andFLEET_NAME:(NSString *)FLEET_NAME andFLEET_DESC:(NSString *)FLEET_DESC andCONTACT_PERSON:(NSString *)CONTACT_PERSON andCONTACT_TEL:(NSString *)CONTACT_TEL;

@end
