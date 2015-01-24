//
//  NSIndexPath+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 1/23/15.
//  Copyright (c) 2015 ParkWhiz. All rights reserved.
//

#import "NSIndexPath+MBQuickKit.h"

@implementation NSIndexPath (MBQuickKit)

+ (NSArray *)indexPathsBySortingIndexPathsAscending:(NSArray *)indexPaths
{
    NSMutableArray *sorted = [indexPaths mutableCopy];
    
    [sorted sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSInteger r1 = [obj1 row];
        NSInteger r2 = [obj2 row];
        if (r1 > r2) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if (r1 < r2) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    return [sorted copy];
}

@end
