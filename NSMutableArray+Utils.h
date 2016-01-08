//
//  NSMutableArray+Utils.h
//  Diveo
//
//  Created by Mo Bitar on 5/11/14.
//  Copyright (c) 2014 progenius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Utils)

/** Removes the last object matching the predicate */
- (BOOL)removeObjectMatchingPredicate:(NSPredicate *)predicate;

/** Removes all objects matching the predicate */
- (BOOL)removeObjectsMatchingPredicate:(NSPredicate *)predicate;

- (void)removeFirstObject;

- (void)shuffle;

@end
