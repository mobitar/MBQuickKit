//
//  UINavigationBar+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 5/9/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "UINavigationBar+Utils.h"

@implementation UINavigationBar (Utils)

- (void)hideShadow
{
    [[self findHairlineImageViewUnder:self] setHidden:YES];
}

/** 
 From: http://stackoverflow.com/a/19227158/458960
 */
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    
    return nil;
}


@end
