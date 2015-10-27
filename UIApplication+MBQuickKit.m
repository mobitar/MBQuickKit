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

- (NSString *)versionString
{
    NSString *version = (__bridge id)CFBundleGetValueForInfoDictionaryKey(CFBundleGetMainBundle(), kCFBundleVersionKey) ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
    NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"V%@.%@", appVersion, version];
}

- (NSString *)appStoreURLForAppName:(NSString *)name
{
    return [NSString stringWithFormat:@"http://itunes.com/apps/%@", [name lowercaseString]];
}

- (NSString *)appStoreURLForAppID:(NSString *)appID
{
    return [NSString stringWithFormat:@"http://itunes.apple.com/app/id%@", appID];
}

- (void)openAppStoreToApplicationWithID:(NSString *)appID
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self appStoreURLForAppID:appID]]];
}

- (void)openAppStoreToApplicationWithName:(NSString *)name
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self appStoreURLForAppName:name]]];
}

@end
