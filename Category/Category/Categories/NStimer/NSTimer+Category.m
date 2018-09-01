//
//  NSTimer+Category.m
//  Category
//
//  Created by Jun Zhou on 2018/9/1.
//  Copyright © 2018年 Jun Zhou. All rights reserved.
//

#import "NSTimer+Category.h"

@implementation NSTimer (Category)

@end

@implementation NSTimer (Bolck)

/// 带有block回调的timer timer需加入runloop
+ (NSTimer *)b_timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats inRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode block:(void (^)(NSTimer *timer))block {
    
    NSTimer *timer = [self timerWithTimeInterval:interval target:self selector:@selector(blockInvoke:) userInfo:[block copy] repeats:repeats];
    [runloop addTimer:timer forMode:mode];
    
    return timer;
}

/// 带有block回调的timer timer自动加入当前runloop
+ (NSTimer *)b_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(blockInvoke:) userInfo:[block copy] repeats:repeats];;
}


+ (void)blockInvoke:(NSTimer *)timer {
    void (^block)(NSTimer *timer) = timer.userInfo;
    if (block) block(timer);
}

@end
