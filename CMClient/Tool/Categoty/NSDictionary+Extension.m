//
//  NSDictionary+Extension.m
//  CMClient
//
//  Created by 凯东源 on 17/2/7.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *msr = [NSMutableString string];
    [msr appendString:@"\n{"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        //做以下操作是为了得到一串标准的json格式，纯属娱乐
        //LMLog(@"key:%@ is:%@", obj, [obj class]);
        if([obj isKindOfClass:[NSString class]]) {
            [msr appendFormat:@"\n\t\"%@\" : \"%@\",",key,obj];
        } else {
            [msr appendFormat:@"\n\t\"%@\" : %@,",key,obj];
        }
        
        // web版参数
//        if([obj isKindOfClass:[NSString class]]) {
//            [msr appendFormat:@"\"%@\"=\"%@\"&",key,obj];
//        } else {
//            [msr appendFormat:@"\"%@\"=%@&",key,obj];
//        }
//        
//        if([obj isKindOfClass:[NSString class]]) {
//            [msr appendFormat:@"\"%@\":\"%@\",",key,obj];
//        } else {
//            [msr appendFormat:@"\"%@\"=%@,",key,obj];
//        }
        
    }];
    //去掉最后一个逗号（,）
    if ([msr hasSuffix:@","]) {
        NSString *str = [msr substringToIndex:msr.length - 1];
        msr = [NSMutableString stringWithString:str];
    }
    [msr appendString:@"\n}"];
    return msr;
}

//网上代码后
//上传单点josn:{
//    strUserIdx = 4,
//    cordinateX = 114.0470592224222,
//    date = 2017-02-07 14:21:40,
//    cordinateY = 22.62941056796829,
//    strLicense = ,
//    address = ios默认code地址
//}


//没重写前
//上传单点josn:{
//    address = "ios\U9ed8\U8ba4code\U5730\U5740";
//    cordinateX = "114.0469982235403";
//    cordinateY = "22.62919219925733";
//    date = "2017-02-07 14:24:04";
//    strLicense = "";
//    strUserIdx = 4;
//}


//DIY后
//上传单点josn:
//{
//    "strUserIdx" : "4",
//    "cordinateX" : 114.0474037922495,
//    "date" : "2017-02-07 14:53:03",
//    "cordinateY" : 22.62919368416341,
//    "strLicense" : "",
//    "address" : "ios默认code地址"
//}

@end
