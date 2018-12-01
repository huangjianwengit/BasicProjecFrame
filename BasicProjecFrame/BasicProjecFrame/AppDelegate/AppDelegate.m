//
//  AppDelegate.m
//  BasicProjecFrame
//
//  Created by Jivan on 2018/1/8.
//  Copyright © 2018年 Jivan. All rights reserved.
//

#import "AppDelegate.h"
#import "SOAComponentAppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]){
            [service application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(applicationWillResignActive:)]){
            [service applicationWillResignActive:application];
        }
    }
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(applicationDidEnterBackground:)]){
            [service applicationDidEnterBackground:application];
        }
    }
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(applicationWillEnterForeground:)]){
            [service applicationWillEnterForeground:application];
        }
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(applicationDidBecomeActive:)]){
            [service applicationWillEnterForeground:application];
        }
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    id<UIApplicationDelegate> service;
    for(service in [[SOAComponentAppDelegate instance] services]){
        if ([service respondsToSelector:@selector(applicationWillTerminate:)]){
            [service applicationWillEnterForeground:application];
        }
    }
}


@end
