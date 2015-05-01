//
//  UIAlertView+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 4/14/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "UIAlertView+Utils.h"

@implementation UIAlertView (Utils)

+ (void)showAlertWithTitle:(NSString *)title text:(NSString *)text
{
#ifndef WATCHKIT
    [[[UIAlertView alloc] initWithTitle:title message:text delegate:nil cancelButtonTitle:NSLocalizedString(@"Ok", nil) otherButtonTitles:nil] show];
#endif
}

@end
