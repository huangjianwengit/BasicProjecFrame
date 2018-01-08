//
//  UIBarButtonItem+Extension.m
//  BasicProjecFrame
//
//  Created by Jivan on 2018/1/8.
//  Copyright © 2018年 Jivan. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image heighlightImage:(NSString *)heilightImage {
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    if (heilightImage) {
        
        [btn setBackgroundImage:[UIImage imageNamed:heilightImage] forState:UIControlStateHighlighted];
        
    }
    
    
    btn.size = btn.currentBackgroundImage.size;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
    
}

@end
