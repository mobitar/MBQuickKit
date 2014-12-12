//
//  UIFont+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 12/9/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

CGFloat const MBXBaseScreenWidth = 414; // 6 Plus width

#import "UIFont+MBQuickKit.h"

@implementation UIFont (MBQuickKit)

+ (UIFont *)ultraLightHelveticaNeueFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:size];
}

+ (UIFont *)lightHelveticaNeueFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

+ (UIFont *)helveticaNeueFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

- (instancetype)sameFontAdaptedForScreenWidth:(CGFloat)screenWidth baseScreenWidth:(CGFloat)baseScreenWidth
{
    CGFloat factor = (baseScreenWidth - screenWidth)/baseScreenWidth;
    // subtract a point for every tenth
    CGFloat pointOffset = (factor * 10);

    UIFont *newFont = [UIFont fontWithName:self.fontName size:self.pointSize - pointOffset];
//    NSLog(@"baseFont:%f newFont:%f", self.pointSize, newFont.pointSize);
    return newFont;
}

@end
