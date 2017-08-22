//
//  MyBMKLocationService.h
//  CMClient
//
//  Created by 凯东源 on 17/2/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

@protocol MyBMKLocationServiceDelegate <NSObject>

@optional
- (void)successUploadLocation:(BMKUserLocation *)userLocation;

@optional
- (void)failureUploadLocation:(NSInteger)code;

@end

@interface MyBMKLocationService : BMKLocationService

@property (weak, nonatomic) id<MyBMKLocationServiceDelegate> myDelegate;

@end
