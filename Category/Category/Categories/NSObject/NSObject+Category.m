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


#ifdef DEBUG

@implementation NSSet(Log)

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSMutableString *desc = [NSMutableString string];
    
    NSMutableString *originalStr = [[NSMutableString alloc] initWithCapacity:level];
    for (NSUInteger i = 0; i < level; ++i) {
        [originalStr appendString:@"\t"];
    }
    NSString *tab = @"\t";
    if (level > 0) {
        tab = originalStr;
    }
    [desc appendString:@"\t{(\n"];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]
            || [obj isKindOfClass:[NSArray class]]
            || [obj isKindOfClass:[NSSet class]]) {
            NSString *str = [((NSDictionary *)obj) descriptionWithLocale:locale indent:level + 1];
            [desc appendFormat:@"%@\t%@,\n", tab, str];
        } else if ([obj isKindOfClass:[NSString class]]) {
            [desc appendFormat:@"%@\t\"%@\",\n", tab, obj];
        } else if ([obj isKindOfClass:[NSData class]]) {
            // if is NSData，try parse
            NSError *error = nil;
            NSObject *result =  [NSJSONSerialization JSONObjectWithData:obj
                                                                options:NSJSONReadingMutableContainers
                                                                  error:&error];
            if (error == nil && result != nil) {
                if ([result isKindOfClass:[NSDictionary class]]
                    || [result isKindOfClass:[NSArray class]]
                    || [result isKindOfClass:[NSSet class]]) {
                    NSString *str = [((NSDictionary *)result) descriptionWithLocale:locale indent:level + 1];
                    [desc appendFormat:@"%@\t%@,\n", tab, str];
                } else if ([obj isKindOfClass:[NSString class]]) {
                    [desc appendFormat:@"%@\t\"%@\",\n", tab, result];
                }
            } else {
                @try {
                    NSString *str = [[NSString alloc] initWithData:obj encoding:NSUTF8StringEncoding];
                    if (str != nil) {
                        [desc appendFormat:@"%@\t\"%@\",\n", tab, str];
                    } else {
                        [desc appendFormat:@"%@\t%@,\n", tab, obj];
                    }
                }
                @catch (NSException *exception) {
                    [desc appendFormat:@"%@\t%@,\n", tab, obj];
                }
            }
        } else {
            [desc appendFormat:@"%@\t%@,\n", tab, obj];
        }
    }];
    [desc appendFormat:@"%@)}", tab];
    return desc;
}

@end

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSMutableString *desc = [NSMutableString string];
    
    NSMutableString *originalStr = [[NSMutableString alloc] initWithCapacity:level];
    for (NSUInteger i = 0; i < level; ++i) {
        [originalStr appendString:@"\t"];
    }
    NSString *tab = @"";
    if (level > 0) {
        tab = originalStr;
    }
    [desc appendString:@"\t(\n"];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]
            || [obj isKindOfClass:[NSArray class]]
            || [obj isKindOfClass:[NSSet class]]) {
            NSString *str = [((NSDictionary *)obj) descriptionWithLocale:locale indent:level + 1];
            [desc appendFormat:@"%@\t%@,\n", tab, str];
        } else if ([obj isKindOfClass:[NSString class]]) {
            [desc appendFormat:@"%@\t\"%@\",\n", tab, obj];
        } else if ([obj isKindOfClass:[NSData class]]) {
            
            NSError *error = nil;
            NSObject *result =  [NSJSONSerialization JSONObjectWithData:obj
                                                                options:NSJSONReadingMutableContainers
                                                                  error:&error];
            if (error == nil && result != nil) {
                if ([result isKindOfClass:[NSDictionary class]]
                    || [result isKindOfClass:[NSArray class]]
                    || [result isKindOfClass:[NSSet class]]) {
                    NSString *str = [((NSDictionary *)result) descriptionWithLocale:locale indent:level + 1];
                    [desc appendFormat:@"%@\t%@,\n", tab, str];
                } else if ([obj isKindOfClass:[NSString class]]) {
                    [desc appendFormat:@"%@\t\"%@\",\n", tab, result];
                }
            } else {
                @try {
                    NSString *str = [[NSString alloc] initWithData:obj encoding:NSUTF8StringEncoding];
                    if (str != nil) {
                        [desc appendFormat:@"%@\t\"%@\",\n", tab, str];
                    } else {
                        [desc appendFormat:@"%@\t%@,\n", tab, obj];
                    }
                }
                @catch (NSException *exception) {
                    [desc appendFormat:@"%@\t%@,\n", tab, obj];
                }
            }
        } else {
            [desc appendFormat:@"%@\t%@,\n", tab, obj];
        }
    }];
    [desc appendFormat:@"%@)", tab];
    
    return desc;
}

@end

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSMutableString *desc = [NSMutableString string];
    
    NSMutableString *originalStr = [[NSMutableString alloc] initWithCapacity:level];
    for (NSUInteger i = 0; i < level; ++i) {
        [originalStr appendString:@"\t"];
    }
    
    NSString *tab = @"";
    if (level > 0) {
        tab = originalStr;
    }
    
    [desc appendString:@"\t{\n"];
    
    [self.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        id obj = [self objectForKey:key];
        
        if ([obj isKindOfClass:[NSString class]]) {
            [desc appendFormat:@"%@\t%@ = \"%@\",\n", tab, key, obj];
        } else if ([obj isKindOfClass:[NSArray class]]
                   || [obj isKindOfClass:[NSDictionary class]]
                   || [obj isKindOfClass:[NSSet class]]) {
            [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, [obj descriptionWithLocale:locale indent:level + 1]];
        } else if ([obj isKindOfClass:[NSData class]]) {
            
            NSError *error = nil;
            NSObject *result =  [NSJSONSerialization JSONObjectWithData:obj
                                                                options:NSJSONReadingMutableContainers
                                                                  error:&error];
            if (error == nil && result != nil) {
                if ([result isKindOfClass:[NSDictionary class]]
                    || [result isKindOfClass:[NSArray class]]
                    || [result isKindOfClass:[NSSet class]]) {
                    NSString *str = [((NSDictionary *)result) descriptionWithLocale:locale indent:level + 1];
                    [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, str];
                } else if ([obj isKindOfClass:[NSString class]]) {
                    [desc appendFormat:@"%@\t%@ = \"%@\",\n", tab, key, result];
                }
            } else {
                @try {
                    NSString *str = [[NSString alloc] initWithData:obj encoding:NSUTF8StringEncoding];
                    if (str != nil) {
                        [desc appendFormat:@"%@\t%@ = \"%@\",\n", tab, key, str];
                    } else {
                        [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, obj];
                    }
                }
                @catch (NSException *exception) {
                    [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, obj];
                }
            }
        } else {
            [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, obj];
        }
    }];
    [desc appendFormat:@"%@}", tab];
    
    return desc;
}

@end

#endif

