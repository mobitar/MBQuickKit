//
//  MKMapView+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 9/29/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "MKMapView+MBQuickKit.h"
#import "MBXAnnotation.h"
#import "MBQuickKit.h"

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

- (BOOL)regionDidChangeFromUserInteraction
{
    UIView *view = self.subviews.firstObject;
    //	Look through gesture recognizers to determine whether this region change is from user interaction
    for(UIGestureRecognizer *recognizer in view.gestureRecognizers) {
        if(recognizer.state == UIGestureRecognizerStateBegan) {
            return YES;
        }
    }
    
    return NO;
}

- (void)zoomToStreetLevelAnimated:(BOOL)animated
{
    [self zoomToShowMeters:500 animated:animated];
}

- (void)zoomToShowMiles:(CGFloat)miles animated:(BOOL)animated
{
    CGFloat meters = [@(miles) milesToMeters].floatValue;
    [self zoomToShowMeters:meters animated:animated];
}

- (void)zoomToShowMeters:(CGFloat)meters animated:(BOOL)animated
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(self.centerCoordinate, meters, meters);
    MKCoordinateRegion adjustedRegion = [self regionThatFits:viewRegion];
    [self setRegion:adjustedRegion animated:animated];
}

- (CLLocation *)centerLocation
{
    CLLocationCoordinate2D center = self.centerCoordinate;
    return [[CLLocation alloc] initWithLatitude:center.latitude longitude:center.longitude];
}

- (NSArray *)annotationsExcludingUserLocation
{
    return [self annotationsExcludingUserLocationAndAnnotations:nil];
}

- (NSArray *)annotationsExcludingUserLocationAndAnnotations:(NSArray *)annotationsToExclude
{
    NSMutableArray *annotations = [self.annotations mutableCopy];
    for(id<MKAnnotation> annotation in self.annotations) {
        if([annotation isKindOfClass:[MKUserLocation class]] || [annotationsToExclude containsObject:annotation]) {
            [annotations removeObject:annotation];
        }
    }
    
    return annotations;
}

- (MKMapRect)MKMapRectForCoordinateRegion:(MKCoordinateRegion)region
{
    MKMapPoint a = MKMapPointForCoordinate(CLLocationCoordinate2DMake(
                                                                      region.center.latitude + region.span.latitudeDelta / 2,
                                                                      region.center.longitude - region.span.longitudeDelta / 2));
    MKMapPoint b = MKMapPointForCoordinate(CLLocationCoordinate2DMake(
                                                                      region.center.latitude - region.span.latitudeDelta / 2,
                                                                      region.center.longitude + region.span.longitudeDelta / 2));
    return MKMapRectMake(MIN(a.x,b.x), MIN(a.y,b.y), ABS(a.x-b.x), ABS(a.y-b.y));
}



- (void)zoomToShowAnnotationsWhileLockingCenter:(BOOL)lockCenter annotations:(NSArray *)annotations edgeInsets:(UIEdgeInsets)insets extraPaddingMultiplier:(CGFloat)multiplier
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
    
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * (multiplier != 0 ? multiplier : 1.0); // Add a little extra space on the sides
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * (multiplier != 0 ? multiplier : 1.0); // Add a little extra space on the sides
    
    
    if(isnan(region.span.latitudeDelta) || isnan(region.span.longitudeDelta)) {
        return;
    }
    
    //    CGFloat topInsetFactor = insets.top / UIViewGetHeight(self);
    //    region.span.latitudeDelta *= (1.0 + topInsetFactor);
    
    region = [self regionThatFits:region];
    MKMapRect mapRect = [self MKMapRectForCoordinateRegion:region];
    mapRect = [self mapRectThatFits:mapRect edgePadding:insets];
    region = MKCoordinateRegionForMapRect(mapRect);
    if(lockCenter) {
        MKCoordinateSpan deltaFromCentering = MKCoordinateSpanMake(fabs(self.centerCoordinate.latitude - region.center.latitude), fabs(self.centerCoordinate.longitude - region.center.longitude));
        region.center = self.centerCoordinate;
        region.span.latitudeDelta += deltaFromCentering.latitudeDelta * 2.0;
        region.span.longitudeDelta += deltaFromCentering.longitudeDelta * 2.0;
    }
    
    [self setRegion:region animated:YES];
    //    [self setVisibleMapRect:mapRect animated:YES];
}

@end
