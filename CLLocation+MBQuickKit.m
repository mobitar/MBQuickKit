//
//  CLLocation+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 12/24/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "CLLocation+MBQuickKit.h"

@implementation CLLocation (MBQuickKit)

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    return [self initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
}

@end
