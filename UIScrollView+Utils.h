//
//  UIScrollView+Utils.h
//  Tanger
//
//  Created by Mo Bitar on 4/24/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Utils)

- (void)autoContentSizeHeight;

- (void)autoContentSizeHeightWithOffset:(CGFloat)offset;

- (void)autoContentSizeWidth;

- (void)autoContentSizeWidthWithOffset:(CGFloat)offset;

- (void)autoTopContentInsetForNavigationController:(UINavigationController *)navigationController;

- (void)autoBottomContentInsetForTabBar:(UITabBarController *)tabBarController;

- (void)setTopInset:(CGFloat)topInset;

- (void)setBottomInset:(CGFloat)bottomInset;

- (void)scrollToBottomAnimated:(BOOL)animated;

@end
