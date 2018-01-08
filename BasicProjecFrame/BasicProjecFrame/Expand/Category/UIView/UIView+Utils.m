//
//  UIView+Utils.m
//  CatagoryTest
//
//  Created by Jivan on 2017/1/17.
//  Copyright © 2017年 Jivan. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)

- (UIViewController *)parentController
{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
    
}

+ (UIViewController *)currentViewController
{
    //如果是在AlertView上可能获取的keyWindow不是UIWindow（注意）
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    // modal展现方式的底层视图不同
    // 取到第一层时，取到的是UITransitionView，通过这个view拿不到控制器
    UIView *firstView = [keyWindow.subviews firstObject];
    UIView *secondView = [firstView.subviews firstObject];
    UIViewController *vc = secondView.parentController;
    if ([vc isKindOfClass:[UITabBarController class]])
    {
        
        UITabBarController *tab = (UITabBarController *)vc;
        
        if ([tab.selectedViewController isKindOfClass:[UINavigationController class]])
        {
            UINavigationController *nav = (UINavigationController *)tab.selectedViewController;
            return [nav.viewControllers lastObject];
        } else
        {
            return tab.selectedViewController;
        }
    }
    
    else if ([vc isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController *nav = (UINavigationController *)vc;
        return [nav.viewControllers lastObject];
    }
    
    else
    {
        return vc;
    }
    
    return nil;
}
+(UIViewController *)getCurrentViewConrtrollerIgnoreWindowLevel
{
    // Try to find the root view controller programmically
    // Find the top window (that is not an alert view or other window)
    UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
    
    if (topWindow.windowLevel != UIWindowLevelNormal)
        
    {
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        for(topWindow in windows)
            
        {
            
            if (topWindow.windowLevel == UIWindowLevelNormal)
                
                break;
            
        }
        
    }
    // modal展现方式的底层视图不同
    // 取到第一层时，取到的是UITransitionView，通过这个view拿不到控制器
    UIView *firstView = [topWindow.subviews firstObject];
    UIView *secondView = [firstView.subviews firstObject];
    UIViewController *vc = secondView.parentController;
    if ([vc isKindOfClass:[UITabBarController class]])
    {
        
        UITabBarController *tab = (UITabBarController *)vc;
        
        if ([tab.selectedViewController isKindOfClass:[UINavigationController class]])
        {
            UINavigationController *nav = (UINavigationController *)tab.selectedViewController;
            return [nav.viewControllers lastObject];
        } else
        {
            return tab.selectedViewController;
        }
    }
    
    else if ([vc isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController *nav = (UINavigationController *)vc;
        return [nav.viewControllers lastObject];
    }
    
    else
    {
        return vc;
    }
    
    return nil;
    
}

+ (UIViewController *)getCurrentRootViewController
{
    
    UIViewController *result;
    
    // Try to find the root view controller programmically
    
    // Find the top window (that is not an alert view or other window)
    
    UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
    
    if (topWindow.windowLevel != UIWindowLevelNormal)
        
    {
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        
        for(topWindow in windows)
            
        {
            
            if (topWindow.windowLevel == UIWindowLevelNormal)
                
                break;
            
        }
        
    }
    
    UIView *rootView = [[topWindow subviews] objectAtIndex:0];
    
    id nextResponder = [rootView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        
        result = nextResponder;
    
    else if ([topWindow respondsToSelector:@selector(rootViewController)] && topWindow.rootViewController != nil)
        
        result = topWindow.rootViewController;
    
    else
        
        NSAssert(NO, @"ShareKit: Could not find a root view controller. You can assign one manually by calling [[SHK currentHelper] setRootViewController:YOURROOTVIEWCONTROLLER].");
    
    return result; 
    
}
/****------> UIView +Layer <------ ****/
-(void)drawLayerShadowWithColor:(UIColor*)color Radius:(float) radius Opacity:(float) opacity
{
    self.layer.shadowOpacity = opacity;// 阴影透明度
    
    self.layer.shadowColor = color.CGColor;// 阴影的颜色
    
    self.layer.shadowRadius = radius;// 阴影扩散的范围控制
    
    self.layer.shadowOffset  = CGSizeMake(1, 1);// 阴影的范围
}

-(void)drawLayerBorderWithColor:(UIColor*)color  Width:(CGFloat) width 
{
    self.layer.borderColor = color.CGColor;//边框颜色
    
    self.layer.borderWidth = width;//边框宽度
}

-(void)drawLayerCornerWithRadius:(CGFloat) radius
{
    self.layer.masksToBounds = YES;
    
    self.layer.cornerRadius = radius;
    
}


@end
