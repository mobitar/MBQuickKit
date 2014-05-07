//
//  NSLocale+Utils.h
//  Tanger
//
//  Created by Mo Bitar on 5/7/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSLocale (Utils)

+ (NSString *)stateNameForAbbreviation:(NSString *)abbreviation;

+ (NSDictionary *)stateAbbreviationMapping;

@end
