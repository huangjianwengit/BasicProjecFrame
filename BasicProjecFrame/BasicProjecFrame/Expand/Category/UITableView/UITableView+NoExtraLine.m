//
//  UITableView+NoExtraLine.m
//
//  Created by Jivan on 15/6/29.
//  Copyright (c) 2015年 Jivan. All rights reserved.
//

#import "UITableView+NoExtraLine.h"

@implementation UITableView (NoExtraLine)

- (void)setExtraCellLineHidden
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:view];
}

-(void)setCellLineFullInScreen
{
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [self setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [self setLayoutMargins:UIEdgeInsetsZero];
        
    }



}
@end
