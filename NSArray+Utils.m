//
//  NSArray+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 5/2/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "NSArray+Utils.h"

@implementation NSArray (Utils)

- (NSArray *)arrayByRemovingObject:(id)object
{
    NSMutableArray *array = [self mutableCopy];
    [array removeObject:object];
    return [array copy];
}

- (NSArray *)arrayByRemovingObjectsFromArray:(NSArray *)array
{
    NSMutableArray *newArray = [self mutableCopy];
    [newArray removeObjectsInArray:array];
    return [newArray copy];
}

- (instancetype)arrayWithUniqueObjects
{
    NSMutableArray *uniqueObjects = [NSMutableArray new];
    for(id obj in self) {
        if([uniqueObjects containsObject:obj] == NO) {
            [uniqueObjects addObject:obj];
        }
    }
    return uniqueObjects;
}

@end
