//
//  NSObject+Category.m
//  LinWei
//
//  Created by Jun Zhou on 2018/1/6.
//  Copyright © 2018年 Jun Zhou. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (Category)

@end

@implementation NSObject (Runtime)

- (NSDictionary *)allIvars {
    NSMutableDictionary *resultDictionary = @{}.mutableCopy;
    
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    
    for (NSInteger i = 0; i < outCount; i++) {
        const char *ivarName = ivar_getName(ivars[i]);
        NSString *name = [NSString stringWithUTF8String:ivarName];
        id ivarValue = [self valueForKey:name];
        if (ivarValue) {
            resultDictionary[name] = ivarValue;
        } else {
           resultDictionary[name] = @"value not exist";
        }
    }
    free(ivars);
    
    return resultDictionary.copy;
}

- (NSDictionary *)allProperties {
    NSMutableDictionary *resultDictionary = @{}.mutableCopy;
    
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (NSInteger i = 0; i < outCount; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        id propertyValue = [self valueForKey:name];
        if (propertyValue) {
            resultDictionary[name] = propertyValue;
        } else {
            resultDictionary[name] = @"value not exist";
        }
    }
    free(properties);
    
    return resultDictionary.copy;
}

- (NSArray *)allIMethods {
    NSMutableArray *resultArray = @[].mutableCopy;
    
    unsigned int outCount = 0;
    Method *methods = class_copyMethodList([self class], &outCount);
    
    for (NSInteger i = 0; i < outCount; i++) {
        NSMutableDictionary *methodDic = @{}.mutableCopy;
        
        SEL methodSEL = method_getName(methods[i]);
        const char *methodName = sel_getName(methodSEL);
        NSString *name = [NSString stringWithUTF8String:methodName];
        methodDic[@"name"] = name;
        
        char *retunType = method_copyReturnType(methods[i]);
        methodDic[@"returnType"] = [NSString stringWithFormat:@"%s", retunType];
        
        unsigned int argsNum = method_getNumberOfArguments(methods[i]);
        methodDic[@"argsNum"] = @(argsNum - 2);
        
        [resultArray addObject:methodDic];
    }
    free(methods);

    return resultArray.copy;
}

- (NSArray *)allProtocols {
    NSMutableArray *resultArray = @[].mutableCopy;
    
    unsigned int outCount = 0;
    Protocol * __unsafe_unretained _Nonnull * _Nullable protocols = class_copyProtocolList([self class], &outCount);
    for (unsigned int i = 0; i < outCount; i++) {
        const char * protoName = protocol_getName(protocols[i]);
        NSString *name = [NSString stringWithUTF8String:protoName];
        [resultArray addObject:name];
    }
    
    return resultArray.copy;
}

@end
