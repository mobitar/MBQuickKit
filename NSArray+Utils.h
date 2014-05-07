//
//  NSArray+Utils.h
//  Tanger
//
//  Created by Mo Bitar on 5/2/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Utils)

- (NSArray *)arrayByRemovingObject:(id)object;

- (instancetype)arrayWithUniqueObjects;

@end
