//
//  MakeKeyWindowService.m
//  BasicProjecFrame
//
//  Created by Jivan on 2018/12/1.
//  Copyright © 2018 Jivan. All rights reserved.
//

#import "MakeKeyWindowService.h"
#import "BaseTabBarController.h"

@implementation MakeKeyWindowService

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [UIApplication sharedApplication].delegate.window ;
    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    BaseTabBarController *tabBarVC = [[BaseTabBarController alloc] init];
    window.rootViewController = tabBarVC;
    [window makeKeyAndVisible];
    
    return YES;
}

@end
