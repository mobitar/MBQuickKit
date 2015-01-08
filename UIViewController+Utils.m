//
//  UIViewController+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 4/24/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "UIViewController+Utils.h"

@implementation UIViewController (Utils)

- (UITabBarController *)nearestTabBarController
{
    UITabBarController *tabBarController = [self nearestTabBarControllerFromViewController:self];
    NSAssert(tabBarController, @"Should not be nil");
    return tabBarController;
}

- (UITabBarController *)nearestTabBarControllerFromViewController:(UIViewController *)controller
{
    if(controller.tabBarController) {
        return controller.tabBarController;
    }
    
    UIViewController *superController = (id)[controller.view.superview nextResponder];
    if(!superController) {
        return nil;
    }
    
    return [self nearestTabBarControllerFromViewController:superController];
}

- (void)presentViewControllerInNavigationController:(UIViewController *)viewControllerToPresent
{
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:viewControllerToPresent] animated:YES completion:nil];
}

- (void)presentViewControllerAnimated:(UIViewController *)viewControllerToPresent
{
    [self presentViewController:viewControllerToPresent animated:YES completion:nil];
}

- (BOOL)isModal
{
    return self.navigationController.viewControllers.firstObject == self;
}

- (void)autoAdjustScrollViewContentInsetForScrollView:(UIScrollView *)scrollView
{
    if ([self respondsToSelector:@selector(topLayoutGuide)]) {
        UIEdgeInsets currentInsets = scrollView.contentInset;
        scrollView.contentInset = (UIEdgeInsets){
            .top = self.topLayoutGuide.length,
            .bottom = currentInsets.bottom,
            .left = currentInsets.left,
            .right = currentInsets.right
        };
    }

}

@end
