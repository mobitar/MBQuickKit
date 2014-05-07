//
//  UIScrollView+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 4/24/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "UIScrollView+Utils.h"

@implementation UIScrollView (Utils)

- (void)autoContentSizeHeight
{
    [self autoContentSizeHeightWithOffset:0];
}

- (void)autoContentSizeHeightWithOffset:(CGFloat)offset
{
    CGFloat maxY = 0;
    for(UIView *view in self.subviews) {
        maxY = MAX(maxY, CGRectGetMaxY(view.frame));
    }
    
    self.contentSize = CGSizeMake(self.contentSize.width, maxY + offset);
}

- (void)autoBottomContentInsetForTabBar:(UITabBarController *)tabBarController
{
    NSAssert(tabBarController, @"Tab bar controller should not be nil");
    UIEdgeInsets insets = self.contentInset;
    insets.bottom = CGRectGetHeight(tabBarController.tabBar.frame);
    self.contentInset = insets;
}

- (void)autoTopContentInsetForNavigationController:(UINavigationController *)navigationController
{
    NSAssert(navigationController, @"Tab bar controller should not be nil");
    UIEdgeInsets insets = self.contentInset;
    insets.top = CGRectGetMaxY(navigationController.navigationBar.frame);
    self.contentInset = insets;
}

- (void)setTopInset:(CGFloat)topInset
{
    UIEdgeInsets insets = self.contentInset;
    insets.top = topInset;
    self.contentInset = insets;
}

- (void)setBottomInset:(CGFloat)bottomInset
{
    UIEdgeInsets insets = self.contentInset;
    insets.bottom = bottomInset;
    self.contentInset = insets;
}

- (void)scrollToBottomAnimated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.contentOffset.x, self.contentSize.height - self.bounds.size.height + self.contentInset.bottom) animated:animated];
}

@end
