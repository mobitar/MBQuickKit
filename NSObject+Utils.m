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

void dispatch_async_main(dispatch_block_t block)
{
    dispatch_async(dispatch_get_main_queue(), block);
}

void dispatch_once_forever(NSString *eventName, dispatch_block_t block, void(^completion)(BOOL didPerform))
{
    NSString *key = [NSString stringWithFormat:@"dispatch_once_forever_%@", eventName];
    if([[NSUserDefaults standardUserDefaults] objectForKey:key]) {
        if(completion) {
            completion(NO);
        }
        return;
    }

    [[NSUserDefaults standardUserDefaults] setObject:key forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
   
    block();
   
    if(completion) {
        completion(YES);
    }
}

- (void)printDescription
{
    NSLog(@"%@", self);
}

@end
