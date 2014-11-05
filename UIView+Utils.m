    //
//  UIView+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 4/23/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "UIView+Utils.h"
#import "NSArray+Utils.h"

CGFloat UIViewGetHeight(UIView *view) { return CGRectGetHeight(view.frame); }
CGFloat UIViewGetWidth(UIView *view)  { return CGRectGetWidth(view.frame); }
CGFloat UIViewGetMaxY(UIView *view)   { return CGRectGetMaxY(view.frame); }
CGFloat UIViewGetMaxX(UIView *view)   { return CGRectGetMaxX(view.frame); }
CGFloat UIViewGetMinY(UIView *view)   { return CGRectGetMinY(view.frame); }
CGFloat UIViewGetMinX(UIView *view)   { return CGRectGetMinX(view.frame); }

@implementation UIView (Utils)

- (CGFloat)width
{
    return UIViewGetWidth(self);
}

- (CGFloat)height
{
    return UIViewGetHeight(self);
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)trailVerticallyTo:(UIView *)view
{
    [self trailVerticallyTo:view withOffset:0];
}

- (void)trailVerticallyTo:(UIView *)view withOffset:(CGFloat)offset
{
    CGRect frame = self.frame;
    frame.origin.y = CGRectGetMaxY(view.frame) + offset;
    self.frame = frame;
}

- (void)trailHorizontallyTo:(UIView *)view withOffset:(CGFloat)offset
{
    CGRect frame = self.frame;
    frame.origin.x = CGRectGetMaxX(view.frame) + offset;
    self.frame = frame;
}

- (void)trailVerticallyTo:(UIView *)view andFitInView:(UIView *)fitInView
{
    CGRect frame = self.frame;
    frame.origin.y = CGRectGetMaxY(view.frame);
    frame.size.height = CGRectGetHeight(fitInView.frame) - frame.origin.y;
    self.frame = frame;
}

- (void)leadVerticallyTo:(UIView *)view
{
    [self leadVerticallyTo:view withOffset:0];
}

- (void)leadVerticallyTo:(UIView *)view withOffset:(CGFloat)offset
{
    CGRect frame = self.frame;
    frame.origin.y = CGRectGetMinY(view.frame) - UIViewGetHeight(self) + offset;
    self.frame = frame;
}

- (void)leadHorizontallyTo:(UIView *)view
{
    [self leadHorizontallyTo:view withOffset:0];
}

- (void)leadHorizontallyTo:(UIView *)view withOffset:(CGFloat)offset
{
    CGRect frame = self.frame;
    frame.origin.x = CGRectGetMinX(view.frame) - UIViewGetWidth(self) + offset;
    self.frame = frame;
}

- (void)shiftBy:(CGPoint)shift
{
    CGRect frame = self.frame;
    frame.origin.x += shift.x;
    frame.origin.y += shift.y;
    self.frame = frame;
}

- (void)shiftHorizontallyBy:(CGFloat)offset
{
    [self shiftBy:CGPointMake(offset, 0)];
}

- (void)shiftVerticallyBy:(CGFloat)offset
{
    [self shiftBy:CGPointMake(0, offset)];
}

- (void)shiftSubviewsTrailingVerticallyToView:(UIView *)view by:(CGPoint)offset
{
    [self shiftSubviewsTrailingVerticallyToView:view by:offset excludingViews:nil];
}

- (void)shiftSubviewsTrailingVerticallyToView:(UIView *)view by:(CGPoint)offset excludingViews:(NSArray *)skipViews
{
    CGFloat minY = UIViewGetMaxY(view);
    for(UIView *subview in self.subviews) {
        if([skipViews containsObject:subview]) {
            continue;
        }
        
        if(UIViewGetMinY(subview) >= minY) {
            [subview shiftBy:offset];
        }
    }
}

- (void)centerHorizontallyInView:(UIView *)view
{
    CGRect frame = self.frame;
    frame.origin.x = CGRectGetWidth(view.frame)/2.0 - CGRectGetWidth(frame)/2.0;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)alignLeftInSuperview
{
    NSAssert(self.superview, nil);
    
    [self setXOrigin:0];
}

- (void)alignRightInSuperview
{
    [self alignRightInSuperviewWithOffset:0];
}

- (void)alignRightInSuperviewWithOffset:(CGFloat)offset
{
    NSAssert(self.superview, nil);
    
    [self setXOrigin:UIViewGetWidth(self.superview) - UIViewGetWidth(self) + offset];
}

- (void)alignTopToView:(UIView *)toView
{
    [self alignTopToView:toView withOffset:0];
}

- (void)alignTopToView:(UIView *)toView withOffset:(CGFloat)offset
{
    [self setYOrigin:UIViewGetMinY(toView) + offset];
}

- (void)alignLeftEdgeTo:(UIView*)view
{
    [self setXOrigin:view.frame.origin.x];
}

- (void)alignCenterYTo:(UIView*)view
{
    [self setYOrigin:UIViewGetMinY(view) + (UIViewGetHeight(view)/2.0 - UIViewGetHeight(self)/2.0)];
}

- (void)alignRightEdgeTo:(UIView*)view
{
    [self setXOrigin:UIViewGetMaxX(view) - UIViewGetWidth(self)];
}

- (void)centerInSuperview
{
    [self centerHorizontallyInView:self.superview];
    [self centerVerticallyInView:self.superview];
}

- (void)centerHorizontallyInSuperview
{
    NSAssert(self.superview, nil);
    
    [self centerHorizontallyInView:self.superview];
}

- (void)centerVerticallyInView:(UIView *)view
{
    [self centerVerticallyInRect:view.bounds];
}

- (void)centerVerticallyInRect:(CGRect)rect
{
    CGRect frame = self.frame;
    frame.origin.y = rect.origin.y + CGRectGetHeight(rect)/2.0 - CGRectGetHeight(frame)/2.0;
    self.frame = frame;
}

- (void)centerVerticallyWithRespectToView:(UIView *)wrtView withOffset:(CGFloat)offset
{
    CGRect frame = self.frame;
    frame.origin.y = offset + UIViewGetMinY(wrtView) + CGRectGetHeight(wrtView.frame)/2.0 - CGRectGetHeight(frame)/2.0;
    self.frame = frame;
}

- (void)centerHorizontallyWithRespectToView:(UIView *)wrtView withOffset:(CGFloat)offset
{
    CGRect frame = self.frame;
    frame.origin.x = offset + UIViewGetMinX(wrtView) + CGRectGetWidth(wrtView.frame)/2.0 - CGRectGetWidth(frame)/2.0;
    self.frame = frame;
}

- (void)centerVerticallyInSuperviewWithOffset:(CGFloat)offset
{
    NSAssert(self.superview, @"Superview cannot be nil");
    
    [self centerVerticallyInView:self.superview];
    
    [self shiftBy:CGPointMake(0, offset)];
}

- (void)centerVerticallyInSuperview
{
    NSAssert(self.superview, @"Superview cannot be nil");
    
    [self centerVerticallyInView:self.superview];
}

- (void)centerSubviewsVertically:(NSArray *)subviews offsetPerView:(NSArray *)spacing
{
    [self centerSubviewsVertically:subviews offsetPerView:spacing inRect:self.bounds];
}

- (void)centerSubviewsVertically:(NSArray *)subviews offsetPerView:(NSArray *)spacing inRect:(CGRect)rect
{
    if(spacing.count) {
        NSAssert(subviews.count == spacing.count, @"Subviews and spacing arrays should match in count");
    }
    
    __block CGFloat totalHeight = 0;
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        NSNumber *offset = spacing[idx];
        totalHeight += CGRectGetHeight(view.frame) + offset.floatValue;
    }];
    
    __block CGFloat currentY = rect.origin.y + CGRectGetHeight(rect)/2.0 - totalHeight/2.0;
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        NSNumber *offset = spacing[idx];
        [view setYOrigin:offset.floatValue + currentY];
        currentY = CGRectGetMaxY(view.frame);
    }];
}

- (void)centerSubviewsHorizontally:(NSArray *)subviews offsetPerView:(NSArray *)spacing
{
    if(spacing.count) {
        NSAssert(spacing.count == subviews.count, @"Subviews and spacing arrays should match in count");
    }
    
    __block CGFloat totalWidth = 0;
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        NSNumber *offset = [spacing safeObjectAtIndex:idx];
        totalWidth += CGRectGetWidth(view.frame) + offset.floatValue;
    }];
    
    __block CGFloat currentX = CGRectGetWidth(self.frame)/2.0 - totalWidth/2.0;
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        NSNumber *offset = [spacing safeObjectAtIndex:idx];
        [view setXOrigin:offset.floatValue + currentX];
        currentX = CGRectGetMaxX(view.frame);
    }];
}

- (CGRect)frameInBetweenVerticalView:(UIView *)topView andView:(UIView *)bottomView
{
    CGFloat origin = UIViewGetMaxY(topView);
    return CGRectMake(0, origin, UIViewGetWidth(self), UIViewGetMinY(bottomView) - origin);
}

- (void)setXOrigin:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setYOrigin:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)autoFitBetween:(UIView *)top andView:(UIView *)bottom
{
    [self autoFitBetween:top andView:bottom offset:0];
}

- (void)autoFitBetween:(UIView *)top andView:(UIView *)bottom offset:(CGFloat)offset
{
    CGRect frame = self.frame;
    frame.origin.y = CGRectGetMaxY(top.frame) + offset;
    frame.size.height = CGRectGetMinY(bottom.frame) - frame.origin.y;
    self.frame = frame;
}

- (void)sizeEqualToSuperview
{
    NSAssert(self.superview, @"Superview cannot be nil");
    
    [self setSize:self.superview.frame.size];
}

- (void)sizeWidthFullScreen
{
    [self setWidth:[UIScreen mainScreen].bounds.size.width];
}

- (void)stretchWidthToReachView:(UIView *)view offset:(CGFloat)offset
{
    [self setWidth:UIViewGetWidth(view) - UIViewGetMinX(self) + offset];
}

- (void)stretchHeightToReachBottomOfSuperview
{
    [self setHeight:UIViewGetHeight(self.superview) - UIViewGetMinY(self)];
}

- (void)offsetSizeBy:(CGPoint)offset
{
    [self setSize:CGSizeMake(self.size.width + offset.x, self.size.height + offset.y)];
}

- (void)moveToBottomOfSuperview
{
    NSAssert(self.superview, @"Superview cannot be nil");
    
    [self moveToBottomOfView:self.superview];
}

- (void)moveToBottomOfSuperviewWithOffset:(CGFloat)offset
{
    NSAssert(self.superview, @"Superview cannot be nil");
    
    [self moveToBottomOfView:self.superview withOffset:offset];
}

- (void)moveToBottomOfView:(UIView *)view
{
    [self moveToBottomOfView:view withOffset:0];
}

- (void)moveToBottomOfView:(UIView *)view withOffset:(CGFloat)offset
{
    [self setOrigin:CGPointMake(self.frame.origin.x, CGRectGetHeight(view.frame) - CGRectGetHeight(self.frame) + offset)];
}

- (void)moveToRightOfSuperview
{
    [self moveToRightOfSuperviewWithOffset:0];
}

- (void)moveToRightOfView:(UIView *)view offset:(CGFloat)offset
{
    [self setOrigin:CGPointMake(CGRectGetMaxX(view.frame) + offset, self.frame.origin.y)];
}

- (void)moveToRightOfSuperviewWithOffset:(CGFloat)offset
{
    NSAssert(self.superview, @"Superview cannot be nil");
    
    [self setOrigin:CGPointMake(CGRectGetWidth(self.superview.frame) - CGRectGetWidth(self.frame) + offset, self.frame.origin.y)];
}

+ (id)viewFromNibNamed:(NSString*)name
{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil];
    NSAssert(topLevelObjects.count > 0, @"No NIB exists with name %@", name);
    return [topLevelObjects objectAtIndex:0];
}

+ (instancetype)loadFromNIB
{
    return [self viewFromNibNamed:NSStringFromClass(self)];
}

- (UIView *)firstSuperviewMatchingClasss:(Class)aClass
{
    UIView *superview = self.superview;

    if(!superview) {
        return nil;
    }
    
    if([superview isKindOfClass:aClass]) {
        return superview;
    }
    
    return [superview firstSuperviewMatchingClasss:aClass];
}

#pragma mark - Animations

- (void)addSubviewWithFadeAnimation:(UIView *)view
{
    view.alpha = 0.0;
    
    [self addSubview:view];
    
    [UIView animateWithDuration:0.3 animations:^{
        view.alpha = 1.0;
    }];
}

- (void)removeFromSuperviewWithFadeAnimation
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - Misc

- (void)makeCircular
{
    self.layer.cornerRadius = UIViewGetWidth(self)/2.0;
    self.clipsToBounds = YES;
}

- (void)addShadow
{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 5);
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    self.layer.shadowRadius = 4.0;
    self.layer.shadowOpacity = 1.0;
    self.layer.masksToBounds = NO;
}

- (UIView *)nextResponderBySearchingSuperviewHeirarchyVertically
{
    CGFloat thisY = UIViewGetMinY(self);
    CGFloat closestY = thisY;
    UIView *closestView = nil;
    for(UIView *view in self.superview.subviews) {
        if([view canBecomeFirstResponder]) {
            CGFloat origin = UIViewGetMinY(view);
            if(origin < closestY && origin > thisY) {
                closestY = origin;
                closestView = view;
            }
        }
    }
    
    return closestView;
}

@end
