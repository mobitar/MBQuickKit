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

- (NSInteger)year;
- (NSInteger)numericalMonth;
- (NSString *)alphabetizedMonth;
- (NSString *)alphabetizedMonthAndDay;
- (NSString *)alphabetizedMonthAndYear;
- (NSString *)alphabetizedMonthDayAndYear;
- (NSString *)numericalMonthDayAndYear;
- (NSString *)numericalMonthAndYear;

- (NSDate *)dateInBeginningOfMonth;
- (NSDate *)dateInEndOfMonth;

- (NSString *)month;

- (NSString *)toStringWithFormat:(NSString *)format;

/** Converts "Monday" to "Mon" */
+ (NSString *)stringByAbbreviatingWeekday:(NSString *)weekday;

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format;

+ (NSDate *)dateInMonth:(NSInteger)month year:(NSInteger)year;

@end
