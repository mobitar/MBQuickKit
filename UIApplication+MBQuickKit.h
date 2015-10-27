//
//  UIApplication+MBQuickKit.h
//  ParkWhiz
//
//  Created by Mo Bitar on 12/8/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (MBQuickKit)

- (void)callPhoneNumber:(NSString *)phone;

- (void)openAppStoreToReviewsTabForAppId:(NSString *)appId;

- (NSString *)versionString;

- (void)openAppStoreToApplicationWithName:(NSString *)name;

- (NSString *)appStoreURLForAppName:(NSString *)name;

- (NSString *)appStoreURLForAppID:(NSString *)appID;

- (void)openAppStoreToApplicationWithID:(NSString *)appID;

@end
