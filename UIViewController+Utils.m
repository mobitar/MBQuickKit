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

@end
