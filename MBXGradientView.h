//
//  MBXGradientView.h
//  ParkWhiz
//
//  Created by Mo Bitar on 12/7/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBXGradientView : UIView

@property (nonatomic) UIView *overlayView;

/** Default is clearColor */
@property (nonatomic) UIColor *fromColor;

/** Default is blackColor */
@property (nonatomic) UIColor *toColor;

@end
