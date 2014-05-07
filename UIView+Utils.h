//
//  UIView+Utils.h
//  Tanger
//
//  Created by Mo Bitar on 4/23/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)

- (void)trailVerticallyTo:(UIView *)view;

- (void)trailVerticallyTo:(UIView *)view withOffset:(CGFloat)offset;

- (void)trailVerticallyTo:(UIView *)view andFitInView:(UIView *)fitInView;

- (void)shiftBy:(CGPoint)shift;

- (void)centerVerticallyInView:(UIView *)view;

- (void)centerHorizontallyInView:(UIView *)view;

- (void)centerHorizontallyInSuperview;

- (void)centerVerticallyInSuperview;

- (void)centerSubviewsVertically:(NSArray *)subviews offsetPerView:(NSArray *)spacing;

- (void)setOrigin:(CGPoint)origin;

- (void)setSize:(CGSize)size;

- (void)setHeight:(CGFloat)height;

- (void)setWidth:(CGFloat)width;

- (void)sizeEqualToSuperview;

- (void)autoFitBetween:(UIView *)top and:(UIView *)bottom;

- (void)autoFitBetween:(UIView *)top and:(UIView *)bottom offset:(CGFloat)offset;

- (void)moveToBottomOfSuperview;

- (void)moveToBottomOfView:(UIView *)view;

- (void)moveToBottomOfView:(UIView *)view withOffset:(CGFloat)offset;

- (void)moveToRightOfSuperviewWithOffset:(CGFloat)offset;

- (void)moveToRightOfSuperview;

- (void)moveToRightOfView:(UIView *)view offset:(CGFloat)offset;

+ (id)viewFromNibNamed:(NSString*)name;

+ (instancetype)loadFromNIB;

- (UIView *)firstSuperviewMatchingClasss:(Class)aClass;

#pragma mark - Animations

- (void)addSubviewWithFadeAnimation:(UIView *)view;

- (void)removeFromSuperviewWithFadeAnimation;

@end
