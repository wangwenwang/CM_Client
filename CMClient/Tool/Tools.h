//
//  Tools.h
//  CMClient
//
//  Created by 凯东源 on 17/1/14.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface Tools : NSObject

/**
 * 获取手机当前时间
 *
 * return 手机当前时间 "yyy-MM-dd HH:mm:ss"
 */
+ (nullable NSString *)getCurrentDate;



/**
 NSString 转 NSDate

 @param dateString 时间。 格式为 "yyy-MM-dd HH:mm:ss"

 @return NSDate
 */
+ (nullable NSDate *)stringConvertDate:(nullable NSString *)dateString;


/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (nullable NSDictionary *)dictionaryWithJsonString:(nullable NSString *)jsonString;



/*!
 * @brief 把字典转换成JSON字符串
 * @param dict 字典
 * @return 返回JSON字符串
 */
+ (nullable NSString *)JsonStringWithDictonary:(nullable NSDictionary *)dict;


/**
 淡入效果的转场动画

 @param window 窗口
 @param vc     控制器
 */
+ (void)setRootViewControllerWithCrossDissolve:(nullable UIWindow *)window andViewController:(nullable UIViewController *)vc;


/**
 从右翻转的转场动画

 @param window 窗口
 @param vc     控制器
 */
+ (void)setRootViewControllerWithFlipFromRight:(nullable UIWindow *)window andViewController:(nullable UIViewController *)vc;


/**
 判断是否开启定位

 @return 返回是否打开
 */
+ (BOOL)isLocationServiceOpen;


/**
 判断是否允许推送

 @return 返回是否允许
 */
+ (BOOL)isMessageNotificationServiceOpen;


/**
 网络状态

 @return 返回网络状态
 */
+ (BOOL)isConnectionAvailable;


/**
 跳到定位权限界面
 */
+ (void)skipLocationSettings;


/**
 跑到通知权限界面
 */
+ (void)skipNotifiationSettings;


/**
 提示

 @param view      父窗口
 @param title     标题
 */
+ (void)showAlert:(nullable UIView *)view andTitle:(nullable NSString *)title;


/**
 提示带时间参数

 @param view  父窗口
 @param title 标题
 @param time  停留时间
 */
+ (void)showAlert:(nullable UIView *)view andTitle:(nullable NSString *)title andTime:(NSTimeInterval)time;


/**
 注册通知权限，提示用户是否允许APP使用推送通知服务
 
 @param application UIApplication
 */
+ (void)registerNotification:(nullable UIApplication *)application;


/**
 给导航控制器添加右更多item

 @param vc 需要item的控制器
 @param action 事件
 */
+ (void)addNavRightItemTypeMore:(nullable UIViewController *)vc andAction:(nullable SEL)action;


/**
 给导航控制器添加右添加item
 
 @param vc 需要item的控制器
 @param action 事件
 */
+ (void)addNavRightItemTypeAdd:(nullable UIViewController *)vc andAction:(nullable SEL)action;


/**
 给导航控制器添加右文字item

 @param vc     需要item的控制器
 @param action 事件
 @param title  标题
 */
+ (void)addNavRightItemTypeText:(nullable UIViewController *)vc andAction:(nullable SEL)action andTitle:(nullable NSString *)title;


/**
 UIView转化成UIImage

 @param v 视图

 @return 传入视图 -> 生成图像
 */
+ (nullable UIImage *)convertViewToImage:(nullable UIView *)v;


/**
 UIColor 转UIImage

 @param color 颜色

 @return 图片
 */
+ (nullable UIImage *)createImageWithColor:(nullable UIColor *)color;



/**
 判断字符串是否小数或整数

 @param string 字符串

 @return 是否小数或整数
 */
+ (BOOL)isPureFloat:(nullable NSString *)string;


/**
 货源状态，后台存储状态 转成 前台显示状态

 @param status 后台状态

 @return 前台显示
 */
+ (nullable NSString *)getSupplyStatus:(nullable NSString *)status;


/**
 装运状态转换没数据时的提示文字

 @param status 状态

 @return 提示文字
 */
+ (nullable NSString *)zyStatusConversionPrompt:(nullable NSString *)status;



/**
 获取网络图片

 @param imageUrl 请求URL

 @return UIImage
 */
+ (nullable UIImage *)getImageFromURL:(nullable NSString *)imageUrl;



/**
 显示发送时间（几分钟前，几小时前，几天前）

 @param str yyyy-MM-dd HH:mm:ss

 @return 2小时前
 */
+ (nullable NSString *)compareCurrentTime:(nullable NSString *)str;


/**
 根据 Label width, 计算Label高度
 
 @param label Label
 @param width width
 
 @return Label高度
 */
+ (CGFloat)getHeightOfLabel:(nullable UILabel *)label andWidth:(CGFloat)width;


/**
 根据 NSString width, 计算NSString高度
 
 @param text     文字
 @param fontSize 字体大小
 @param width    width
 
 @return NSString高度
 */
+ (CGFloat)getHeightOfString:(nullable NSString *)text fontSize:(CGFloat)fontSize andWidth:(CGFloat)width;


/**
 保留2位小数

 @param string 字符串

 @return 保留2位小数值
 */
+ (CGFloat)twoDecimal:(nullable NSString *)string;


+ (void)addTabBarRightItemTypeAdd:(nullable UIViewController *)vc andAction:(nullable SEL)action;


/**
 根据尺寸压缩图片

 @param image             传入图片
 @param maxLength         最大图片的Data.length
 @param maxWidthAndHeight 最大的宽与高

 @return 压缩后的图片Data
 */
+ (nullable NSData *)compressImage:(nullable UIImage *)image andMaxLength:(int)maxLength andMaxWidthAndHeight:(CGFloat)maxWidthAndHeight;


/**
 图片长和宽不能超过 某个长度

 @param image       传入图片
 @param imageLength 长和宽 不大于此值

 @return 等比例缩小的尺寸
 */
+ (CGSize)scaleImage:(nullable UIImage *)image andImageLength:(CGFloat)imageLength;



/**
 压缩图片尺寸

 @param image   传入图片
 @param newSize 规定尺寸

 @return 规定尺寸压缩后的图片
 */
+ (nullable UIImage *)resizeImage:(nullable UIImage *)image andNewSize:(CGSize)newSize;



/**
 图片转换base64字符串

 @param image 图片

 @return base64字符串
 */
+ (nullable NSString *)convertImageToString:(nullable UIImage *)image;


/**
 时间加法（负数为减法）
 
 @param second 秒
 
 @return 相加后时间 yyyy-MM-dd HH:mm:ss
 */
+ (nullable NSString *)getCurrentBeforeDate_Second:(NSTimeInterval)second;


/**
 时间加法（负数为减法）
 
 @param day 天
 
 @return 相加后时间 yyyy-MM-dd
 */
+ (nullable NSString *)getCurrentBeforeDate_Day:(NSTimeInterval)day;


/**
 线路城市转换字符串

 @param rOUTESCITY 例：a,b,c

 @return 例：a —> b —> c
 */
+ (nullable NSString *)routesCityConvert:(nullable NSString *)rOUTESCITY;


/**
 存UserModel 到 UserDefaults

 @param userM UserModel
 */
+ (void)saveUserModelInUserDefaults:(nullable UserModel *)userM;


/**
 从UserDefaults 里取 UserModel

 @return UserModel
 */
+ (nullable UserModel *)getUserModelInUserDefaults;


/**
 获取完整的图片URL
 
 @param urlPartPath 部分url路径
 
 @return 完整的url路径
 */
+ (nullable NSURL *)getCompleteUrl:(nullable NSString *)urlPartPath;


/**
 时间加法（负数为减法）
 
 @param second 秒
 
 @return 相加后时间 yyyy-MM-dd HH:mm:ss
 */
+ (nullable NSString *)getCurrentBeforeDate:(NSTimeInterval)second;


/**
 清除 时 分 秒
 
 @param dateStr yyyy-MM-dd HH:mm:ss
 
 @return yyyy-MM-dd 00:00:00
 */
+ (nullable NSString *)ClearHourMinuteSecond:(nullable NSString *)dateStr;


/**
 开始时间 + 秒

 @param second    秒
 @param sinceDate 开始时间

 @return yyyy-MM-dd HH:mm:ss
 */
+ (nullable NSString *)plusTimeInterval:(NSTimeInterval)second andSinceDate:(nullable NSDate *)sinceDate;


/**
 字符串转NSDate

 @param yyyy_mm_dd_hh_mm_ss 2017-07-07 00:00:00

 @return Date
 */
+ (nullable NSDate *)dateFormString_yyyy_mm_dd_hh_mm_ss:(nullable NSString *)yyyy_mm_dd_hh_mm_ss;



/**
 获取当天最晚时间 例如:2017-07-07 23:59:59

 @param yyyy_mm_dd_hh_mm_ss 传入时间 2017-07-07 17:19:23

 @return yyyy_mm_dd 23:59:59
 */
+ (nullable NSString *)getTheDayLatest_with_string:(nullable NSString *)yyyy_mm_dd_hh_mm_ss;


/**
 获取当天最晚时间 例如:2017-07-07 23:59:59

 @param date 传入时间 date

 @return yyyy_mm_dd 23:59:59
 */
+ (nullable NSString *)getTheDayLatest_with_date:(nullable NSDate *)date;


/**
 获取当天最晚时间 例如:2017-07-07 23:59:59
 
 @param date 传入时间 date
 
 @return NSDate
 */
+ (nullable NSDate *)getTheDayLatest_with_date_return_date:(nullable NSDate *)date;


/**
 装运状态转义
 
 @param SHIPMENT_STATE 转义前
 
 @return 转义后
 */
+ (nullable NSString *)getSHIPMENT_STATE:(nullable NSString *)SHIPMENT_STATE;

@end








