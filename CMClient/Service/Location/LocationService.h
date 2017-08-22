//
//  LocationService.h
//  CMClient
//
//  Created by 凯东源 on 17/2/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LocationServiceDelegate <NSObject>

@optional
- (void)uploadOneLocationSuccess;

@optional
- (void)uploadOneLocationFailure;

@optional
- (void)uploadMoreLocationSuccess;

@optional
- (void)uploadMoreLocationFailure;

@end

@interface LocationService : NSObject

@property (weak, nonatomic) id <LocationServiceDelegate> delegate;

/// 上传位置点时间间隔，默认为0.2分钟，后台返回的type动态更改上传时间间隔，KVO观察此对象
@property (strong, nonatomic) NSNumber *updataLocationSpanTimeMin;

/**
 * 上传位置信息
 *
 * location: 位置信息 CLLocationCoordinate2D
 */
- (void)updataLocation : (CLLocationCoordinate2D) location;

/**
 * 将位置点信息保存到本地
 *
 * location: 位置信息 CLLocationCoordinate2D
 */
- (void)saveLocationPointInLocal:(CLLocationCoordinate2D)location;

@end
