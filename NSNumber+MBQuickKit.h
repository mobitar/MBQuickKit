//
//  NSNumber+MBQuickKit.h
//  ParkWhiz
//
//  Created by Mo Bitar on 11/12/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MBQuickKit)

- (NSString *)toStringWithSignificantDigits;

- (NSNumber *)numberByRoundingUpToNearestQuarter;
- (NSNumber *)numberByRoundingDownToNearestQuarter;
- (NSNumber *)numberByRoundingUpToNearestFraction:(CGFloat)fraction;
- (NSNumber *)numberByRoundingDownToNearestFraction:(CGFloat)fraction;

- (NSNumber *)metersToMiles;
- (NSNumber *)milesToMeters;

@end
