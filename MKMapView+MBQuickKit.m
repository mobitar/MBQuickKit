//
//  MKMapView+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 9/29/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "MKMapView+MBQuickKit.h"

@implementation MKMapView (MBQuickKit)

NSString* NSStringFromCLLocationCoordinate2D(CLLocationCoordinate2D coordinate)
{
    return [NSString stringWithFormat:@"Latitude: %f Longitude: %f", coordinate.latitude, coordinate.longitude];
}

- (void)zoomToStreetLevel
{
    [self zoomToShowMeters:500];
}

- (void)zoomToShowMiles:(CGFloat)miles
{
    CGFloat meters = [@(miles) milesToMeters].floatValue;
    [self zoomToShowMeters:meters];
}

- (void)zoomToShowMeters:(CGFloat)meters
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(self.centerCoordinate, meters, meters);
    MKCoordinateRegion adjustedRegion = [self regionThatFits:viewRegion];
    [self setRegion:adjustedRegion animated:YES];
}

- (CLLocation *)centerLocation
{
    CLLocationCoordinate2D center = self.centerCoordinate;
    return [[CLLocation alloc] initWithLatitude:center.latitude longitude:center.longitude];
}

@end
