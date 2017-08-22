//
//  AutoGraphView.m
//  CMClient
//
//  Created by 凯东源 on 17/2/22.
//  Copyright © 2017年 城马联盟. All rights reserved.
//

#import "AutoGraphView.h"

@interface AutoGraphView () {
    
    /// 线条颜色
    UIColor *_color;
    
    /// 线条宽度
    CGFloat _lineWidth;
    
    /// 贝赛尔曲线
    UIBezierPath *_bezier;
}
@end

@implementation AutoGraphView


#pragma mark - 初始化
- (void)initW {
    if(!_color) {
        _color = [UIColor greenColor];
    }
    if(!_allLine) {
        _allLine = [[NSMutableArray alloc] init];
    }
    _lineWidth = 1.0f;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ([super initWithCoder:aDecoder]) {
        [self initW];
    }
    return self;
}


#pragma mark - 重写父方法
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self drawDate];
    
    [self drawAutograph];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _bezier = [UIBezierPath bezierPath];
    NSArray * array = [touches allObjects];
    UITouch *touch = array.firstObject;
    CGPoint point  = [touch locationInView:self];
    [_bezier moveToPoint:point];
    
    NSMutableDictionary *tmpDic = [[NSMutableDictionary alloc] init];
    [tmpDic setValue:_color forKey:@"color"];
    [tmpDic setValue:@(_lineWidth) forKey:@"lineWidth"];
    [tmpDic setValue:_bezier forKey:@"line"];
    
    [_allLine addObject:tmpDic];
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray * array = [touches allObjects];
    UITouch *touch = array.firstObject;
    CGPoint point  = [touch locationInView:self];
    [_bezier addLineToPoint:point];
    [self setNeedsDisplay];
}

#pragma mark - 功能函数
- (NSString *)getCurrentDate {
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyy-MM-dd HH:mm:ss"];
    NSString *strNowTime = [formatter stringFromDate:date];
    return strNowTime;
}


- (void)drawAutograph {
    for (int i = 0; i < _allLine.count; i++) {
        NSMutableDictionary *tmpDic = _allLine[i];
        UIColor *tmpColor = tmpDic[@"color"];
        CGFloat tmpWidth = [tmpDic[@"lineWidth"] floatValue];
        UIBezierPath *tmpPath = tmpDic[@"line"];
        [tmpColor setStroke];
        tmpPath.lineWidth = tmpWidth;
        [tmpPath stroke];
    }
}


- (void)drawDate {
    NSString *s = [self getCurrentDate];
    UIColor *fieldColor = [UIColor greenColor];
    UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 6.0;
    NSNumber *skew = @0.1;
    
    NSDictionary *dict = @{NSForegroundColorAttributeName: fieldColor,
                           NSParagraphStyleAttributeName: paraStyle,
                           NSObliquenessAttributeName: skew,
                           NSFontAttributeName: font
                           };
    CGSize textSize = [s sizeWithAttributes:dict];
    CGFloat x = CGRectGetWidth(self.frame) - textSize.width - 5;
    CGFloat y = CGRectGetHeight(self.frame) - textSize.height;
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGRect rectX = CGRectMake(x, y, width, height);
    [s drawInRect:rectX withAttributes:dict];
}


- (void)clear {
    if(_allLine.count != 0) {
        [_allLine removeAllObjects];
        [self setNeedsDisplay];
    }
}

@end
