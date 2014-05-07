//
//  NSLocale+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 5/7/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "NSLocale+Utils.h"

@implementation NSLocale (Utils)

+ (NSString *)stateNameForAbbreviation:(NSString *)abbreviation
{
    return [self stateAbbreviationMapping][[abbreviation uppercaseString]];
}

+ (NSDictionary *)stateAbbreviationMapping
{
    static NSDictionary *nameAbbreviations = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,  ^{
        nameAbbreviations = @{
                             @"AL" : @"Alabama",
                             @"AK" : @"Alaska",
                             @"AZ" : @"Arizona",
                             @"AR" : @"Arkansas",
                             @"CA" : @"California",
                             @"CO" : @"Colorado",
                             @"CT" : @"Connecticut",
                             @"DE" : @"Delaware",
                             @"DC" : @"District of Columbia",
                             @"FL" : @"Florida",
                             @"GA" : @"Georgia",
                             @"HI" : @"Hawaii",
                             @"ID" : @"Idaho",
                             @"IL" : @"Illinois",
                             @"IN" : @"Indiana",
                             @"IA" : @"Iowa",
                             @"KS" : @"Kansas",
                             @"KY" : @"Kentucky",
                             @"LA" : @"Louisiana",
                             @"ME" : @"Maine",
                             @"MD" : @"Maryland",
                             @"MA" : @"Massachusetts",
                             @"MI" : @"Michigan",
                             @"MN" : @"Minnesota",
                             @"MS" : @"Mississippi",
                             @"MO" : @"Missouri",
                             @"MT" : @"Montana",
                             @"NE" : @"Nebraska",
                             @"NV" : @"Nevada",
                             @"NH" : @"New Hampshire",
                             @"NJ" : @"New Jersey",
                             @"NM" : @"New Mexico",
                             @"NY" : @"New York",
                             @"NC" : @"North Carolina",
                             @"ND" : @"North Dakota",
                             @"OH" : @"Ohio",
                             @"OK" : @"Oklahoma",
                             @"OR" : @"Oregon",
                             @"PA" : @"Pennsylvania",
                             @"RI" : @"Rhode Island",
                             @"SC" : @"South Carolina",
                             @"SD" : @"South Dakota",
                             @"TN" : @"Tennessee",
                             @"TX" : @"Texas",
                             @"UT" : @"Utah",
                             @"VT" : @"Vermont",
                             @"VA" : @"Virginia",
                             @"WA" : @"Washington",
                             @"WV" : @"West Virginia",
                             @"WI" : @"Wisconsin",
                             @"WY" : @"Wyoming"
                             };
    });
    
    return nameAbbreviations;
}


@end
