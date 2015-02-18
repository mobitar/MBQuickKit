//
//  UIPageViewController+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 2/6/15.
//  Copyright (c) 2015 ParkWhiz. All rights reserved.
//

#import "UIPageViewController+MBQuickKit.h"

@implementation UIPageViewController (MBQuickKit)

- (void)setViewControllers:(NSArray *)viewControllers direction:(UIPageViewControllerNavigationDirection)direction invalidateCache:(BOOL)invalidateCache animated:(BOOL)animated completion:(void (^)(BOOL finished))completion {
    NSArray *vcs = viewControllers;
    __weak UIPageViewController *mySelf = self;
    
    if (invalidateCache && self.transitionStyle == UIPageViewControllerTransitionStyleScroll) {
        UIViewController *neighborViewController = (direction == UIPageViewControllerNavigationDirectionForward
                                                    ? [self.dataSource pageViewController:self viewControllerBeforeViewController:viewControllers[0]]
                                                    : [self.dataSource pageViewController:self viewControllerAfterViewController:viewControllers[0]]);
        [self setViewControllers:@[neighborViewController] direction:direction animated:NO completion:^(BOOL finished) {
            [mySelf setViewControllers:vcs direction:direction animated:animated completion:completion];
        }];
    }
    else {
        [mySelf setViewControllers:vcs direction:direction animated:animated completion:completion];
    }
}


@end
