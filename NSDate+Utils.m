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

- (NSString *)alphabetizedMonthAndYear
{
    return [self toStringWithFormat:@"MMMM, yyyy"];
}

- (NSInteger)numericalMonth
{
    return [[self toStringWithFormat:@"MM"] integerValue];
}

- (NSInteger)year
{
    return [[self toStringWithFormat:@"yyyy"] integerValue];
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

+ (NSInteger)numberOfDaysBetween:(NSDate *)date1 and:(NSDate *)date2
{
    NSUInteger unitFlags = NSDayCalendarUnit;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:unitFlags fromDate:date1 toDate:date2 options:0];
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

- (NSString *)month
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM"];
    return [formatter stringFromDate:self];
}

- (NSDate *)dateInBeginningOfMonth
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    [comps setDay:1];
    [comps setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return [currentCalendar dateFromComponents:comps];
}

- (NSDate *)dateInEndOfMonth
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    [comps setMonth:[comps month] + 1];
    [comps setDay:0];
    [comps setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    return [currentCalendar dateFromComponents:comps];
}

+ (NSDate *)dateInMonth:(NSInteger)month year:(NSInteger)year
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[NSDate date]];
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
