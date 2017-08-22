//
//  DeleteDriverService.h
//  CMClient
//
//  Created by 凯东源 on 17/3/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 删除司机 回调协议
@protocol DeleteDriverServiceDelegate <NSObject>

/// 删除司机成功
@optional
- (void)successOfDeleteDriver:(NSIndexPath *)indexPath;

/// 删除司机失败
@optional
- (void)failureOfDeleteDriver:(NSString *)msg;

@end


@interface DeleteDriverService : NSObject

@property (nonatomic, weak) id<DeleteDriverServiceDelegate> delegate;

- (void)DeleteDriver:(NSString *)USER_IDX andFLEET_ID:(NSString *)FLEET_ID andDRIVER_IDX:(NSString *)DRIVER_IDX andCellIndexPathRow:(NSIndexPath *)indexPath;

@end
