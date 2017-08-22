//
//  RouteAnnotation.h
//  CMClient
//
//  Created by 凯东源 on 17/2/9.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

@interface RouteAnnotation : BMKPointAnnotation

@property (assign, nonatomic) int type;///<0:起点 1：终点 2：公交 3：地铁 4:驾乘 5:途经点

@property (assign, nonatomic) int degree;

@end
