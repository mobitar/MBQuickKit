//
//  UIView+Animations.h
//  Tanger
//
//  Created by Mo Bitar on 5/1/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animations)

- (void)addBounceAnimationWithDuration:(CGFloat)duration minScale:(CGFloat)minScale maxScale:(CGFloat)maxScale;

- (void)addBounceAnimation;

- (void)addPulseAnimation;

- (CAKeyframeAnimation *)addMomentaryExpandAndFadeAnimation;

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated;

+ (void)animateWithDuration:(NSTimeInterval)duration usingSpringWithDamping:(CGFloat)dampingRatio animations:(void (^)(void))animations;

+ (void)animateWithDuration:(NSTimeInterval)duration usingSpringWithDamping:(CGFloat)dampingRatio animations:(void (^)(void))animations completion:(void(^)(BOOL finished))completion;

@end
