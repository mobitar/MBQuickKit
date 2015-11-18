//
//  MKMapView+MBQuickKit.h
//  ParkWhiz
//
//  Created by Mo Bitar on 9/29/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (MBQuickKit)

NSString* NSStringFromCLLocationCoordinate2D(CLLocationCoordinate2D coordinate);
BOOL CLLocationCoordinate2DEqual(CLLocationCoordinate2D coordinate1, CLLocationCoordinate2D coordinate2);
CLLocationDistance CLLocationCoordinate2DCalculateDistance(CLLocationCoordinate2D coord1, CLLocationCoordinate2D coord2);

- (BOOL)regionDidChangeFromUserInteraction;


- (CLLocation *)centerLocation;
- (void)zoomToStreetLevelAnimated:(BOOL)animated;
- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate visibleRadius:(CGFloat)meters animated:(BOOL)animated;
- (void)zoomToShowMiles:(CGFloat)miles animated:(BOOL)animated;
- (void)zoomToShowMeters:(CGFloat)meters animated:(BOOL)animated;
- (NSArray *)annotationsExcludingUserLocation;
- (NSArray *)annotationsExcludingUserLocationAndAnnotations:(NSArray *)annotationsToExclude;

- (MKMapRect)MKMapRectForCoordinateRegion:(MKCoordinateRegion)region;

- (void)zoomToShowAnnotationsWhileLockingCenter:(BOOL)lockCenter annotations:(NSArray *)annotations edgeInsets:(UIEdgeInsets)insets extraPaddingMultiplier:(CGFloat)multiplier;
- (void)zoomToShowAnnotations:(NSArray *)annotations edgeInsets:(UIEdgeInsets)insets;
@end
