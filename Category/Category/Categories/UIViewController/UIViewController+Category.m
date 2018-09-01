//
//  UIViewController+Category.m
//  Category
//
//  Created by Jun Zhou on 2018/9/1.
//  Copyright © 2018年 Jun Zhou. All rights reserved.
//

#import "UIViewController+Category.h"
#import <objc/runtime.h>

@implementation UIViewController (Category)

@end

@implementation UIViewController (Life)

+ (void)load {
    
    Method loadView = class_getInstanceMethod(self, @selector(loadView));
    Method p_loadView = class_getInstanceMethod(self, @selector(p_loadView));
    method_exchangeImplementations(loadView, p_loadView);
    
    Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method p_viewDidLoad = class_getInstanceMethod(self, @selector(p_viewDidLoad));
    method_exchangeImplementations(viewDidLoad, p_viewDidLoad);
    
    Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method p_viewWillAppear = class_getInstanceMethod(self, @selector(p_viewWillAppear:));
    method_exchangeImplementations(viewWillAppear, p_viewWillAppear);
    
    Method viewDidAppear = class_getInstanceMethod(self, @selector(viewDidAppear:));
    Method p_viewDidAppear = class_getInstanceMethod(self, @selector(p_viewDidAppear:));
    method_exchangeImplementations(viewDidAppear, p_viewDidAppear);
    
    Method viewWillDisappear = class_getInstanceMethod(self, @selector(viewWillDisappear:));
    Method p_viewWillDisappear = class_getInstanceMethod(self, @selector(p_viewWillDisappear:));
    method_exchangeImplementations(viewWillDisappear, p_viewWillDisappear);
    
    Method viewDidDisappear = class_getInstanceMethod(self, @selector(viewDidDisappear:));
    Method p_viewDidDisappear = class_getInstanceMethod(self, @selector(p_viewDidDisappear:));
    method_exchangeImplementations(viewDidDisappear, p_viewDidDisappear);
    
}

- (void)p_loadView {
    NSLog(@"%@ loadView", self);
    [self p_loadView];
}

- (void)p_viewDidLoad {
    NSLog(@"%@ viewDidLoad", self);
    [self p_viewDidLoad];
}

- (void)p_viewWillAppear:(BOOL)animated {
    NSLog(@"%@ viewWillAppear", self);
    [self p_viewWillAppear:animated];
}

- (void)p_viewDidAppear:(BOOL)animated {
    NSLog(@"%@ viewDidAppear", self);
    [self p_viewDidAppear:animated];
}

- (void)p_viewWillDisappear:(BOOL)animated {
    NSLog(@"%@ viewWillDisappear", self);
    [self p_viewWillDisappear:animated];
}

- (void)p_viewDidDisappear:(BOOL)animated {
    NSLog(@"%@ viewDidDisappear", self);
    [self p_viewDidDisappear:animated];
}


- (NSString *)description {
    return [NSString stringWithFormat:@"%@", self.class];
}


@end
