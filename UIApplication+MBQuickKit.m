//
//  UIApplication+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 12/8/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "UIApplication+MBQuickKit.h"

@implementation UIApplication (MBQuickKit)

- (void)callPhoneNumber:(NSString *)phone
{
    NSString *phoneNumber = [@"telprompt://" stringByAppendingString:phone];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

@end
