//
//  LocationService.m
//  CMClient
//
//  Created by 凯东源 on 17/2/3.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "LocationService.h"
#import "LocationContineTimeModel.h"
#import "AppDelegate.h"
#import <AFNetworking.h>
#import "Tools.h"
//#import "NSDictionary+Extension.h"

@interface LocationService () {
    /// 上传缓存位置点信息集合是每次上传的数量
    int _updataCacheLocationsCount;
    AppDelegate *_app;
}

@end

@implementation LocationService


#pragma mark - 初始化
- (instancetype)init {
    if(self = [super init]) {
        _updataLocationSpanTimeMin = @(0.2);
        _updataCacheLocationsCount = 20;
        _app = (AppDelegate *)[[UIApplication sharedApplication] delegate];//单例初始化方式
    }
    return self;
}


#pragma mark - 上传单点
/**
 * 上传单个位置点
 *
 * location: 需要上传的点
 */
- (void)updataOneLocation:(CLLocationCoordinate2D)location {
    LMLog(@"上传单个位置点");
    __weak typeof(self) weakSelf = self;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                _app.user.iDX, @"UserIDX",
                                @(location.longitude), @"Lng",
                                @(location.latitude), @"Lat",
                                @"ios默认code地址", @"Address",
                                @"", @"strLicense",
                                nil];
    
    LMLog(@"上传单点josn:%@", parameters);
    
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    [manager POST:API_UploadPosition parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"请求成功---%@", responseObject);
        CGFloat type = [responseObject[@"type"] floatValue];
        if(type >= 1) {//发送成功，并且需要更改上传定位时间间隔
            LMLog(@"上传单点成功");
            if([weakSelf.updataLocationSpanTimeMin floatValue] != type) {//需要更改上传时间间隔
                LMLog(@"更改上传间隔为:%.f分钟", type);
                weakSelf.updataLocationSpanTimeMin = @(type);
            } else {
                LMLog(@"上传间隔不变为:%.f分钟", type);
            }
        } else if(type == 0) {//发送失败
            [weakSelf saveLocationPointInLocal:location];
            NSString *msg = [NSString stringWithFormat:@"type为:%f，上传单点失败，位置点已缓存到本地", type];
            LMLog(@"%@", msg);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakSelf saveLocationPointInLocal:location];
        LMLog(@"请求失败error为：%@，位置点已缓存到本地", error);
    }];
}


#pragma mark - 上传集合点
/**
 * 上传位置点集合
 *
 * locations: 需要上传的位置点集合
 */
- (void)updataLocations:(NSMutableArray *)locations {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                _app.user.iDX, @"strUserIdx",
                                [self changeLocationContineTimeListToJsonString:locations], @"strJson",
                                @"", @"strLicense",
                                nil];
    
    LMLog(@"上传集合点josn:%@", parameters);
    
    __weak typeof(self) weakSelf = self;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:API_CurrentLocaltionList parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        nil;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LMLog(@"请求成功---%@", responseObject);
        CGFloat type = [responseObject[@"type"] floatValue];
        if(type >= 1) {//上传位置点信息集合成功
            [weakSelf deleteUpdataLocationsFromLocal];
            NSMutableArray *array = [weakSelf getLocalLocationPointList];
            if(array.count > 0) {
                LMLog(@"本地还有位置点缓存数据，继续上传缓存本地位置点信息");
                [weakSelf updataCacheLocations];
            }
            
            LMLog(@"集合点上传成功");
            if([weakSelf.updataLocationSpanTimeMin floatValue] != type) {//需要更改上传时间间隔
                LMLog(@"更改上传间隔为:%f分钟", type);
                weakSelf.updataLocationSpanTimeMin = @(type);
            } else {
                LMLog(@"上传间隔不变为:%f分钟", type);
            }
            
        }else {
            NSString *msg = [NSString stringWithFormat:@"上传集合点成功，返回异常，type：%f", type];
            LMLog(@"%@", msg);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LMLog(@"上传位置点集合 -> 请求失败，错误为:%@", error);
    }];
}


#pragma mark - 功能函数
/**
 * 上传位置信息
 *
 * location: 位置信息 CLLocationCoordinate2D
 */
- (void)updataLocation : (CLLocationCoordinate2D) location {
    NSUInteger cacheCount = [self getLocalLocationPointListCount];
    LMLog(@"本地保存的位置点数据数量：%lu", cacheCount);
    if(cacheCount > 0) {
        LMLog(@"本地有缓存数据，先保存到本地在上传");
        [self saveLocationPointInLocal:location];
        [self updataCacheLocations];
    }else {//本地无保存位置点信息，直接上传
        LMLog(@"本地无保存位置点信息，直接上传");
        [self updataOneLocation:location];
    }
}


/**
 上传缓存的位置点信息集合
 */
- (void)updataCacheLocations {
    LMLog(@"上传缓存的位置点信息集合");
    NSMutableArray *array = [self getLocalLocationPointList];
    if(array.count > _updataCacheLocationsCount) {
        //超过单次上传数量，分批上传，每次上传20条数据（默认）
        LMLog(@"超过单次上传数量，分批上传");
        NSMutableArray *arrTemp = [[NSMutableArray alloc] init];
        for(int i = 0; i < _updataCacheLocationsCount; i++) {
            [arrTemp addObject:array[i]];
        }
        [self updataLocations:arrTemp];
    }else {//小于单次上传数量，直接上传
        LMLog(@"小于单次上传数量，直接上传");
        [self updataLocations:array];
    }
}


/**
 * 获取本地保存的位置点集合信息
 *
 * return 本地保存的位置点集合
 */
- (NSMutableArray *)getLocalLocationPointList {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"locationList"];
    NSMutableArray *locationContineTimeList = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:data]];
    if(locationContineTimeList.count > 0) {
        LMLog(@"本地缓存数据：%@", locationContineTimeList);
        return locationContineTimeList;
    } else {
        LMLog(@"本地无缓存数据");
    }
    return [[NSMutableArray alloc] init];
}


/**
 * 获取本地保存的位置点数量
 *
 * return 本地保存的位置点数量
 */
- (NSUInteger)getLocalLocationPointListCount {
    NSData *d = [[NSUserDefaults standardUserDefaults] objectForKey:@"locationList"];
    return [[NSKeyedUnarchiver unarchiveObjectWithData:d] count];
}


/**
 从本地保存的位置信息中删除上传完的位置信息集合
 */
- (void)deleteUpdataLocationsFromLocal {
    LMLog(@"从本地保存的位置信息中删除上传完的位置信息集合");
    NSMutableArray *array = [self getLocalLocationPointList];
    
    if(array.count > _updataCacheLocationsCount) {
        //删除前20个
        for(int i = 0; i < _updataCacheLocationsCount; i++) {
            if(array.count > 0) {
                [array removeObjectAtIndex:0];
            }
        }
        
        //剩下的重新排序
        NSInteger count = array.count;
        for (int i = 0; i < count; i++) {
            LocationContineTimeModel *model = array[i];
            model.iDField = [NSString stringWithFormat:@"%d", i];
        }
    } else {
        
        [array removeAllObjects];
    }
    
    //重新存储
    NSData *d = [NSKeyedArchiver archivedDataWithRootObject:array];
    [[NSUserDefaults standardUserDefaults] setValue:d forKey:@"locationList"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


/**
 * 将位置点信息保存到本地
 *
 * location: 位置信息 CLLocationCoordinate2D
 */
- (void)saveLocationPointInLocal:(CLLocationCoordinate2D)location {
    LMLog(@"保存位置点信息到本地");
    LocationContineTimeModel *locationModel = [self changeCLLocationCoordinated2DToLocationContineTime:location];
    NSMutableArray *array = [self getLocalLocationPointList];
    [array addObject:locationModel];
    
    //再次更改本地位置点数据中的 id ，确保 id 的值是顺序的，后台排序用
    NSInteger locationContineTimeCount = array.count;
    for (int i = 0; i < locationContineTimeCount; i++) {
        LocationContineTimeModel *model;
        model = array[i];
        model.iDField = [NSString stringWithFormat:@"%d", i];
    }
    
    NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:array];
    [[NSUserDefaults standardUserDefaults] setObject:dataSave forKey:@"locationList"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 * 将百度地图的位置点信息转换成本地的 LocationContineTime
 *
 * location: 需要转换的位置点 CLLocationCoordinate2D
 *
 * return LocationContineTime
 */
- (LocationContineTimeModel *)changeCLLocationCoordinated2DToLocationContineTime:(CLLocationCoordinate2D)location {
    LMLog(@"将百度地图的位置点信息转换成本地的 LocationContineTimeModel");
    LocationContineTimeModel *locationContineTime = [[LocationContineTimeModel alloc] init];
    locationContineTime.iDField = [NSString stringWithFormat:@"%lu", (unsigned long)[self getLocalLocationPointListCount]];
    locationContineTime.uSERIDX = _app.user.iDX;
    locationContineTime.aDDRESS = @"默认code地址";
    locationContineTime.cORDINATEX = location.longitude;
    locationContineTime.cORDINATEY = location.latitude;
    locationContineTime.tIME = [Tools getCurrentDate];
    return locationContineTime;
}


/**
 * 将位置信息点集合转换成 string
 *
 * list: 需要转换的位置点集合
 *
 * return 转换完的 json 格式的 string
 */
- (NSString *)changeLocationContineTimeListToJsonString:(NSMutableArray *)array {
    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < array.count; i++) {
        LocationContineTimeModel *model = array[i];
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              model.iDField, @"ID",
                              model.uSERIDX, @"USERIDX",
                              @(model.cORDINATEX), @"CORDINATEX",
                              @(model.cORDINATEY), @"CORDINATEY",
                              model.aDDRESS, @"ADDRESS",
                              model.tIME, @"TIME",
                              nil];
        [arrM addObject:dict];
    }
    
    NSDictionary *arrReturn = [NSDictionary dictionaryWithObject:arrM forKey:@"result"];
    NSString *returnStr = [Tools JsonStringWithDictonary:arrReturn];
    
    return returnStr;
}

@end
