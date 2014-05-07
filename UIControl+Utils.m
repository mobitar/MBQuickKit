//
//  UIControl+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 4/29/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "UIControl+Utils.h"

@implementation UIControl (Utils)

- (void)removeAllTargets
{
    [self removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
}

- (void)addTouchUpInsideTarget:(id)target selector:(SEL)selector
{
    [self addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

@end
