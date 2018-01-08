//
//  NSString+Utils.h
//  AF封装
//
//  Created by Jivan on 15/11/15.
//  Copyright © 2015年 Jivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Utils)
/**
 * 计算字符串高度
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize ;
/**
 *  写入偏好设置
 */
-(void)saveToNSDefaultsWithKey:(NSString *)key;
/**
 *  去除字符串中的空白字符
 */
-(NSString *)trimString ;
/**
 *  获得UUID
 *  @return 返回uuid
 */

+ (NSString *)UUID;
/**
 * 获取用户端的IP地址
 */
+ (NSString*)stringWithIP;
/**
 *  检验字符串是否有效
 *  @return 若非空且不等于@“”，则返回YES，否则，返回NO
 */
- (BOOL)isEmptyString;

/**
 *  判断是否有效邮箱
 *  @return 返回是否有效
 */
 - (BOOL)isValidEmail;
/**
 *   判断是否有效邮编
 *   @return 返回是否有效
 */
-(BOOL) isValidZipcode ;
/**
 *  判断是否有效手机号码
 *  @return 返回是否有效
 */
- (BOOL)isValidPhone;
/**
 *  判断是否有效身份证号码
 *  @return 返回是否有效
 */

- (BOOL)isValidIdCardNum;

/**
 *  产生MD5
 *  @return MD5
 */
- (NSString *)MD5;
/**
 *  根据文件路径计算文件大小
 */
- (NSInteger)fileSize ;





@end
