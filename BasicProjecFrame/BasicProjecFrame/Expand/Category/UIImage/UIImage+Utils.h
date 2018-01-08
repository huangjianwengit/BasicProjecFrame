//
//  UIImage+Utils.h
//  AF封装
//
//  Created by Jivan on 15/11/15.
//  Copyright © 2015年 Jivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)
/**
 *  判断是否亮色
 *
 *  @return 返回是否亮色
 */
- (BOOL)isLightColor;

/**
 *  获得主要颜色
 *
 *  @return 返回主要颜色
 */
- (UIColor *)mostColor;

/**
 *  获得颜色RGB值
 *
 *  @param color 颜色
 *
 *  @return 返回颜色RGB值
 */
- (NSArray *)RGBComponentsWithColor:(UIColor *)color;

/**
 *  获得缩略图
 *
 *  @param size 缩略图大小
 *
 *  @return 缩略图
 */
- (UIImage *)scaleToSize:(CGSize)size;

//原始图片
+ (instancetype)imageWithOriginName:(NSString *)imageName;

/**
 *  根据颜色创建图片
 *
 *  @param color 图片颜色
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  截取图片
 *
 *  @param rect 位置、大小
 *
 *  @return 图片
 */
- (UIImage *)trimWithRect:(CGRect)rect;

/**
 *  获得旋转后的图片
 *
 *  @param imageName   图片名
 *  @param orientation 旋转方向
 *
 *  @return 旋转后图片
 */
+ (UIImage *)rotateImageWithImageName:(NSString *)imageName orientation:(UIImageOrientation)orientation;

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
/**
 *  返回一张自由拉伸的图片   left 0.5 top 0.5
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
/**
 *  改变图片的颜色
 */

+(UIImage *)colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor;

/**
 *     给图片添加蒙版效果
 *
 **/
+(UIImage *)maskImage:(UIImage *)baseImage withImage:(UIImage *)theMaskImage;

/**
 *  根据图片返回一张高斯模糊的图片
 *
 *  @param blur 模糊系数
 *
 *  @return 新的图片
 */
-(UIImage*)GaussImageWithBlurValue:(CGFloat)blur;

/**
 *圆形图片
 *
 */
-(UIImage *)circleImage;


/**
 *  根据颜色和大小获取Image
 *
 *  @param color 颜色
 *  @param size  大小
 *
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 *  自由改变Image的大小
 *
 *  @param size 目的大小
 *
 *  @return 修改后的Image
 */
- (UIImage *)cropImageWithSize:(CGSize)size;

/**
 * 根据字符串生成二维码图片UIImage
 *
 * @param dataString 二维码中内容
 * @param widthAndHeight 图片的宽高(二维码是正方形的,所以宽高相等)
 *
 * @return 生成的二维码图片
 */
+(UIImage *)QRCodeImageWithDataString:(NSString *)dataString WidthAndHeight:(CGFloat)widthAndHeight;


/**
 * 根据CIImage生成指定大小的UIImage
 *
 * @param image CIImage
 * @param size 图片宽度
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size;

@end
