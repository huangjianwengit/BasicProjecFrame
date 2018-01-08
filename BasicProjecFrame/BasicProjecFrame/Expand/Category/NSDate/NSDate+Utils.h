//
//  NSDate+Utils.h
//  test
//
//  Created by Jivan on 2017/1/7.
//  Copyright © 2017年 Jivan All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)
/**
 判断是否是今天
 */
-(BOOL)isToday;
/**
 判断是否是昨天
 */
-(BOOL)isYesterday;
/**
 判断是否是今年
 */
-(BOOL)isThisyear;
/**
 获得2个时间的时间差
 */
-(NSDateComponents *)deltaFromNow;
/**
 判断一个时间是否比另一个时间早
 */
-(BOOL)isEarlyThanDate:(NSDate *)otherDate;
/**
 完成判断一个时间是否在8:23-11:46之间的功能
 NSDate必须传8：23或23：45之类的格式
 */
- (BOOL)isBetweenFromTime:(NSDate *)fromDate toTime:(NSDate *)toDate;


@end
