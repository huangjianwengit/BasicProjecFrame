//
//  UIView+ParentController.h
//  好心人
//
//  Created by zwz on 16/2/1.
//  Copyright © 2016年 Anhui HongJing Technologies Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ParentController)

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
