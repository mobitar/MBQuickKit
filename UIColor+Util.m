//
//  UIColor+Util.m
//  Diveo
//
//  Created by Mo Bitar on 4/10/14.
//  Copyright (c) 2014 progenius. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

#define rand_val (float)(arc4random() % 255) / 255.0

+ (UIColor*)randomColor
{
    return [UIColor colorWithRed:rand_val green:rand_val blue:rand_val alpha:1.0];
}

- (UIColor *)colorWithHueOffset:(CGFloat)hueOffset
{
    UIColor *newColor = nil;
    CGFloat hue, saturation, brightness, alpha;
    if ([self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha])
    {
        // We wants the hue value to be between 0 - 1 after appending the offset
        CGFloat newHue = fmodf((hue + hueOffset), 1);
        newColor = [UIColor colorWithHue:newHue saturation:saturation brightness:brightness alpha:alpha];
        
    }
    return newColor;
}

- (UIColor *)colorWithSaturationOffset:(CGFloat)saturationOffset
{
    UIColor *newColor = nil;
    CGFloat hue, saturation, brightness, alpha;
    if ([self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha])
    {
        // We wants the hue value to be between 0 - 1 after appending the offset
        CGFloat newSaturation = fmodf((saturation + saturationOffset), 1);
        newColor = [UIColor colorWithHue:hue saturation:newSaturation brightness:brightness alpha:alpha];
    }
    return newColor;
}

- (UIColor *)colorWithBrightnessOffset:(CGFloat)brightnessOffset
{
    UIColor *newColor = nil;
    CGFloat hue, saturation, brightness, alpha;
    if ([self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha])
    {
        // We wants the hue value to be between 0 - 1 after appending the offset
        CGFloat newBrightness = MIN((brightness + brightnessOffset), 1);
        newColor = [UIColor colorWithHue:hue saturation:saturation brightness:newBrightness alpha:alpha];
    }
    return newColor;
}

+ (UIColor *)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
