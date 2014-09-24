//
//  NSDate+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 4/11/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "NSDate+Utils.h"

@implementation NSDate (Utils)

- (BOOL)isWithinRangeOfDate:(NSDate *)fromDate andDate:(NSDate *)toDate
{
    NSComparisonResult from = [self compare:fromDate];
    NSComparisonResult to = [self compare:toDate];
    if((from == NSOrderedDescending || from == NSOrderedSame) && (to == NSOrderedSame || to == NSOrderedAscending)) {
        return YES;
    }
    
    return NO;
}

- (NSString *)alphabetizedMonthDayAndYear
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return [formatter stringFromDate:self];
}

- (NSString *)alphabetizedMonth
{
    return [self toStringWithFormat:@"MMM"];
}

- (NSString *)alphabetizedMonthAndDay
{
    return [self toStringWithFormat:@"MMM d"];
}

- (NSString *)alphabetizedDay
{
    return [self toStringWithFormat:@"EEEE"];
}

- (NSString *)alphabetizedMonthAndYear
{
    return [self toStringWithFormat:@"MMMM, yyyy"];
}

- (NSInteger)numericalMonth
{
    return [[self toStringWithFormat:@"MM"] integerValue];
}

- (NSString *)numericalMonthDayAndYear
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    return [formatter stringFromDate:self];
}

- (NSString *)numericalMonthAndYear
{
    return [self toStringWithFormat:@"MM/yyyy"];
}

+ (NSInteger)numberOfDaysBetweenDate:(NSDate *)date1 andDate:(NSDate *)date2
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components: NSCalendarUnitDay fromDate:date1 toDate:date2 options:0];
    return [components day] + 1;
}

- (NSString *)toStringWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:format];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return [formatter stringFromDate:self];
}

+ (NSString *)stringByAbbreviatingWeekday:(NSString *)weekday
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"EEEE"];
    NSDate *date = [formatter dateFromString:weekday];
    
    [formatter setDateFormat:@"EEE"];
    return [formatter stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return [formatter dateFromString:string];
}

- (NSDate *)dateInBeginningOfDay
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
    [comps setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return [currentCalendar dateFromComponents:comps];
}

- (NSDate *)dateInBeginningOfMonth
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    [comps setDay:1];
    [comps setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return [currentCalendar dateFromComponents:comps];
}

- (NSInteger)day
{
    return [self.components day];
}

- (NSInteger)month
{
    return [self.components month];
}

- (NSInteger)year
{
    return [self.components year];
}

- (NSDateComponents *)components
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    [comps setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return comps;
}

- (BOOL)isInSameDayAsDate:(NSDate *)otherDate
{
    NSDateComponents *comps = [self components];
    NSDateComponents *otherComps = [otherDate components];
    return comps.year == otherComps.year && comps.month == otherComps.month && comps.day == otherComps.day;
}

- (NSDate *)dateByAddingHours:(NSInteger)numberOfHours
{
    return [self dateByAddingTimeInterval:numberOfHours * 60 * 60];
}

- (NSDate *)dateInEndOfMonth
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    [comps setMonth:[comps month] + 1];
    [comps setDay:0];
    [comps setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return [currentCalendar dateFromComponents:comps];
}

+ (NSDate *)dateInMonth:(NSInteger)month year:(NSInteger)year
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    [comps setMonth:month];
    [comps setYear:year];
    [comps setDay:1];
    
    // Normalise the time portion
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
    [comps setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    return [currentCalendar dateFromComponents:comps];
}

@end
