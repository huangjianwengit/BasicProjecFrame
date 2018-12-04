//
//  NSMutableArray+ErrorHandle.m
//  数组越界
//
//  Created by Jivan on 2017/12/26.
//  Copyright © 2017年 Jivan. All rights reserved.
//

#import "NSMutableArray+ErrorHandle.h"
#import "NSObject+SwizzleMethod.h"
#import <objc/runtime.h>

@implementation NSMutableArray (ErrorHandle)
/**
 *  数组中插入数据
 */
- (void)insertObjectVerify:(id)object atIndex:(NSInteger)index{
    
    if (index < self.count && object) {
        [self insertObject:object atIndex:index];
    }
}
/**
 *  数组中添加数据
 */
- (void)addObjectVerify:(id)object{
    if (object) {
        [self addObject:object];
    }
}

+(void)load{
    [super load];
    //无论怎样 都要保证方法只交换一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //交换NSMutableArray中的方法
        [objc_getClass("__NSArrayM") SystemSelector:@selector(objectAtIndex:) swizzledSelector:@selector(jh_objectAtIndex:) error:nil];
        //交换NSMutableArray中的方法
        [objc_getClass("__NSArrayM") SystemSelector:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(jh_objectAtIndexedSubscript:) error:nil];
    });
}

- (id)jh_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return [self jh_objectAtIndex:index];
    }else{
        
        NSLog(@" 你的NSMutableArray数组已经越界 帮你处理好了%ld   count=%ld   %@", index, self.count, [self class]);
        return nil;
    }
}
- (id)jh_objectAtIndexedSubscript:(NSUInteger)index{
    if (index < self.count) {

        return [self jh_objectAtIndexedSubscript:index];
    }else{
        NSLog(@" 你的NSMutableArray数组已经越界 帮你处理好了%ld   count=%ld   %@", index, self.count, [self class]);
        return nil;
    }
}

@end
