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

- (id)safeObjectAtIndex:(NSInteger)index
{
    if(index >= self.count)
        return nil;
    return self[index];
}

- (instancetype)safeSubArrayWithRange:(NSRange)range
{
    if(range.location >= self.count)
        return nil;
    
    if(range.location + range.length > self.count)
        range.length = self.count - range.location;
    
    return [self subarrayWithRange:range];
}

- (NSString*)toJSON
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
