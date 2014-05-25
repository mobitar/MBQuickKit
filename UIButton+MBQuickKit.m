//
//  UIButton+MBQuickKit.m
//  Tanger
//
//  Created by Mo Bitar on 5/19/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "UIButton+MBQuickKit.h"

@implementation UIButton (MBQuickKit)

- (NSString *)normalTitle
{
    return [self titleForState:UIControlStateNormal];
}

- (void)setNormalTitle:(NSString *)normalTitle
{
    [self setTitle:normalTitle forState:UIControlStateNormal];
}

@end
