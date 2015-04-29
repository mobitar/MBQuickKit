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



- (void)zoomToShowAnnotations:(NSArray *)annotations edgeInsets:(UIEdgeInsets)insets
{
    MKMapRect currentMapRect = [self visibleMapRect];
    
    MKMapRect mapRect = MKMapRectNull;
    
    for (id<MKAnnotation> annotation in annotations) {
        MKMapPoint p = MKMapPointForCoordinate([annotation coordinate]);
        mapRect = MKMapRectUnion(mapRect, MKMapRectMake(p.x, p.y, 0, 0));
    }
    
    mapRect.size.width = currentMapRect.size.width;
    mapRect.origin.x = currentMapRect.origin.x;
    
    [self setVisibleMapRect:mapRect edgePadding:insets animated:YES];
}

@end
