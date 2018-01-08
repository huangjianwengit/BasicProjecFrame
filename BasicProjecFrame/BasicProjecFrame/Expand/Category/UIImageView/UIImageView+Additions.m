//
//  UIImageView+Additions.m
//  CategoryDemo
//
//  Created by Jivan on 2018/1/4.
//  Copyright © 2018年 Jivan. All rights reserved.
//

#import "UIImageView+Additions.h"

@implementation UIImageView (Additions)

-(void)addMirrorEffectForImageView
{
    CALayer *reflectLayer = [CALayer layer];
    reflectLayer.contents = self.layer.contents;
    reflectLayer.bounds = self.layer.bounds;
    reflectLayer.position = CGPointMake(self.layer.bounds.size.width/2, self.layer.bounds.size.height*1.5);
    reflectLayer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    // 给该reflection加个半透明的layer
    CALayer *blackLayer = [CALayer layer];
    blackLayer.backgroundColor = [UIColor blackColor].CGColor;
    blackLayer.bounds = reflectLayer.bounds;
    blackLayer.position = CGPointMake(blackLayer.bounds.size.width/2, blackLayer.bounds.size.height/2);
    blackLayer.opacity = 0.2;
    [reflectLayer addSublayer:blackLayer];
    
    // 给该reflection加个mask
    CAGradientLayer *mask = [CAGradientLayer layer];
    mask.bounds = reflectLayer.bounds;
    mask.position = CGPointMake(mask.bounds.size.width/2, mask.bounds.size.height/2);
    mask.colors = [NSArray arrayWithObjects:
                   (__bridge id)[UIColor clearColor].CGColor,
                   (__bridge id)[UIColor whiteColor].CGColor, nil];
    mask.startPoint = CGPointMake(0,0);
    mask.endPoint = CGPointMake(0,0.9);
    reflectLayer.mask = mask;
    
    // 作为layer的sublayer
    [self.layer addSublayer:reflectLayer];
}

@end
