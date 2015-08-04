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
- (void)scrollToBottomWithAnimationDuration:(CGFloat)duration;

- (void)sizeEqualToContent;

- (NSInteger)currentPageHorizontally;
- (NSInteger)currentPageVertically;
- (void)proceedToNextPageVerticallyAnimated:(BOOL)animated;
- (void)proceedToNextPageHorizontallyAnimated:(BOOL)animated;
- (void)proceedToPreviousPageVerticallyAnimated:(BOOL)animated;
- (void)proceedToPreviousPageHorizontallyAnimated:(BOOL)animated;
- (void)proceedToPageHorizontally:(NSInteger)page animated:(BOOL)animated;
- (void)proceedToPageVertically:(NSInteger)page animated:(BOOL)animated;
- (CGFloat)verticalOffsetForBottom;
- (BOOL)isAtTop;
- (BOOL)isAtBottom;
@end
