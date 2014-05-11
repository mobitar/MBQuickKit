//
//  NSMutableArray+Utils.h
//  Diveo
//
//  Created by Mo Bitar on 5/11/14.
//  Copyright (c) 2014 progenius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Utils)

- (BOOL)removeObjectMatchingPredicate:(NSPredicate *)predicate;

@end
