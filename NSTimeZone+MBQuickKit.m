//
//  NSTimeZone+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 11/17/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "NSTimeZone+MBQuickKit.h"

@implementation NSTimeZone (MBQuickKit)

- (NSString *)localizedName
{
    return [self localizedName:NSTimeZoneNameStyleGeneric locale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
}

@end
