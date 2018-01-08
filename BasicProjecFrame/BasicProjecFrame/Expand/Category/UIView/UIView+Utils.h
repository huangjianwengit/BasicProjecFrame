//
//  UIView+Utils.h
//  CatagoryTest
//
//  Created by Jivan on 2017/1/17.
//  Copyright © 2017年 Jivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)

/**
 *  添加阴影效果
 *  color   颜色
 *  radius  范围
 *  opacity 透明度
 */
-(void)drawLayerShadowWithColor:(UIColor*)color Radius:(float) radius Opacity:(float) opacity;
/**
 *     添加边框
 */
-(void)drawLayerBorderWithColor:(UIColor*)color  Width:(CGFloat) width ;
/**
 *      设置圆角
 */
-(void)drawLayerCornerWithRadius:(CGFloat) radius;

/**
 *  获取当前正在显示的控制器(由于keyWindow的不同可能获取不正确)
 *
 *  @return 正在显示的控制器
 */
+ (UIViewController *)currentViewController;
/**
 *  获取当前正在显示的控制器(无论keyWindow是什么)
 *
 *  @return 正在显示的控制器
 */
+ (UIViewController *)getCurrentViewConrtrollerIgnoreWindowLevel;

/**
 *  获取当前显示的View的控制器的根控制器
 *
 *  @return 根控制器
 */
+ (UIViewController *)getCurrentRootViewController;


@end
