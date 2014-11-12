//
//  NSNumber+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 11/12/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "NSNumber+MBQuickKit.h"

@implementation NSNumber (MBQuickKit)

- (NSString *)toStringWithSignificantDigits
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *output = [formatter stringFromNumber:self];
    return output;
}

- (NSNumber *)numberByRoundingUpToNearestFraction:(CGFloat)fraction
{
    double num = self.doubleValue;
    num = ceil(num / fraction) * fraction;
    return @(num);
}

- (NSNumber *)numberByRoundingUpToNearestQuarter
{
    return [self numberByRoundingUpToNearestFraction:0.25];
}

- (NSNumber *)numberByRoundingDownToNearestFraction:(CGFloat)fraction
{
    double num = self.doubleValue;
    num = floor(num / fraction) * fraction;
    return @(num);
}

- (NSNumber *)numberByRoundingDownToNearestQuarter
{
    return [self numberByRoundingDownToNearestFraction:0.25];
}

@end
