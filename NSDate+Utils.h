//
//  NSDate+Utils.h
//  Tanger
//
//  Created by Mo Bitar on 4/11/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)

- (BOOL)isWithinRangeOfDate:(NSDate *)fromDate andDate:(NSDate *)toDate;

- (NSString *)alphabetizedMonthDayAndYear;
- (NSString *)numericalMonthDayAndYear;

- (NSString *)month;

- (NSString *)toStringWithFormat:(NSString *)format;

/** Converts "Monday" to "Mon" */
+ (NSString *)stringByAbbreviatingWeekday:(NSString *)weekday;

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format;

@end
