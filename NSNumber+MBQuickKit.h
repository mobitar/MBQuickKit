//
//  NSNumber+MBQuickKit.h
//  ParkWhiz
//
//  Created by Mo Bitar on 11/12/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSNumber (MBQuickKit)

- (NSString *)toStringWithSignificantDigits;
- (NSString *)toStringWithSignificantDigits:(NSInteger)numberOfSignificantDigits;

- (NSNumber *)numberByRoundingUpToNearestQuarter;
- (NSNumber *)numberByRoundingDownToNearestQuarter;
- (NSNumber *)numberByRoundingUpToNearestFraction:(CGFloat)fraction;
- (NSNumber *)numberByRoundingDownToNearestFraction:(CGFloat)fraction;

- (NSNumber *)metersToMiles;
- (NSNumber *)milesToMeters;
- (NSString *)minimalDollarString;
- (NSString *)minimalDecimalString;
@end
