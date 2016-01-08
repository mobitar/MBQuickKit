//
//  NSMutableArray+Utils.m
//  Diveo
//
//  Created by Mo Bitar on 5/11/14.
//  Copyright (c) 2014 progenius. All rights reserved.
//

#import "NSMutableArray+Utils.h"

@implementation NSMutableArray (Utils)

- (BOOL)removeObjectMatchingPredicate:(NSPredicate *)predicate
{
    id obj = [self filteredArrayUsingPredicate:predicate].lastObject;
    if(!obj) {
        return NO;
    }
    
    [self removeObject:obj];
    return YES;
}

- (BOOL)removeObjectsMatchingPredicate:(NSPredicate *)predicate
{
    NSArray *objects = [self filteredArrayUsingPredicate:predicate];
    if(!objects.count) {
        return NO;
    }
    
    [self removeObjectsInArray:objects];
    return YES;
}

- (void)removeFirstObject
{
    [self removeObjectAtIndex:0];
}

- (void)shuffle
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}
@end
