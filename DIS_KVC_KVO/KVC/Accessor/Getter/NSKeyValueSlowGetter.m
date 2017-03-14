//
//  NSKeyValueSlowGetter.m
//  DIS_KVC_KVO
//
//  Created by renjinkui on 2017/3/9.
//  Copyright © 2017年 JK. All rights reserved.
//

#import "NSKeyValueSlowGetter.h"
#import <objc/runtime.h>

@implementation NSKeyValueSlowGetter

- (id)initWithContainerClassID:(id)containerClassID key:(NSString *)key containerIsa:(Class)containerIsa {
    Method valueForKeyMethod = class_getInstanceMethod(containerIsa, @selector(valueForKey:));
    void *arguments[3] = {NULL};
    arguments[0] = key;
    self = [super initWithContainerClassID:containerClassID key:key implementation:method_getImplementation(valueForKeyMethod) selector:@selector(valueForKey:) extraArguments:arguments count:1];
    return self;
}

@end