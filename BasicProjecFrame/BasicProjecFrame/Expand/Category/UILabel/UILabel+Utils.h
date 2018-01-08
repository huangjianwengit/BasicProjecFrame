//
//  UILabel+Utils.h
//  test
//
//  Created by Jivan on 2017/1/7.
//  Copyright © 2017年 Jivan All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Utils)

@property (nonatomic,assign) BOOL isCopyable;

- (void)setTextFont:(UIFont *)font atRange:(NSRange)range;  

- (void)setTextColor:(UIColor *)color atRange:(NSRange)range;  

- (void)setTextLineSpace:(float)space atRange:(NSRange)range;  

- (void)setTextFont:(UIFont *)font color:(UIColor *)color atRange:(NSRange)range;  

- (void)setTextAttributes:(NSDictionary *)attributes atRange:(NSRange)range; 


@end
