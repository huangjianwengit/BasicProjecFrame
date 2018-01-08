//
//  UILabel+Utils.m
//  test
//
//  Created by Jivan on 2017/1/7.
//  Copyright © 2017年 Jivan All rights reserved.
//

#import "UILabel+Utils.h"
#import <objc/runtime.h>
@implementation UILabel (Utils)

/*>>>>>>>>>>>>>>>>>>>>>>>>>>Label.attributedText<<<<<<<<<<<<<<<<<<<<<<<<*/
- (void)setTextFont:(UIFont *)font atRange:(NSRange)range  
{  
    [self setTextAttributes:@{NSFontAttributeName : font}  
                    atRange:range];  
}  

- (void)setTextColor:(UIColor *)color atRange:(NSRange)range  
{  
    [self setTextAttributes:@{NSForegroundColorAttributeName : color}  
                    atRange:range];  
}  

- (void)setTextLineSpace:(float)space atRange:(NSRange)range  
{  
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];  
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];  
    
    [paragraphStyle setLineSpacing:space];//调整行间距  
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];  
    self.attributedText = attributedString;  
    [self sizeToFit];  
}  

- (void)setTextFont:(UIFont *)font color:(UIColor *)color atRange:(NSRange)range  
{  
    [self setTextAttributes:@{NSFontAttributeName : font,  
                              NSForegroundColorAttributeName : color}  
                    atRange:range];  
}  

- (void)setTextAttributes:(NSDictionary *)attributes atRange:(NSRange)range  
{  
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];  
    
    for (NSString *name in attributes)  
    {  
        [mutableAttributedString addAttribute:name value:[attributes objectForKey:name] range:range];  
    }  
    // [mutableAttributedString setAttributes:attributes range:range]; error  
    
    self.attributedText = mutableAttributedString; 

}  
/*>>>>>>>>>>>>>>>>>>>>>>>>>>Label.attributedText<<<<<<<<<<<<<<<<<<<<<<<<*/


/*>>>>>>>>>>>>>>>>>>>>>>>>>>Copy 长按Label可复制文字<<<<<<<<<<<<<<<<<<<<<<<<*/
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(copyText:));
}

- (void)attachTapHandler {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *g = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:g];
}

//  处理手势相应事件
- (void)handleTap:(UIGestureRecognizer *)g {
    [self becomeFirstResponder];
    
    UIMenuItem *item = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyText:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObject:item]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    
}

//  复制时执行的方法
- (void)copyText:(id)sender {
    //  通用的粘贴板
    UIPasteboard *pBoard = [UIPasteboard generalPasteboard];
    
    //  有些时候只想取UILabel的text中的一部分
    if (objc_getAssociatedObject(self, @"expectedText")) {
        pBoard.string = objc_getAssociatedObject(self, @"expectedText");
    } else {
        
        //  因为有时候 label 中设置的是attributedText
        //  而 UIPasteboard 的string只能接受 NSString 类型
        //  所以要做相应的判断
        if (self.text) {
            pBoard.string = self.text;
        } else {
            pBoard.string = self.attributedText.string;
        }
    }
}

- (BOOL)canBecomeFirstResponder {
    return [objc_getAssociatedObject(self, @selector(isCopyable)) boolValue];
}

- (void)setIsCopyable:(BOOL)number {
    objc_setAssociatedObject(self, @selector(isCopyable), [NSNumber numberWithBool:number], OBJC_ASSOCIATION_ASSIGN);
    [self attachTapHandler];
}

- (BOOL)isCopyable {
    return [objc_getAssociatedObject(self, @selector(isCopyable)) boolValue];
}
/*>>>>>>>>>>>>>>>>>>>>>>>>>>Copy 长按Label可复制文字<<<<<<<<<<<<<<<<<<<<<<<<*/
@end
