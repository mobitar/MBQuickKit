//
//  UITableViewCell+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 10/14/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "UITableViewCell+MBQuickKit.h"

@implementation UITableViewCell (MBQuickKit)

- (void)setSelectedColor:(UIColor *)color
{
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = color;
    self.selectedBackgroundView = bgColorView;
}

@end
