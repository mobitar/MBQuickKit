//
//  UIPageViewController+MBQuickKit.h
//  ParkWhiz
//
//  Created by Mo Bitar on 2/6/15.
//  Copyright (c) 2015 ParkWhiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPageViewController (MBQuickKit)
/** See http://stackoverflow.com/a/14863241/458960 for reason */
- (void)setViewControllers:(NSArray *)viewControllers direction:(UIPageViewControllerNavigationDirection)direction invalidateCache:(BOOL)invalidateCache animated:(BOOL)animated completion:(void (^)(BOOL finished))completion;
@end
