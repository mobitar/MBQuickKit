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

- (NSDate *)dateBySubtractingDays:(NSInteger)dDays
{
    return [self dateByAddingDays: (dDays * -1)];
}

+ (NSDate *)dateWithDaysFromNow:(NSInteger)days
{
    return [[NSDate date] dateByAddingDays:days];
}

+ (NSDate *)dateWithDaysBeforeNow:(NSInteger)days
{
    return [[NSDate date] dateBySubtractingDays:days];
}

+ (NSDate *)dateTomorrow
{
    return [NSDate dateWithDaysFromNow:1];
}

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)aDate
{
    NSDateComponents *components1 = [[NSDate currentCalendar] components:componentFlags fromDate:self];
    NSDateComponents *components2 = [[NSDate currentCalendar] components:componentFlags fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL)isToday
{
    return [self isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)isTomorrow
{
    return [self isEqualToDateIgnoringTime:[NSDate dateTomorrow]];
}

- (BOOL)isLessThan:(NSDate *)date
{
    return [self compare:date] == NSOrderedAscending;
}

- (BOOL)isLessThanOrEqualTo:(NSDate *)date
{
    NSComparisonResult result = [self compare:date];
    return result == NSOrderedAscending || result == NSOrderedSame;
}

- (BOOL)isGreaterThan:(NSDate *)date
{
    return [self compare:date] == NSOrderedDescending;
}

- (BOOL)isGreaterThanOrEqualTo:(NSDate *)date
{
    NSComparisonResult result = [self compare:date];
    return result == NSOrderedDescending || result == NSOrderedSame;
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

- (NSDate *)dateByApplyingTimeOfDate:(NSDate *)sourceDate inTimeZone:(NSTimeZone *)timeZone
{
    NSDateComponents *targetComps = [self componentsWithTimeZone:timeZone];
    NSDateComponents *sourceComps = [sourceDate componentsWithTimeZone:timeZone];
    
    [targetComps setHour:sourceComps.hour];
    [targetComps setMinute:sourceComps.minute];
    [targetComps setSecond:sourceComps.second];
    
    return [targetComps.calendar dateFromComponents:targetComps];
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

+ (CGFloat)numberOfHoursBetweenDate:(NSDate *)firstDate andDate:(NSDate *)secondDate
{
    NSTimeInterval distanceBetweenDates = [secondDate timeIntervalSinceDate:firstDate];
    double secondsInAnHour = 3600.0;
    CGFloat hoursBetweenDates = distanceBetweenDates / secondsInAnHour;
    return hoursBetweenDates;
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
                                                       fromDate: date
                                                         toDate: self
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

- (NSDate *)dateByAddingHours:(CGFloat)numberOfHours
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

- (NSDate *)dateByRoundingMinutesDownToNearestQuarterWithTimeZone:(NSTimeZone *)timeZone
{
    return [self dateByRoundingMinutesDownToNearestFraction:0.25 timeZone:timeZone];
}

- (NSDate *)dateByRoundingMinutesDownToNearestFraction:(CGFloat)fraction timeZone:(NSTimeZone *)timeZone
{
    NSDateComponents *time = [self componentsWithTimeZone:timeZone];
    NSInteger minutes = [time minute];
    CGFloat const minutesInHour = 60.0;
    fraction = fraction * minutesInHour;
    float minuteUnit = floor((float) minutes / fraction);
    minutes = minuteUnit * fraction;
    [time setMinute: minutes];
    return [time.calendar dateFromComponents:time];
}

+ (NSTimeZone *)timezoneFromDateString:(NSString *)dateStr
{
    // length == 5                  => the passed string is considere the time-zone itself (eg. +0200)
    // length != 5 && length == 24  => the passed string is a full date with time-zone (eg. 2012-09-02T19:00:00-0700)
    // in all the other cases the passed string doesn't represent a UTC date or time-zome string so the system time-zone is returned as default.
    if ([dateStr length] != 5 && [dateStr length] < 24) {
        return [NSTimeZone systemTimeZone];
    }
    NSString *GMTString      = [dateStr substringFromIndex:[dateStr length]-5];
    NSString *sign = [dateStr substringWithRange:NSMakeRange([dateStr length]-6, 1)];
    NSInteger directionVector = [sign isEqualToString:@"-"] ? -1 : 1;
    NSInteger hoursFromGMT   = [[GMTString substringToIndex:3] intValue];
    NSInteger minutesFromGMT = [[GMTString substringFromIndex:3] intValue];
    NSInteger secondsFromGMT = (hoursFromGMT * 60 * 60) + (minutesFromGMT * 60);
    return [NSTimeZone timeZoneForSecondsFromGMT:secondsFromGMT * directionVector];
}

@end
