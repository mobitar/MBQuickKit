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

- (void)zoomToStreetLevel;
- (CLLocation *)centerLocation;
- (void)zoomToShowMiles:(CGFloat)miles;
- (void)zoomToShowMeters:(CGFloat)meters;
- (NSArray *)annotationsExcludingUserLocation;

- (void)zoomToShowAnnotations:(NSArray *)annotations paddingMultiplier:(CGFloat)multipler;
- (void)zoomToShowAnnotationsWhileLockingCenter:(NSArray *)annotations paddingMultiplier:(CGFloat)multipler;
- (void)zoomToShowAnnotationsWhileLockingCenter:(BOOL)lockCenter annotations:(NSArray *)annotations edgeInsets:(UIEdgeInsets)insets extraPaddingMultiplier:(CGFloat)multiplier;
@end
