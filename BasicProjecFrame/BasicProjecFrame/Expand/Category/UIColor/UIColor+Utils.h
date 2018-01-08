//
//  UIColor+Utils.h
//
//  Created by Jivan on 2017/1/9.
//  Copyright © 2017年 Jivan All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utils)
/**
 *   获取RGB颜色 
 *  
 */
+(UIColor*)colorWithRed:(float)r Green:(float)g Blue:(float) b  Alpha:(float) alpha;

/**
 *   获取RGB颜色 alpha = 1 
 *  
 */
+(UIColor*)colorWithRed:(float)r Green:(float)g Blue:(float) b;

/**
 *    获取颜色的RGB值
 *
 */

+(NSMutableArray*)getRGBComponentWithColor:(UIColor*)color;

/**
 *   获取随机颜色
 *  
 */
+(UIColor*)colorWithRandomRGB;
/**
 *  从十六进制字符串获取颜色，
 *  color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 */
+ (UIColor *)colorWithHexString:(NSString *)color;
/**
 *     根据颜色返回图片
 *
 */
+(UIImage*) createImageWithColor: (UIColor*) color ;


/**
 *  从十六进制字符串获取颜色，
 *
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 *      根据颜色获取 16进制 字符串
 *
 */
+(NSString *)stringFromColor:(UIColor *)color;


@end
