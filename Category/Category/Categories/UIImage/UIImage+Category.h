//
//  UIImage+Category.h
//  
//
//  Created by Jun on 2017/7/13.
//  Copyright © 2017年 ZHJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

@end


@interface UIImage (Color)

/**
 *  @brief  根据颜色生成纯色图片
 *
 *  @param color 颜色
 *
 *  @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;

@end
