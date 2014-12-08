//
//  UIBarButtonItem+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 10/16/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "UIBarButtonItem+MBQuickKit.h"

@implementation UIBarButtonItem (MBQuickKit)

+ (instancetype)activityIndicatorItemWithColor:(UIColor *)color
{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicator startAnimating];
    indicator.tintColor = color;
    indicator.color = color;
    return [[UIBarButtonItem alloc] initWithCustomView:indicator];
}

@end
