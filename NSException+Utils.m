//
//  NSException+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 5/7/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "NSException+Utils.h"

@implementation NSException (Utils)

+ (void)raise:(NSString *)message
{
    [NSException raise:[[NSBundle mainBundle] bundleIdentifier] format:@"%@", message];
}

@end
