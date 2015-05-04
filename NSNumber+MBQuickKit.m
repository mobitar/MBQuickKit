//
//  NSNumber+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 11/12/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "NSNumber+MBQuickKit.h"
#import "MBQuickKit.h"

@implementation NSNumber (MBQuickKit)

- (NSString *)toStringWithSignificantDigits
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *output = [formatter stringFromNumber:self];
    return output;
}

- (NSString *)toStringWithSignificantDigits:(NSInteger)numberOfSignificantDigits
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMinimumSignificantDigits:numberOfSignificantDigits];
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

static CGFloat const metersInMile = 1609.34;

- (NSNumber *)metersToMiles
{
    return @(self.floatValue / metersInMile);
}

- (NSNumber *)milesToMeters
{
    return @(self.floatValue * metersInMile);
}

- (NSString *)minimalDollarString
{
    CGFloat priceToUse = self.floatValue;
    int price = priceToUse;
    CGFloat decimal = priceToUse - price;
    BOOL hasDecimal = decimal > 0;
    NSString *priceText = nil;
    if(hasDecimal) {
        priceText = [NSString stringWithFormat:@"$%.2f", priceToUse];
    } else {
        priceText = [NSString stringWithFormat:@"$%.0f", priceToUse];
    }
    return priceText;
}

- (NSString *)minimalDecimalString
{
    CGFloat valueToUse = self.floatValue;
    int value = valueToUse;
    CGFloat decimal = valueToUse - value;
    BOOL hasDecimal = decimal > 0;
    NSString *text = nil;
    if(hasDecimal) {
        text = [NSString stringWithFormat:@"%.2f", valueToUse];
    } else {
        text = [NSString stringWithFormat:@"%.0f", valueToUse];
    }
    return text;
}

@end
