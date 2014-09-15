//
//  UIView+Utils.h
//  Tanger
//
//  Created by Mo Bitar on 4/23/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

CGFloat UIViewGetHeight(UIView *view);
CGFloat UIViewGetWidth(UIView *view);
CGFloat UIViewGetMaxY(UIView *view);
CGFloat UIViewGetMaxX(UIView *view);
CGFloat UIViewGetMinY(UIView *view);
CGFloat UIViewGetMinX(UIView *view);

@interface UIView (Utils)

- (CGFloat)width;
- (CGFloat)height;
- (CGSize)size;

- (void)trailVerticallyTo:(UIView *)view;
- (void)trailVerticallyTo:(UIView *)view withOffset:(CGFloat)offset;
- (void)trailVerticallyTo:(UIView *)view andFitInView:(UIView *)fitInView;

- (void)shiftBy:(CGPoint)shift;

- (void)alignLeftInSuperview;
- (void)alignRightInSuperview;
- (void)alignTopToView:(UIView *)toView;
- (void)alignLeftEdgeTo:(UIView*)view;
- (void)alignRightEdgeTo:(UIView*)view;
- (void)alignCenterYTo:(UIView*)view;

- (void)centerVerticallyInView:(UIView *)view;
- (void)centerHorizontallyInView:(UIView *)view;
- (void)centerHorizontallyInSuperview;
- (void)centerInSuperview;
- (void)centerVerticallyInSuperview;
- (void)centerVerticallyInSuperviewWithOffset:(CGFloat)offset;
- (void)centerSubviewsVertically:(NSArray *)subviews offsetPerView:(NSArray *)spacing;
- (void)centerSubviewsHorizontally:(NSArray *)subviews offsetPerView:(NSArray *)spacing;

- (void)setOrigin:(CGPoint)origin;
- (void)setXOrigin:(CGFloat)x;
- (void)setYOrigin:(CGFloat)y;

- (void)setSize:(CGSize)size;
- (void)setHeight:(CGFloat)height;
- (void)setWidth:(CGFloat)width;
- (void)sizeEqualToSuperview;

- (void)autoFitBetween:(UIView *)top andView:(UIView *)bottom;
- (void)autoFitBetween:(UIView *)top andView:(UIView *)bottom offset:(CGFloat)offset;

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

#pragma mark - Misc

- (void)makeCircular;
- (UIView *)nextResponderBySearchingSuperviewHeirarchyVertically;

@end
