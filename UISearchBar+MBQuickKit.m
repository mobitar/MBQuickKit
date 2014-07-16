//
//  UISearchBar+MBQuickKit.m
//  Freebie
//
//  Created by Mo Bitar on 7/16/14.
//  Copyright (c) 2014 Freebie. All rights reserved.
//

#import "UISearchBar+MBQuickKit.h"

@implementation UISearchBar (MBQuickKit)

- (void)setTextColor:(UIColor *)textColor
{
    UITextField *searchField = [self valueForKey:@"_searchField"];
    searchField.textColor = textColor;
}

@end
