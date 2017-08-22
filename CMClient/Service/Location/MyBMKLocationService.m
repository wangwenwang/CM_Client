//
//  MyBMKLocationService.m
//  CMClient
//
//  Created by 凯东源 on 17/2/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "MyBMKLocationService.h"

@interface MyBMKLocationService ()<BMKLocationServiceDelegate>

@property (strong, nonatomic) BMKLocationService *locationService;

@end


@implementation MyBMKLocationService

- (instancetype)init {
    if(self = [super init]) {
        _locationService = [[BMKLocationService alloc] init];
        _locationService.delegate = self;
        //启动LocationService
        [_locationService startUserLocationService];
        //设置定位精度
//        _locationService.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        //指定最小距离更新(米)，默认：kCLDistanceFilterNone
        _locationService.distanceFilter = CMLocationDistance;
    }
    return self;
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    if([_myDelegate respondsToSelector:@selector(successUploadLocation:)]) {
        [_myDelegate successUploadLocation:userLocation];
    }
}

/**
 *定位失败后，会调用此函数
 *@param error 错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error {
    if([_myDelegate respondsToSelector:@selector(failureUploadLocation:)]) {
        [_myDelegate failureUploadLocation:error.code];
    }
}

@end
