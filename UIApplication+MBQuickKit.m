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

- (void)openAppStoreToReviewsTabForAppId:(NSString *)appId
{
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8", appId];
    [self openURL:[NSURL URLWithString:url]];
}

@end
