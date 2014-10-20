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

- (void)zoomToStreetLevel;

@end
