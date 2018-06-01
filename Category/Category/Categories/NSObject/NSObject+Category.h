//
//  NSObject+Category.h
//  LinWei
//
//  Created by Jun Zhou on 2018/1/6.
//  Copyright © 2018年 Jun Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>
#import <objc/message.h>

@interface NSObject (Category)

@end

@interface NSObject (Runtime)

- (NSDictionary *)allIvars;
- (NSDictionary *)allProperties;
- (NSArray *)allIMethods;
- (NSArray *)allProtocols;

@end
