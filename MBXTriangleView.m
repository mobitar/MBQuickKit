//
//  MBXTriangleView.m
//  ParkWhiz
//
//  Created by Mo Bitar on 3/26/15.
//  Copyright (c) 2015 ParkWhiz. All rights reserved.
//

#import "MBXTriangleView.h"

@implementation MBXTriangleView

- (void)drawRect:(CGRect)rect
{
    UIBezierPath* polygonPath = UIBezierPath.bezierPath;
    [polygonPath moveToPoint: CGPointMake(UIViewGetWidth(self)/2.0, UIViewGetHeight(self))];
    [polygonPath addLineToPoint: CGPointMake(UIViewGetWidth(self), 0)];
    [polygonPath addLineToPoint: CGPointMake(0, 0)];
    [polygonPath closePath];
    [self.color setFill];
    [polygonPath fill];
}

@end
