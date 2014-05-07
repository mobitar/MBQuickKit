//
//  NSObject+Utils.h
//  Tanger
//
//  Created by Mo Bitar on 5/2/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Utils)

- (void)setDynamicValue:(id)value forKey:(NSString *)key;
- (void)removeDynamicValueForKey:(NSString *)key;
- (id)getDynamicValueForKey:(NSString *)key;

@end
