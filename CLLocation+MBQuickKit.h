//
//  CLLocation+MBQuickKit.h
//  ParkWhiz
//
//  Created by Mo Bitar on 12/24/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (MBQuickKit)
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate;
@end
