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
CGFloat UIViewGetMidX(UIView *view);
CGFloat UIViewGetMidY(UIView *view);

@interface UIView (Utils)

- (CGFloat)width;
- (CGFloat)height;
- (CGSize)size;

- (void)trailVerticallyTo:(UIView *)view;
- (void)trailVerticallyTo:(UIView *)view withOffset:(CGFloat)offset;
- (void)trailVerticallyTo:(UIView *)view andFitInView:(UIView *)fitInView;
- (void)trailHorizontallyTo:(UIView *)view withOffset:(CGFloat)offset;

- (void)leadVerticallyTo:(UIView *)view;
- (void)leadVerticallyTo:(UIView *)view withOffset:(CGFloat)offset;

- (void)leadHorizontallyTo:(UIView *)view;
- (void)leadHorizontallyTo:(UIView *)view withOffset:(CGFloat)offset;

- (void)shiftBy:(CGPoint)shift;
- (void)shiftHorizontallyBy:(CGFloat)offset;
- (void)shiftVerticallyBy:(CGFloat)offset;
- (void)shiftSubviewsTrailingVerticallyToView:(UIView *)view by:(CGPoint)offset;
- (void)shiftSubviewsTrailingVerticallyToView:(UIView *)view by:(CGPoint)offset excludingViews:(NSArray *)skipViews;

- (void)alignLeftInSuperview;
- (void)alignRightInSuperview;
- (void)alignTopToView:(UIView *)toView;
- (void)alignTopToView:(UIView *)toView withOffset:(CGFloat)offset;
- (void)alignLeftEdgeTo:(UIView*)view;
- (void)alignLeftEdgeTo:(UIView*)view withOffset:(CGFloat)offset;
- (void)alignRightEdgeTo:(UIView*)view;
- (void)alignCenterYTo:(UIView*)view;
- (void)alignRightInSuperviewWithOffset:(CGFloat)offset;
- (void)alignBottomEdgeToView:(UIView*)view offset:(CGFloat)offset;

- (void)centerVerticallyInView:(UIView *)view;
- (void)centerHorizontallyInView:(UIView *)view;
- (void)centerHorizontallyInSuperview;
- (void)centerHorizontallyInView:(UIView *)view withOffset:(CGFloat)offset;
- (void)centerHorizontallyWithRespectToView:(UIView *)wrtView;
- (void)centerHorizontallyWithRespectToView:(UIView *)wrtView withOffset:(CGFloat)offset;
- (void)centerHorizontallyInRect:(CGRect)rect;
- (void)centerHorizontallyBetweenView:(UIView *)leftView andView:(UIView *)rightView;
- (void)centerInSuperview;
- (void)centerInRect:(CGRect)rect;
- (void)centerWithRespectToView:(UIView *)view;
- (void)centerVerticallyInSuperview;
- (void)centerVerticallyInSuperviewWithOffset:(CGFloat)offset;
- (void)centerVerticallyWithRespectToView:(UIView *)wrtView withOffset:(CGFloat)offset;
- (void)centerVerticallyBetweenView:(UIView *)topView andView:(UIView *)bottomView;
- (void)centerVerticallyInRect:(CGRect)rect;
- (void)centerSubviewsVertically:(NSArray *)subviews offsetPerView:(NSArray *)spacing;
- (void)centerSubviewsVertically:(NSArray *)subviews offsetPerView:(NSArray *)spacing inRect:(CGRect)rect;
- (void)centerSubviewsHorizontally:(NSArray *)subviews offsetPerView:(NSArray *)spacing;
- (void)centerSubviewsHorizontally:(NSArray *)subviews offsetPerView:(NSArray *)spacing inRect:(CGRect)rect;

- (void)sizeToFitWhileMaintainingWidth;

- (void)setOrigin:(CGPoint)origin;
- (void)setXOrigin:(CGFloat)x;
- (void)setYOrigin:(CGFloat)y;

- (void)setSize:(CGSize)size;
- (void)setHeight:(CGFloat)height;
- (void)setHeightEqualToSuperview;
- (void)setWidth:(CGFloat)width;
- (void)setHeightEqualToSuperviewWithOffset:(CGFloat)offset;
- (void)sizeWidthFullScreen;
- (void)sizeWidthEqualToSuperview;
- (void)stretchWidthToReachPoint:(CGFloat)x;
- (void)sizeWidthEqualToSuperviewWithOffset:(CGFloat)offset;
- (void)sizeEqualToSuperviewWithOffset:(CGSize)offset;
- (void)sizeWidthEqualToView:(UIView *)view;
- (void)sizeEqualToSuperview;
- (void)stretchWidthToReachBeginningOfSiblingView:(UIView *)view offset:(CGFloat)offset;
- (void)stretchWidthToEndOfSuperviewWithOffset:(CGFloat)offset;
- (void)stretchWidthToReachEndOfSiblingView:(UIView *)siblingView offset:(CGFloat)offset;
- (void)stretchWidthToEndOfSuperview;
- (void)offsetSizeBy:(CGSize)offset;
- (BOOL)isOutOfSuperviewBoundsHorizontally;

- (void)stretchHeightToReachBottomOfSuperview;
- (void)stretchHeightToReachTopOfView:(UIView *)view;
- (void)stretchHeightToReachTopOfView:(UIView *)view withOffset:(CGFloat)offset;
- (void)stretchHeightToReachBottomOfView:(UIView *)view;
- (void)stretchHeightToReachBottomOfSuperviewWithOffset:(CGFloat)offset;

- (void)autoFitBetween:(UIView *)top andView:(UIView *)bottom;
- (void)autoFitBetween:(UIView *)top andView:(UIView *)bottom offset:(CGFloat)offset;

- (void)moveToBottomOfSuperview;
- (void)moveToBottomOfSuperviewWithOffset:(CGFloat)offset;
- (void)moveToBottomOfView:(UIView *)view;
- (void)moveToBottomOfView:(UIView *)view withOffset:(CGFloat)offset;
- (void)moveToRightOfSuperviewWithOffset:(CGFloat)offset;
- (void)moveToRightOfSuperview;
- (void)moveToRightOfView:(UIView *)view offset:(CGFloat)offset;

- (void)bringToFront;
- (void)sendToBack;
- (void)printFrame;
//- (void)printRecursiveDescription;

- (CGRect)frameInBetweenVerticalView:(UIView *)topView andView:(UIView *)bottomView;

+ (id)viewFromNibNamed:(NSString*)name;
+ (instancetype)loadFromNIB;

- (UIView *)firstSuperviewMatchingClasss:(Class)aClass;

#pragma mark - Animations

- (void)addSubviewWithFadeAnimation:(UIView *)view;
- (void)removeFromSuperviewWithFadeAnimation;
- (void)layoutAnimatedWithDuration:(CGFloat)duration completion:(void(^)())completion;

#pragma mark - Misc

- (void)makeCircular;
- (void)addShadow;
- (UIView *)nextResponderBySearchingSuperviewHeirarchyVertically;


@end
