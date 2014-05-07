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

@end
