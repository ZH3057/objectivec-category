//
//  NSArray+Category.h
//  
//
//  Created by Jun on 2017/7/18.
//  Copyright © 2017年 ZHJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Category)

@end


@interface NSArray (Log)

@end



@interface NSArray (JSON)

/**
 *  转换成JSON串字符串（没有可读性）
 *
 *  @return JSON字符串
 */
- (NSString *)toJSONString;

/**
 *  转换成JSON串字符串（有可读性）
 *
 *  @return JSON字符串
 */
- (NSString *)toReadableJSONString;

/**
 *  转换成JSON数据
 *
 *  @return JSON数据
 */
- (NSData *)toJSONData;

@end
