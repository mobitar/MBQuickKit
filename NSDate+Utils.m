//
//  NSDate+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 4/11/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "NSDate+Utils.h"

static const unsigned componentFlags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);

@implementation NSDate (Utils)

+ (NSCalendar *) currentCalendar
{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar) {
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    }
    return sharedCalendar;
}

- (NSDate *) dateByAddingDays: (NSInteger) dDays
{
    NSDateComponents *dateComponents = [NSDateComponents new];
    [dateComponents setDay:dDays];
    NSDate *newDate = [[self.class currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)dateByAddingYears:(NSInteger)years
{
    NSDateComponents *dateComponents = [NSDateComponents new];
    [dateComponents setYear:years];
    NSDate *newDate = [[self.class currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)dateByAddingMonths:(NSInteger)months
{
    NSDateComponents *dateComponents = [NSDateComponents new];
    [dateComponents setMonth:months];
    NSDate *newDate = [[self.class currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) dateBySubtractingDays: (NSInteger) dDays
{
    return [self dateByAddingDays: (dDays * -1)];
}

+ (NSDate *) dateWithDaysFromNow: (NSInteger) days
{
    return [[NSDate date] dateByAddingDays:days];
}

+ (NSDate *) dateWithDaysBeforeNow: (NSInteger) days
{
    return [[NSDate date] dateBySubtractingDays:days];
}

+ (NSDate *) dateTomorrow
{
    return [NSDate dateWithDaysFromNow:1];
}

- (BOOL) isEqualToDateIgnoringTime: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:componentFlags fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL) isToday
{
    return [self isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL) isTomorrow
{
    return [self isEqualToDateIgnoringTime:[NSDate dateTomorrow]];
}

- (BOOL)isWithinRangeOfDate:(NSDate *)fromDate andDate:(NSDate *)toDate
{
    NSComparisonResult from = [self compare:fromDate];
    NSComparisonResult to = [self compare:toDate];
    if((from == NSOrderedDescending || from == NSOrderedSame) && (to == NSOrderedSame || to == NSOrderedAscending)) {
        return YES;
    }
    
    return NO;
}

- (NSString *)alphabetizedMonthDayAndYearWithTimeZone:(NSTimeZone *)timezone
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeZone:timezone];
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

- (NSString *)weekdayWithTimeZone:(NSTimeZone *)timezone
{
    return [self toStringWithFormat:@"EEEE" timeZone:timezone];
}

- (NSString *)shortWeekdayWithTimeZone:(NSTimeZone *)timezone
{
    return [self toStringWithFormat:@"EEE" timeZone:timezone];
}

- (NSString *)alphabetizedMonthAndYear
{
    return [self toStringWithFormat:@"MMMM, yyyy"];
}

- (NSInteger)numericalHour
{
    return [[self toStringWithFormat:@"HH"] integerValue];
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
    return [self toStringWithFormat:format timeZone:nil];
}

- (NSString *)toStringWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:format];
    [formatter setTimeZone:timeZone];
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
    return [formatter dateFromString:string];
}

- (NSDate *)dateInBeginningOfDay
{
    NSCalendar *currentCalendar = [self.class currentCalendar];
    NSDateComponents *comps = [currentCalendar components:componentFlags fromDate:self];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
    return [currentCalendar dateFromComponents:comps];
}

- (NSDate *)dateInBeginningOfMonthInTimeZone:(NSTimeZone *)timezone
{
    NSCalendar *currentCalendar = [self.class currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    [comps setDay:1];
    [comps setTimeZone:timezone];
    return [currentCalendar dateFromComponents:comps];
}

- (NSInteger)numberOfMonthsFromDate:(NSDate *)date
{
    NSInteger month = [[[self.class currentCalendar] components: NSCalendarUnitMonth
                                                       fromDate: self
                                                         toDate: date
                                                        options: 0] month];
    return month;
}

- (NSInteger)dayWithTimeZone:(NSTimeZone *)timezone
{
    return [[self componentsWithTimeZone:timezone] day];
}

- (NSInteger)monthWithTimeZone:(NSTimeZone *)timezone
{
    return [[self componentsWithTimeZone:timezone] month];
}

- (NSInteger)yearWithTimeZone:(NSTimeZone *)timezone
{
    return [[self componentsWithTimeZone:timezone] year];
}

- (NSDateComponents *)componentsWithTimeZone:(NSTimeZone *)timeZone
{
    NSCalendar *currentCalendar = [self.class currentCalendar];
    [currentCalendar setTimeZone:timeZone];
    NSDateComponents *comps = [currentCalendar components:componentFlags fromDate:self];
    comps.calendar = currentCalendar;
    [comps setTimeZone:timeZone];
    return comps;
}

- (BOOL)isInSameDayAsDate:(NSDate *)otherDate timezone:(NSTimeZone *)timezone
{
    NSDateComponents *comps = [self componentsWithTimeZone:timezone];
    NSDateComponents *otherComps = [otherDate componentsWithTimeZone:timezone];
    return comps.year == otherComps.year && comps.month == otherComps.month && comps.day == otherComps.day;
}

- (NSDate *)dateByAddingHours:(NSInteger)numberOfHours
{
    return [self dateByAddingTimeInterval:numberOfHours * 60 * 60];
}

- (NSDate *)dateInEndOfMonthInTimeZone:(NSTimeZone *)timezone
{
    NSCalendar *currentCalendar = [self.class currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    [comps setMonth:[comps month] + 1];
    [comps setDay:0];
    [comps setTimeZone:timezone];
    return [currentCalendar dateFromComponents:comps];
}

+ (NSDate *)dateInMonth:(NSInteger)month year:(NSInteger)year timezone:(NSTimeZone *)timezone
{
    NSCalendar *currentCalendar = [self.class currentCalendar];
    NSDateComponents *comps = [currentCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
    [comps setMonth:month];
    [comps setYear:year];
    [comps setDay:1];
    
    // Normalise the time portion
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
    [comps setTimeZone:timezone];
    
    return [currentCalendar dateFromComponents:comps];
}

@end
