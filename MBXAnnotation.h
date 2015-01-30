//
//  PWAnnotation.h
//  ParkWhiz
//
//  Created by Mo Bitar on 10/20/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBXAnnotation : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

@end
