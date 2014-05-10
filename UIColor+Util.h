//
//  UIColor+Util.h
//  Diveo
//
//  Created by Mo Bitar on 4/10/14.
//  Copyright (c) 2014 progenius. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+ (UIColor*)randomColor;
- (UIColor *)colorWithHueOffset:(CGFloat)hueOffset;
- (UIColor *)colorWithSaturationOffset:(CGFloat)saturationOffset;
- (UIColor *)colorWithBrightnessOffset:(CGFloat)brightnessOffset;
@end
