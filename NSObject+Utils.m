//
//  NSObject+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 5/2/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "NSObject+Utils.h"
#import <objc/runtime.h>

@implementation NSObject (Utils)

- (void)setDynamicValue:(id)value forKey:(NSString *)key
{
    objc_setAssociatedObject(self, (__bridge const void *)(key), value, OBJC_ASSOCIATION_RETAIN);
}

- (void)removeDynamicValueForKey:(NSString *)key
{
    objc_setAssociatedObject(self, (__bridge const void *)(key), nil, OBJC_ASSOCIATION_RETAIN);
}

- (id)getDynamicValueForKey:(NSString *)key
{
    return objc_getAssociatedObject(self, (__bridge const void *)(key));
}

@end
