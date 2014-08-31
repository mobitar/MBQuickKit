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
- (BOOL)isInSameDayAsDate:(NSDate *)otherDate;

- (NSInteger)year;
- (NSInteger)numericalMonth;
- (NSString *)alphabetizedDay;
- (NSString *)alphabetizedMonth;
- (NSString *)alphabetizedMonthAndDay;
- (NSString *)alphabetizedMonthAndYear;
- (NSString *)alphabetizedMonthDayAndYear;
- (NSString *)numericalMonthDayAndYear;
- (NSString *)numericalMonthAndYear;

- (NSDate *)dateInBeginningOfMonth;
- (NSDate *)dateInEndOfMonth;

- (NSInteger)month;
- (NSDate *)dateByAddingHours:(NSInteger)numberOfHours;

- (NSString *)toStringWithFormat:(NSString *)format;

/** Converts "Monday" to "Mon" */
+ (NSString *)stringByAbbreviatingWeekday:(NSString *)weekday;

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format;

+ (NSDate *)dateInMonth:(NSInteger)month year:(NSInteger)year;

/** 
 The earlier date should be on the left to return a positive number
 */
+ (NSInteger)numberOfDaysBetweenDate:(NSDate *)date1 andDate:(NSDate *)date2;

@end
