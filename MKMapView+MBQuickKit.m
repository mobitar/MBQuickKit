//
//  MKMapView+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 9/29/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "MKMapView+MBQuickKit.h"
#import "MBXAnnotation.h"

@implementation MKMapView (MBQuickKit)

NSString* NSStringFromCLLocationCoordinate2D(CLLocationCoordinate2D coordinate)
{
    return [NSString stringWithFormat:@"Latitude: %f Longitude: %f", coordinate.latitude, coordinate.longitude];
}

BOOL CLLocationCoordinate2DEqual(CLLocationCoordinate2D coordinate1, CLLocationCoordinate2D coordinate2)
{
    return coordinate1.latitude == coordinate2.latitude && coordinate1.longitude == coordinate2.longitude;
}

CLLocationDistance CLLocationCoordinate2DCalculateDistance(CLLocationCoordinate2D coord1, CLLocationCoordinate2D coord2)
{
    return [[[CLLocation alloc] initWithCoordinate:coord1] distanceFromLocation:[[CLLocation alloc] initWithCoordinate:coord2]];
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

- (NSArray *)annotationsExcludingUserLocation
{
    NSMutableArray *annotations = [self.annotations mutableCopy];
    for(id<MKAnnotation> annotation in self.annotations) {
        if([annotation isKindOfClass:[MKUserLocation class]]) {
            [annotations removeObject:annotation];
        }
    }
    
    return annotations;
}

- (void)zoomToShowAnnotations:(NSArray *)annotations paddingMultiplier:(CGFloat)multipler
{    
    [self zoomToShowAnnotationsWhileLockingCenter:NO annotations:annotations extraPaddingMultiplier:multipler];
}

- (void)zoomToShowAnnotationsWhileLockingCenter:(NSArray *)annotations paddingMultiplier:(CGFloat)multipler
{
    [self zoomToShowAnnotationsWhileLockingCenter:YES annotations:annotations paddingMultiplier:multipler];
}

- (void)zoomToShowAnnotationsWhileLockingCenter:(BOOL)lockCenter annotations:(NSArray *)annotations extraPaddingMultiplier:(CGFloat)multiplier
{
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    MBXAnnotation *center = [MBXAnnotation new];
    center.coordinate = self.centerCoordinate;
    if(lockCenter) {
        annotations = [annotations arrayByAddingObject:center];
    }
    
    for(id<MKAnnotation> annotation in annotations)
    {
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
        
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
    }
    
    MKCoordinateRegion region;
    
    if(lockCenter) {
        region.center.latitude = self.centerCoordinate.latitude;
        region.center.longitude = self.centerCoordinate.longitude;
    } else  {
        region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
        region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    }
    
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * (multiplier != 0 ? multiplier : 1); // Add a little extra space on the sides
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * (multiplier != 0 ? multiplier : 1); // Add a little extra space on the sides
    
    if(isnan(region.span.latitudeDelta) || isnan(region.span.longitudeDelta)) {
        return;
    }
    
    region = [self regionThatFits:region];
    [self setRegion:region animated:YES];
}

- (void)zoomToShowAnnotationsWhileLockingCenter:(BOOL)lockCenter annotations:(NSArray *)annotations paddingMultiplier:(CGFloat)multiplier
{
    [self zoomToShowAnnotationsWhileLockingCenter:lockCenter annotations:annotations extraPaddingMultiplier:multiplier];
}

@end
