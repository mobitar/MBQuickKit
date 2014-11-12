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

@end
