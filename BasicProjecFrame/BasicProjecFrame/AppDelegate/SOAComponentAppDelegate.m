//
//  SOAComponentAppDelegate.m
//  BasicProjecFrame
//
//  Created by Jivan on 2018/12/1.
//  Copyright © 2018 Jivan. All rights reserved.
//

#import "SOAComponentAppDelegate.h"
#import "MakeKeyWindowService.h"

//名称解释一下：
//1、SOA是面向服务的架构，所有的第三方功能都被分别封装成服务。
//2、Component 表示这个类是用于引用的，不能用于继承。

@implementation SOAComponentAppDelegate
{
    NSMutableArray* allServices;
}

#pragma mark - 服务静态注册

//需要运行程序之前，手工增加根据需要的新服务

-(void)registeServices
{
   //   设置根视图控制器服务
    [self registeService:[[MakeKeyWindowService alloc]init]];
}

#pragma mark - 获取SOAComponent单实例

+ (instancetype)instance {
    
    static SOAComponentAppDelegate *insance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        insance = [[SOAComponentAppDelegate alloc] init];
    });
    
    
    return insance;
}

#pragma mark - 获取全部服务

-(NSMutableArray *)services
{
    
    if (!allServices) {
        allServices = [[NSMutableArray alloc]init];
        [self registeServices];
    }
    
    return allServices;
}

#pragma mark - 服务动态注册

-(void)registeService:(id)service
{
    if (![allServices containsObject:service])
    {
        [allServices addObject:service];
    }
    
}

@end
