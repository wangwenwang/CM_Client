//
//  AppDelegate.m
//  CMClient
//
//  Created by 凯东源 on 17/1/14.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AppDelegate.h"
#import "WelcomeViewController.h"
#import <BaiduMapAPI_Base/BMKGeneralDelegate.h>
#import <BaiduMapAPI_Base/BMKMapManager.h>
#import "Tools.h"
#import "HttpServerLogger.h"
#import "GeTuiSdk.h"

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
#import <UserNotifications/UserNotifications.h>
#endif



//个推
#define kGtAppId @"L2aQcow37qAL51pmMrldi7"
#define kGtAppKey @"imCjJ1tY8mATtyW0gidi4A"
#define kGtAppSecret @"lA5bTCiQPs8R08dbS0rlD4"



@interface AppDelegate ()<BMKGeneralDelegate, GeTuiSdkDelegate, UNUserNotificationCenterDelegate>{
    BMKMapManager * _mapManager;
    //http://www.acfun.cn/v/ac3334659
    //http://www.acfun.cn/v/ac3450123
}

@end


@implementation AppDelegate

- (instancetype)init {
    if(self = [super init]) {
        
        //初始化全局变量
        _user = [[UserModel alloc] init];
        _DEVICE_TOKEN = @"";
        _CID = @"";
    }
    return self;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    fprintf(stderr, "%s\n", "i m fprintf");
    
    //真机记录日记到文件  不能用TARGET_OS_IPHONE
    if(!TARGET_IPHONE_SIMULATOR) {
        //    [self redirectNSLogToDocumentFolder];
    }
    
    
//    [[HttpServerLogger shared]startServer];
    
    
    NSLog(@"HomeDirectory:%@", NSHomeDirectory());
    
    //  [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"locationList"];
    //  [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSData *dataOUT = [[NSUserDefaults standardUserDefaults] objectForKey:@"locationList"];
    NSArray *userOUT = [NSKeyedUnarchiver unarchiveObjectWithData:dataOUT];
    LMLog(@"缓存位置点：%@", userOUT);
    
    
    
    //获取推送权限
//    [Tools registerNotification:application];
    
    
    //设置主题颜色
    [UINavigationBar appearance].translucent = NO;
    [[UINavigationBar appearance] setBarTintColor:CMColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    
    
    //去掉返回按钮得字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
    
    //地图操作
    _mapManager = [[BMKMapManager alloc] init];
    // 如果要关注网络及授权验证事件，请设定generalDelegate参数
    BOOL ret = [_mapManager start:@"5nvHPQFbbkLOeAfNjQpRychSmU1YRitO"  generalDelegate:self];
    if (!ret) {
        LMLog(@"百度地图加载失败！");
    }else {
        LMLog(@"百度地图加载成功！");
    }
    
    
    
    //个推注册
    LMLog(@"个推开发平台测试客户端V%@", [GeTuiSdk version]);
    // [ GTSdk ]：是否允许APP后台运行
//        [GeTuiSdk runBackgroundEnable:YES];
    
    // [ GTSdk ]：是否运行电子围栏Lbs功能和是否SDK主动请求用户定位
    [GeTuiSdk lbsLocationEnable:YES andUserVerify:YES];
    
    // [ GTSdk ]：自定义渠道
    [GeTuiSdk setChannelId:@"GT-Channel"];
    
    // [ GTSdk ]：使用APPID/APPKEY/APPSECRENT启动个推
    [GeTuiSdk startSdkWithAppId:kGtAppId appKey:kGtAppKey appSecret:kGtAppSecret delegate:self];
    
    // 注册APNs - custom method - 开发者自定义的方法
    [self registerRemoteNotification];
    
    
    
    //界面生成
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    //设置根控制器
    WelcomeViewController *welcomeVC = [[WelcomeViewController alloc] init];
    [_window setRootViewController:welcomeVC];
    [_window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    NSUInteger *udBadge = [[NSUserDefaults standardUserDefaults] integerForKey:@"kApplicationIconBadgeNumber"];
    
    
    if(udBadge != 0) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kMainViewController_reloadData" object:nil];
    }
    LMLog(@"clear bedge");
    
    application.applicationIconBadgeNumber = 0;
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"kApplicationIconBadgeNumber"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [application cancelAllLocalNotifications];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - BMKGeneralDelegate
// 百度地图获取网络连接状态
- (void)onGetNetworkState:(int)iError {
    if(iError == 0) {
        LMLog(@"联网成功");
    }else {
        LMLog(@"联网失败，错误代码：Error:%d", iError);
    }
}


// 百度地图key是否正确能够连接
- (void)onGetPermissionState:(int)iError {
    if (iError == 0) {
        LMLog(@"授权成功");
    }else{
        LMLog(@"授权失败，错误代码：Error:%d", iError);
    }
}


#pragma mark - 日记存储到本地
- (void)redirectNSLogToDocumentFolder{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    NSString *fileName =[NSString stringWithFormat:@"%@.log",localeDate];
    NSString *logFilePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);
}


#pragma mark - background fetch  唤醒
- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // [ GTSdk ]：Background Fetch 恢复SDK 运行
    [GeTuiSdk resume];
    
    completionHandler(UIBackgroundFetchResultNewData);
}


#pragma mark - 用户通知(推送) _自定义方法

/** 注册远程通知 */
- (void)registerRemoteNotification {
    /*
     警告：Xcode8的需要手动开启“TARGETS -> Capabilities -> Push Notifications”
     */
    
    /*
     警告：该方法需要开发者自定义，以下代码根据APP支持的iOS系统不同，代码可以对应修改。
     以下为演示代码，注意根据实际需要修改，注意测试支持的iOS系统都能获取到DeviceToken
     */
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0 // Xcode 8编译会调用
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionCarPlay) completionHandler:^(BOOL granted, NSError *_Nullable error) {
            if (!error) {
                
                NSLog(@"request authorization succeeded!");
            }
        }];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
#else // Xcode 7编译会调用
        UIUserNotificationType types = (UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
#endif
    } else if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        UIUserNotificationType types = (UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    } else {
        UIRemoteNotificationType apn_type = (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert |
                                                                       UIRemoteNotificationTypeSound |
                                                                       UIRemoteNotificationTypeBadge);
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:apn_type];
    }
}


#pragma mark - 远程通知(推送)回调

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken{
    
    NSString *device = [[[[deviceToken description]stringByReplacingOccurrencesOfString:@"<"withString:@""]stringByReplacingOccurrencesOfString:@" "withString:@""]stringByReplacingOccurrencesOfString:@">"withString:@""];
    
    self.DEVICE_TOKEN = device;
    LMLog(@"DEVICE_TOKEN:%@", device);
}


/** 远程通知注册失败委托 */
- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error {
    
    NSLog(@"Regist Notifications fail:%@",error);
}


#pragma mark - APP运行中接收到通知(推送)处理 - iOS 10以下版本收到推送

/** APP已经接收到“远程”通知(推送) - (App运行在后台/App运行在前台)  */
- (void)application:(UIApplication*)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler {
    
    // [ GTSdk ]：将收到的APNs信息传给个推统计
    [GeTuiSdk handleRemoteNotification:userInfo];
    
    completionHandler(UIBackgroundFetchResultNewData);
    
    // 显示APNs信息到页面
    NSString *record = [NSString stringWithFormat:@"[APN]%@, %@", [NSDate date], userInfo];
    LMLog(@"%@", record);
    
    //取
    NSUInteger udBadge = [[NSUserDefaults standardUserDefaults] integerForKey:@"kApplicationIconBadgeNumber"];
    NSUInteger useBadge = udBadge + 1;
    
    //存
    [[NSUserDefaults standardUserDefaults] setInteger:useBadge forKey:@"kApplicationIconBadgeNumber"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //设置，有bug，手机会先设置1再设置+1，
    LMLog(@"由于C#后台不能用+1，所以用穿透设置badge，%lu", (unsigned long)useBadge);
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [application setApplicationIconBadgeNumber:useBadge];
    });
}


#pragma mark - iOS 10中收到推送消息

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
//  iOS 10: App在前台获取到通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    
    NSLog(@"willPresentNotification：%@", notification.request.content.userInfo);
    
    // 根据APP需要，判断是否要提示用户Badge、Sound、Alert
    completionHandler(UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert);
}


//  iOS 10: 点击通知进入App时触发
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    
    NSLog(@"didReceiveNotification：%@", response.notification.request.content.userInfo);
    
    // [ GTSdk ]：将收到的APNs信息传给个推统计
    [GeTuiSdk handleRemoteNotification:response.notification.request.content.userInfo];
    
    completionHandler();
}
#endif


#pragma mark - GeTuiSdkDelegate

/** SDK启动成功返回cid */
- (void)GeTuiSdkDidRegisterClient:(NSString *)clientId {
    // [ GTSdk ]：个推SDK已注册，返回clientId
    NSLog(@">>[GTSdk RegisterClient]:%@", clientId);
}


/** SDK收到透传消息回调 */
- (void)GeTuiSdkDidReceivePayloadData:(NSData *)payloadData andTaskId:(NSString *)taskId andMsgId:(NSString *)msgId andOffLine:(BOOL)offLine fromGtAppId:(NSString *)appId {
    // [ GTSdk ]：汇报个推自定义事件(反馈透传消息)
    [GeTuiSdk sendFeedbackMessage:90001 andTaskId:taskId andMsgId:msgId];
    
    // 数据转换
    NSString *payloadMsg = nil;
    if (payloadData) {
        payloadMsg = [[NSString alloc] initWithBytes:payloadData.bytes length:payloadData.length encoding:NSUTF8StringEncoding];
    }
    
    // 页面显示日志
    NSString *record = [NSString stringWithFormat:@"%d, %@, %@%@", ++_lastPayloadIndex, [self formateTime:[NSDate date]], payloadMsg, offLine ? @"<离线消息>" : @""];
    LMLog(@"%@", record);
    
    // 控制台打印日志
    NSString *msg = [NSString stringWithFormat:@"%@ : %@%@", [self formateTime:[NSDate date]], payloadMsg, offLine ? @"<离线消息>" : @""];
    NSLog(@">>[GTSdk ReceivePayload]:%@, taskId: %@, msgId :%@", msg, taskId, msgId);
}


- (NSString *)formateTime:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:date];
    return dateTime;
}


/** SDK收到sendMessage消息回调 */
- (void)GeTuiSdkDidSendMessage:(NSString *)messageId result:(int)result {
    // 页面显示：上行消息结果反馈
    NSString *record = @"";
    record = [NSString stringWithFormat:@"Received sendmessage:%@ result:%d", messageId, result];
    
    LMLog(@"%@", record);
}


/** SDK遇到错误回调 */
- (void)GeTuiSdkDidOccurError:(NSError *)error {
    
    // 页面显示：个推错误报告，集成步骤发生的任何错误都在这里通知，如果集成后，无法正常收到消息，查看这里的通知。
    NSLog(@"%@", [NSString stringWithFormat:@">>>[GexinSdk error]:%@", [error localizedDescription]]);
}


/** SDK运行状态通知 */
- (void)GeTuiSDkDidNotifySdkState:(SdkStatus)aStatus {
    // 页面显示更新通知SDK运行状态
    if ([GeTuiSdk status] == SdkStatusStarted) {
        
        LMLog(@"SDK已启动,clientId:%@", [GeTuiSdk clientId]);
    } else if ([GeTuiSdk status] == SdkStatusStarting) {
        
        LMLog(@"SDK正在启动");
    } else {
        
        LMLog(@"SDK已停止");
    }
}


/** SDK设置推送模式回调  */
- (void)GeTuiSdkDidSetPushMode:(BOOL)isModeOff error:(NSError *)error {
    // 页面显示错误信息
    if (error) {
        
        LMLog(@"%@", [NSString stringWithFormat:@">>>[SetModeOff error]: %@", [error localizedDescription]]);
        return;
    }
}

@end
