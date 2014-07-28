//
//  NSError+MBQuickKit.m
//  WordPack
//
//  Created by Mo Bitar on 7/28/14.
//  Copyright (c) 2014 progenius inc. All rights reserved.
//

#import "NSError+MBQuickKit.h"
#import <UIKit/UIKit.h>

@implementation NSError (MBQuickKit)

- (void)showAlert
{
    [[[UIAlertView alloc] initWithTitle:@"Oops" message:self.localizedDescription delegate:nil cancelButtonTitle:NSLocalizedString(@"Ok", nil) otherButtonTitles:nil] show];
}

@end
