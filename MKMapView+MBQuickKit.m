//
//  MKMapView+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 9/29/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "MKMapView+MBQuickKit.h"

@implementation MKMapView (MBQuickKit)

- (void)zoomToStreetLevel
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(self.centerCoordinate, 500, 500);
    MKCoordinateRegion adjustedRegion = [self regionThatFits:viewRegion];
    [self setRegion:adjustedRegion animated:YES];
}

@end
