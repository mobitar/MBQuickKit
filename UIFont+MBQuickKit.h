//
//  UIFont+MBQuickKit.h
//  ParkWhiz
//
//  Created by Mo Bitar on 12/9/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (MBQuickKit)

+ (UIFont *)ultraLightHelveticaNeueFontOfSize:(CGFloat)size;
+ (UIFont *)lightHelveticaNeueFontOfSize:(CGFloat)size;
+ (UIFont *)helveticaNeueFontOfSize:(CGFloat)size;

/** Given a font size that looks well on a big screen, this method shrinks the font so that it looks better on a smaller screen */
- (instancetype)sameFontAdaptedForScreenWidth:(CGFloat)screenWidth baseScreenWidth:(CGFloat)baseScreenWidth;

@end
