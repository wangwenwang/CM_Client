//
//  Tools.m
//  CMClient
//
//  Created by 凯东源 on 17/1/14.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "Tools.h"
#import "Reachability.h"
#import "LM_alert.h"
#import <MBProgressHUD.h>

@implementation Tools

typedef void (^Animation)(void);

+ (nullable NSString *)getCurrentDate {
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:currentDate];
}


+ (nullable NSDate *)stringConvertDate:(nullable NSString *)dateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter dateFromString:dateString];
}


+ (nullable NSDictionary *)dictionaryWithJsonString:(nullable NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


+ (nullable NSString *)JsonStringWithDictonary:(nullable NSDictionary *)dict {
    NSString *jsonString = @"";
    if ([NSJSONSerialization isValidJSONObject:dict]){
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
        jsonString =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

+ (void)setRootViewControllerWithCrossDissolve:(nullable UIWindow *)window andViewController:(nullable UIViewController *)vc {
    
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        window.rootViewController = vc;
        [UIView setAnimationsEnabled:oldState];
    };
    [UIView transitionWithView:window
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
}


+ (void)setRootViewControllerWithFlipFromRight:(nullable UIWindow *)window andViewController:(nullable UIViewController *)vc {
    [UIView transitionWithView:window duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        [window setRootViewController:vc];
    } completion:^(BOOL finished) {
        nil;
    }];
}

//+ (void)setRootViewControllerWithCrossDissolve:(UIWindow *)window andViewController:(UIViewController *)vc {
//    [UIView transitionWithView:window duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
//        [window setRootViewController:vc];
//    } completion:^(BOOL finished) {
//        nil;
//    }];
//}



+ (void)registerNotification:(nullable UIApplication *)application {
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
    }else {
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    }
}


+ (BOOL)isLocationServiceOpen {
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)) {
        return YES;
    } else {
        return NO;
    }
}


+ (BOOL)isMessageNotificationServiceOpen {
    if (SystemVersion > 8.0) {
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (UIUserNotificationTypeNone != setting.types) {
            return YES;
        }
    } else {
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        if(UIRemoteNotificationTypeNone != type)
            return YES;
    }
    return NO;
}


+ (void)skipLocationSettings {
    NSString *promptLocation = [NSString stringWithFormat:@"请打开系统设置中\"隐私->定位服务\",允许%@使用定位服务", AppDisplayName];
    [LM_alert showLMAlertViewWithTitle:@"打开定位开关" message:promptLocation cancleButtonTitle:nil okButtonTitle:@"立即设置" otherButtonTitleArray:nil clickHandle:^(NSInteger index) {
        if(SystemVersion > 8.0) {
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }
        } else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"]];
        }
    }];
}


+ (void)skipNotifiationSettings {
    NSString *promptNotifity = [NSString stringWithFormat:@"请打开系统设置中\"隐私->通知服务\",允许%@使用通知服务", AppDisplayName];
    [LM_alert showLMAlertViewWithTitle:@"打开通知开关" message:promptNotifity cancleButtonTitle:nil okButtonTitle:@"立即设置" otherButtonTitleArray:nil clickHandle:^(NSInteger index) {
        if(SystemVersion > 8.0) {
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }
        } else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"]];
        }
    }];
}


+ (BOOL)isConnectionAvailable {
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    return isExistenceNetwork;
}


+ (void)showAlert:(UIView *)view andTitle:(NSString *)title {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    hud.margin = 15.0f;
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    [hud hideAnimated:YES afterDelay:2];
}


+ (void)showAlert:(nullable UIView *)view andTitle:(nullable NSString *)title andTime:(NSTimeInterval)time {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    hud.margin = 15.0f;
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    [hud hideAnimated:YES afterDelay:time];
}


+ (void)addNavRightItemTypeMore:(nullable UIViewController *)vc andAction:(nullable SEL)action {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_more"] style:UIBarButtonItemStyleDone target:vc action:action];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -15;
    vc.navigationItem.rightBarButtonItems = @[negativeSpacer, rightItem];
}


+ (void)addNavRightItemTypeAdd:(nullable UIViewController *)vc andAction:(nullable SEL)action {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_add"] style:UIBarButtonItemStyleDone target:vc action:action];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -13;
    vc.navigationItem.rightBarButtonItems = @[negativeSpacer, rightItem];
}


+ (void)addNavRightItemTypeText:(nullable UIViewController *)vc andAction:(nullable SEL)action andTitle:(nullable NSString *)title {
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStyleDone target:vc action:action];
    vc.navigationItem.rightBarButtonItem = rightItem;
}


+ (nullable UIImage *)convertViewToImage:(nullable UIView *)v {
    UIGraphicsBeginImageContext(v.bounds.size);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (nullable UIImage *)createImageWithColor:(nullable UIColor *)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


+ (BOOL)isPureFloat:(nullable NSString *)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}


+ (nullable NSString *)getSupplyStatus:(nullable NSString *)status {
    if([status isEqualToString:@"CLOSE"]) {
        return @"已关闭";
    }else if([status isEqualToString:@"OPEN"]) {
        return @"正常";
    }else if([status isEqualToString:@"CANCEL"]) {
        return @"已取消";
    }else {
        return status;
    }
}


+ (nullable NSString *)zyStatusConversionPrompt:(nullable NSString *)status {
    NSString *s = @"未知状态的装运";
    if([status isEqualToString:@"UNFINISH"]) {
        s = @"您还没有未完成装运";
    } else if([status isEqualToString:@"FINISH"]) {
        s = @"您还没有已完成装运";
    } else if([status isEqualToString:@""]) {
        s = @"您还没有装运信息";
    }
    return s;
}


+ (nullable UIImage *)getImageFromURL:(nullable NSString *)imageUrl {
    UIImage *image = nil;
    if(imageUrl) {
        NSURL *url = [NSURL URLWithString:imageUrl];
        NSData *imageData;
        if(url) {
            imageData = [NSData dataWithContentsOfURL:url];
        }
        if(imageData) {
            image = [UIImage imageWithData:imageData];
        }
    }
    return image;
}


+ (nullable NSString *)compareCurrentTime:(nullable NSString *)str {
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:timeDate];
    long temp = 0;
    NSString *result;
    if (timeInterval/60 < 1) {
        result = [NSString stringWithFormat:@"刚刚"];
    } else if((temp = timeInterval/60) <60) {
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    } else if((temp = temp/60) <24) {
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    } else if((temp = temp/24) <30) {
        result = [NSString stringWithFormat:@"%ld天前",temp];
    } else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    } else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    return  result;
}


+ (CGFloat)getHeightOfLabel:(nullable UILabel *)label andWidth:(CGFloat)width {
    
    CGSize sizeToFit = [label sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}


+ (CGFloat)getHeightOfString:(nullable NSString *)text fontSize:(CGFloat)fontSize andWidth:(CGFloat)width {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    CGSize sizeToFit = [label sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}


+ (CGFloat)twoDecimal:(nullable NSString *)string {
    CGFloat value = [string floatValue];
    NSString *str = [NSString stringWithFormat:@"%.2f", value];
    return [str floatValue];
}


+ (void)addTabBarRightItemTypeAdd:(nullable UIViewController *)vc andAction:(nullable SEL)action {
    vc.tabBarController.navigationItem.rightBarButtonItem = nil;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_add"] style:UIBarButtonItemStyleDone target:vc action:action];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -13;
    vc.tabBarController.navigationItem.rightBarButtonItems = @[negativeSpacer, rightItem];
}


+ (nullable NSData *)compressImage:(nullable UIImage *)image andMaxLength:(int)maxLength andMaxWidthAndHeight:(CGFloat)maxWidthAndHeight {
    NSData *orgData = UIImageJPEGRepresentation(image, 1);
    NSLog(@"orgData.lenth:%lu  orgImage:%@", (unsigned long)orgData.length, image);
    CGSize newSize = [self scaleImage:image andImageLength:maxWidthAndHeight];
    NSLog(@"newSize:%@", NSStringFromCGSize(newSize));
    UIImage *newImage = [self resizeImage:image andNewSize:newSize];
    NSData *cutData = UIImageJPEGRepresentation(newImage, 1.0);
    NSLog(@"CutImageData.lenth%lu   image:%@", (unsigned long)cutData.length, newImage);
    CGFloat compress = 0.9;
    NSData *data = UIImageJPEGRepresentation(newImage, compress);
    NSLog(@"--------1");
    while (data.length > maxLength && compress > 0.01) {
        
        data = UIImageJPEGRepresentation(newImage, compress);
        compress -= 0.02;
    }
    NSLog(@"--------1");
    NSLog(@"NSDATA处理后:%lu", (unsigned long)data.length);
    return data;
}


+ (CGSize)scaleImage:(nullable UIImage *)image andImageLength:(CGFloat)imageLength {
    CGFloat newWidth = image.size.width;
    CGFloat newHeight = image.size.height;
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    if (width > imageLength || height > imageLength) {
        if (width > height) {
            newWidth = imageLength;
            newHeight = newWidth * height / width;
        } else if(height > width) {
            newHeight = imageLength;
            newWidth = newHeight * width / height;
        } else {
            newWidth = imageLength;
            newHeight = imageLength;
        }
    }
    return CGSizeMake(newWidth, newHeight);
}


+ (nullable UIImage *)resizeImage:(nullable UIImage *)image andNewSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


+ (nullable NSString *)convertImageToString:(nullable UIImage *)image {
    NSData *data = UIImagePNGRepresentation(image);
    return [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}


+ (nullable NSString *)getCurrentBeforeDate_Second:(NSTimeInterval)second {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *nowDate = [NSDate date];
    NSDate *date1 = [nowDate initWithTimeIntervalSinceNow:+second];
    return [dateFormatter stringFromDate:date1];
}


+ (nullable NSString *)getCurrentBeforeDate_Day:(NSTimeInterval)day {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *nowDate = [NSDate date];
    NSDate *date1 = [nowDate initWithTimeIntervalSinceNow:+(day * 24 * 60 * 60)];
    return [dateFormatter stringFromDate:date1];
}


+ (nullable NSString *)routesCityConvert:(nullable NSString *)rOUTESCITY {
    NSString *w = @"";
    NSArray *array = [rOUTESCITY componentsSeparatedByString:@","];
    for(int i = 0; i < array.count; i++) {
        if(i == 0) {
            w = array[i];
        } else {
            w = [NSString stringWithFormat:@"%@/%@", w, array[i]];
        }
    }
    return w;
}


+ (void)saveUserModelInUserDefaults:(nullable UserModel *)userM {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userM];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:data forKey:
     kUserModelSaveUserDefaults];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+ (nullable UserModel *)getUserModelInUserDefaults {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *data = [user objectForKey:kUserModelSaveUserDefaults];
    UserModel *userM = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return userM;
}


+ (nullable NSURL *)getCompleteUrl:(nullable NSString *)urlPartPath {
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@", API_ServerAddress, kGetAutographDir, urlPartPath]];
}


+ (nullable NSString *)getCurrentBeforeDate:(NSTimeInterval)second {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *nowDate = [NSDate date];
    NSDate *date1 = [nowDate initWithTimeIntervalSinceNow:+second];
    return [dateFormatter stringFromDate:date1];
}


+ (nullable NSString *)ClearHourMinuteSecond:(nullable NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *hasHourDate = [formatter dateFromString:dateStr];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *noHourStr = [formatter stringFromDate:hasHourDate];
    NSDate *noHourDate = [formatter dateFromString:noHourStr];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *a = [formatter stringFromDate:noHourDate];
    return a;
}


+ (nullable NSString *)ClearHourMinuteSecond_with_date:(nullable NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *hasHourDate = date;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *noHourStr = [formatter stringFromDate:hasHourDate];
    NSDate *noHourDate = [formatter dateFromString:noHourStr];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *a = [formatter stringFromDate:noHourDate];
    return a;
}


+ (nullable NSString *)plusTimeInterval:(NSTimeInterval)second andSinceDate:(nullable NSDate *)sinceDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *nowDate = [NSDate date];
    NSDate *date1 = [nowDate initWithTimeInterval:+second sinceDate:sinceDate];
    return [dateFormatter stringFromDate:date1];
}


+ (nullable NSDate *)dateFormString_yyyy_mm_dd_hh_mm_ss:(nullable NSString *)yyyy_mm_dd_hh_mm_ss {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter dateFromString:yyyy_mm_dd_hh_mm_ss];
}


+ (nullable NSString *)getTheDayLatest_with_string:(nullable NSString *)yyyy_mm_dd_hh_mm_ss {
    NSString *LM = [self ClearHourMinuteSecond:yyyy_mm_dd_hh_mm_ss];
    return [self plusTimeInterval:(24 * 60 * 60 - 1) andSinceDate:[self dateFormString_yyyy_mm_dd_hh_mm_ss:LM]];
}


+ (nullable NSString *)getTheDayLatest_with_date:(nullable NSDate *)date {
    NSString *LM = [self ClearHourMinuteSecond_with_date:date];
    return [self plusTimeInterval:(24 * 60 * 60 - 1) andSinceDate:[self dateFormString_yyyy_mm_dd_hh_mm_ss:LM]];
}


+ (nullable NSDate *)getTheDayLatest_with_date_return_date:(nullable NSDate *)date {
    NSString *LM = [self ClearHourMinuteSecond_with_date:date];
    NSString *s = [self plusTimeInterval:(24 * 60 * 60 - 1) andSinceDate:[self dateFormString_yyyy_mm_dd_hh_mm_ss:LM]];
    return [self dateFormString_yyyy_mm_dd_hh_mm_ss:s];
}


+ (nullable NSString *)getSHIPMENT_STATE:(nullable NSString *)SHIPMENT_STATE {
    if([SHIPMENT_STATE isEqualToString:@"NEW"]) {
        return @"新建";
    } else if([SHIPMENT_STATE isEqualToString:@"INTRANSIT"]) {
        return @"已出库";
    } else if([SHIPMENT_STATE isEqualToString:@"CONFIRMED"]) {
        return @"已确认";
    } else if([SHIPMENT_STATE isEqualToString:@"CLOSE"]) {
        return @"已关闭";
    } else {
        return SHIPMENT_STATE;
    }
}

@end
