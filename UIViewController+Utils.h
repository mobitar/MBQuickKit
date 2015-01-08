//
//  UIViewController+Utils.h
//  Tanger
//
//  Created by Mo Bitar on 4/24/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Utils)

- (UITabBarController *)nearestTabBarController;

- (void)presentViewControllerInNavigationController:(UIViewController *)viewControllerToPresent;

- (void)presentViewControllerAnimated:(UIViewController *)viewControllerToPresent;

- (BOOL)isModal;

/** See http://stackoverflow.com/questions/19091737/ios-7-table-view-fail-to-auto-adjust-content-inset for purpose of this method*/
- (void)autoAdjustScrollViewContentInsetForScrollView:(UIScrollView *)scrollView;

@end
