//
//  UIBarButtonItem+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 10/16/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "UIBarButtonItem+MBQuickKit.h"

@implementation UIBarButtonItem (MBQuickKit)

+ (instancetype)activityIndicatorItem
{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicator startAnimating];
    indicator.tintColor = [UIColor whiteColor];
    indicator.color = [UIColor whiteColor];
    return [[UIBarButtonItem alloc] initWithCustomView:indicator];
}

@end
