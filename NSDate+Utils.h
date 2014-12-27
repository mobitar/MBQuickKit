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
- (BOOL)isInSameDayAsDate:(NSDate *)otherDate timezone:(NSTimeZone *)timezone;

- (BOOL) isToday;
- (BOOL) isTomorrow;

- (NSDateComponents *)componentsWithTimeZone:(NSTimeZone *)timeZone;

- (NSInteger)yearWithTimeZone:(NSTimeZone *)timezone;
- (NSString *)weekdayWithTimeZone:(NSTimeZone *)timezone;
- (NSString *)shortWeekdayWithTimeZone:(NSTimeZone *)timezone;
- (NSString *)alphabetizedMonth;
- (NSString *)alphabetizedMonthAndDay;
- (NSString *)alphabetizedMonthAndYear;
- (NSString *)alphabetizedMonthDayAndYearWithTimeZone:(NSTimeZone *)timezone;
- (NSString *)numericalMonthDayAndYear;
- (NSString *)numericalMonthAndYear;
- (NSInteger)numericalHour;

- (NSDate *)dateInBeginningOfDay;
- (NSDate *)dateInBeginningOfMonthInTimeZone:(NSTimeZone *)timezone;
- (NSDate *)dateInEndOfMonthInTimeZone:(NSTimeZone *)timezone;

- (NSInteger)monthWithTimeZone:(NSTimeZone *)timezone;

- (NSDate *)dateByAddingHours:(CGFloat)numberOfHours;
- (NSDate *)dateByAddingYears:(NSInteger)years;
- (NSDate *)dateByAddingMonths:(NSInteger)months;

- (NSDate *)dateByApplyingTimeOfDate:(NSDate *)sourceDate inTimeZone:(NSTimeZone *)timeZone;

- (NSInteger)numberOfMonthsFromDate:(NSDate *)date;
+ (CGFloat)numberOfHoursBetweenDate:(NSDate *)firstDate andDate:(NSDate *)secondDate;

- (NSString *)toStringWithFormat:(NSString *)format;
- (NSString *)toStringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone;

/** Converts "Monday" to "Mon" */
+ (NSString *)stringByAbbreviatingWeekday:(NSString *)weekday;

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format;

+ (NSDate *)dateInMonth:(NSInteger)month year:(NSInteger)year timezone:(NSTimeZone *)timezone;

/** 
 The earlier date should be on the left to return a positive number
 */
+ (NSInteger)numberOfDaysBetweenDate:(NSDate *)date1 andDate:(NSDate *)date2;

- (NSDate *)dateByRoundingMinutesDownToNearestQuarterWithTimeZone:(NSTimeZone *)timeZone;
- (NSDate *)dateByRoundingMinutesDownToNearestFraction:(CGFloat)fraction timeZone:(NSTimeZone *)timeZone;

+ (NSTimeZone *)timezoneFromDateString:(NSString *)dateStr;

@end
