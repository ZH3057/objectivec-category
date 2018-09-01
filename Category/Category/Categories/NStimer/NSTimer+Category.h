//
//  NSTimer+Category.h
//  Category
//
//  Created by Jun Zhou on 2018/9/1.
//  Copyright © 2018年 Jun Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Category)

@end

@interface NSTimer (Block)

/** 带有block回调的timer timer需加入runloop */
+ (NSTimer *)b_timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats inRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode block:(void (^)(NSTimer *timer))block;

/** 带有block回调的timer timer自动加入当前runloop */
+ (NSTimer *)b_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

@end
