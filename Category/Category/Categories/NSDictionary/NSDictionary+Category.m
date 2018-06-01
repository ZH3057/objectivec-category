//
//  NSDictionary+Category.m
//  
//
//  Created by Jun on 2017/7/18.
//  Copyright © 2017年 ZHJ. All rights reserved.
//

#import "NSDictionary+Category.h"
#import "NSString+Category.h"
#import <objc/runtime.h>

@implementation NSDictionary (Category)

@end

@implementation NSDictionary (Log)

#ifdef DEBUG
- (NSString *)descriptionWithLocale:(id)locale{
    return self.debugDescription;
}
- (NSString *)debugDescription{
    return [super debugDescription];
}
- (NSString *)xy_debugDescription{
    return self.xy_debugDescription.unicodeString;
}

+ (void)load{
    [self swapMethod];
}

+ (void)swapMethod{
    Method method1 = class_getInstanceMethod(self, @selector(debugDescription));
    Method method2 = class_getInstanceMethod(self, @selector(xy_debugDescription));
    
    method_exchangeImplementations(method1, method2);
}
#endif

@end
