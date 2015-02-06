//
//  UIScrollView+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 4/24/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "UIScrollView+Utils.h"

@implementation UIScrollView (Utils)

- (void)sizeEqualToContent
{
    self.size = self.contentSize;
}

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

- (void)autoContentSizeWidth
{
    [self autoContentSizeWidthWithOffset:0];
}

- (void)autoContentSizeWidthWithOffset:(CGFloat)offset
{
    CGFloat maxX = 0;
    for(UIView *view in self.subviews) {
        maxX = MAX(maxX, CGRectGetMaxX(view.frame));
    }
    
    self.contentSize = CGSizeMake(maxX + offset, self.contentSize.height);
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
    [self setContentOffset:CGPointMake(self.contentOffset.x, [self verticalOffsetForBottom]) animated:animated];
}

- (NSInteger)currentPageHorizontally
{
    return self.contentOffset.x / self.bounds.size.width;
}

- (NSInteger)currentPageVertically
{
    return self.contentOffset.y / self.bounds.size.height;
}

- (void)proceedToNextPageVerticallyAnimated:(BOOL)animated
{
   [self proceedToPageVertically:[self currentPageVertically] + 1 animated:animated];
}

- (void)proceedToNextPageHorizontallyAnimated:(BOOL)animated
{
    [self proceedToPageHorizontally:[self currentPageHorizontally] + 1 animated:animated];
}

- (void)proceedToPreviousPageVerticallyAnimated:(BOOL)animated
{
    [self proceedToPageVertically:[self currentPageVertically] - 1 animated:animated];
}

- (void)proceedToPreviousPageHorizontallyAnimated:(BOOL)animated
{
    [self proceedToPageHorizontally:[self currentPageHorizontally] - 1 animated:animated];
}

- (void)proceedToPageHorizontally:(NSInteger)page animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(page * self.bounds.size.width, self.contentOffset.y) animated:animated];
}

- (void)proceedToPageVertically:(NSInteger)page animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.contentOffset.x, page * self.bounds.size.height) animated:animated];
}

- (BOOL)isAtTop
{
    return (self.contentOffset.y <= [self verticalOffsetForTop]);
}

- (BOOL)isAtBottom
{
    return (self.contentOffset.y >= [self verticalOffsetForBottom]);
}

- (CGFloat)verticalOffsetForTop
{
    CGFloat topInset = self.contentInset.top;
    return -topInset;
}

- (CGFloat)verticalOffsetForBottom
{
    CGFloat scrollViewHeight = self.bounds.size.height;
    CGFloat scrollContentSizeHeight = self.contentSize.height;
    CGFloat bottomInset = self.contentInset.bottom;
    CGFloat scrollViewBottomOffset = scrollContentSizeHeight + bottomInset - scrollViewHeight;
    return scrollViewBottomOffset;
}



@end
