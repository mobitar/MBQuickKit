//
//  UIWindow+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 3/30/15.
//  Copyright (c) 2015 ParkWhiz. All rights reserved.
//

#import "UIWindow+MBQuickKit.h"

@implementation UIWindow (MBQuickKit)

- (UIViewController *)topMostController
{
    UIViewController *topController = self.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}

@end
