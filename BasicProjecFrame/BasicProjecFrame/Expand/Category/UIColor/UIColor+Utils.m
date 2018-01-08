//
//  UIColor+Utils.m
//
//  Created by Jivan on 2017/1/9.
//  Copyright © 2017年 Jivan All rights reserved.
//

#import "UIColor+Utils.h"

@implementation UIColor (Utils)

+(UIColor*)colorWithRed:(float)r Green:(float)g Blue:(float) b  Alpha:(float) alpha
{
    return [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:alpha]  ;
}
+(UIColor*)colorWithRed:(float)r Green:(float)g Blue:(float) b
{
    return [UIColor colorWithRed:r Green:g Blue:b Alpha:1];
}
/**
 *   获取随机颜色
 *  
 */
+(NSMutableArray*)getRGBComponentWithColor:(UIColor*)color
{
   
    NSMutableArray *RGBStrValueArr = [[NSMutableArray alloc] init];  
    NSString *RGBStr = nil;  
    //获得RGB值描述  
    NSString *RGBValue = [NSString stringWithFormat:@"%@",color];  
    //将RGB值描述分隔成字符串  
    NSArray *RGBArr = [RGBValue componentsSeparatedByString:@" "];  
    //获取红色值  
    int r = [[RGBArr objectAtIndex:1] intValue] * 255;  
    RGBStr = [NSString stringWithFormat:@"%d",r];  
    [RGBStrValueArr addObject:RGBStr];  
    //获取绿色值  
    int g = [[RGBArr objectAtIndex:2] intValue] * 255;  
    RGBStr = [NSString stringWithFormat:@"%d",g];  
    [RGBStrValueArr addObject:RGBStr];  
    //获取蓝色值  
    int b = [[RGBArr objectAtIndex:3] intValue] * 255;  
    RGBStr = [NSString stringWithFormat:@"%d",b];  
    [RGBStrValueArr addObject:RGBStr];  
    //返回保存RGB值的数组  
    return RGBStrValueArr;  
}
+(UIColor*)colorWithRandomRGB
{
    return  [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1] ; 
}
/**
 *     根据颜色返回图片
 *
 */
+(UIImage*) createImageWithColor: (UIColor*) color  
{  
    CGRect rect=CGRectMake(0,0, 1, 1);  
    UIGraphicsBeginImageContext(rect.size);  
    CGContextRef context = UIGraphicsGetCurrentContext();  
    CGContextSetFillColorWithColor(context, [color CGColor]);  
    CGContextFillRect(context, rect);  
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();  
    UIGraphicsEndImageContext();  
    return theImage;  
}  

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}
/**
 *      根据颜色获取 16进制 字符串
 *
 */
+(NSString *)stringFromColor:(UIColor *)color
{
    const CGFloat *cs=CGColorGetComponents(color.CGColor);
    
    
    NSString *r = [NSString stringWithFormat:@"%@",[self  ToHex:cs[0]*255]];
    NSString *g = [NSString stringWithFormat:@"%@",[self  ToHex:cs[1]*255]];
    NSString *b = [NSString stringWithFormat:@"%@",[self  ToHex:cs[2]*255]];
    return [NSString stringWithFormat:@"#%@%@%@",r,g,b];
}

+(NSString *)ToHex:(int)tmpid
{
    NSString *endtmp=@"";
    NSString *nLetterValue;
    NSString *nStrat;
    int ttmpig=tmpid%16;
    int tmp=tmpid/16;
    switch (ttmpig)
    {
        case 10:
            nLetterValue =@"A";break;
        case 11:
            nLetterValue =@"B";break;
        case 12:
            nLetterValue =@"C";break;
        case 13:
            nLetterValue =@"D";break;
        case 14:
            nLetterValue =@"E";break;
        case 15:
            nLetterValue =@"F";break;
        default:nLetterValue=[[NSString alloc]initWithFormat:@"%i",ttmpig];
            
    }
    switch (tmp)
    {
        case 10:
            nStrat =@"A";break;
        case 11:
            nStrat =@"B";break;
        case 12:
            nStrat =@"C";break;
        case 13:
            nStrat =@"D";break;
        case 14:
            nStrat =@"E";break;
        case 15:
            nStrat =@"F";break;
        default:nStrat=[[NSString alloc]initWithFormat:@"%i",tmp];
            
    }
    endtmp=[[NSString alloc]initWithFormat:@"%@%@",nStrat,nLetterValue];
    return endtmp;
}



@end
