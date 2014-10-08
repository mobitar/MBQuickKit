//
//  UIView+Animations.m
//  Tanger
//
//  Created by Mo Bitar on 5/1/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "UIView+Animations.h"

@implementation UIView (Animations)

- (void)addBounceAnimationWithDuration:(CGFloat)duration minScale:(CGFloat)minScale maxScale:(CGFloat)maxScale
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.values = @[
                         [NSValue valueWithCATransform3D:self.layer.transform],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(maxScale, maxScale, maxScale)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(minScale, minScale, minScale)],
                         [NSValue valueWithCATransform3D:self.layer.transform],
                         ];
    animation.keyTimes = @[@0.0, @0.3, @0.7, @0.9];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = duration;
    [self.layer addAnimation:animation forKey:@"bounce"];
}

- (void)addBounceAnimation
{
    [self addBounceAnimationWithDuration:0.35 minScale:0.9 maxScale:1.2];
}

- (CAKeyframeAnimation *)addMomentaryExpandAndFadeAnimation
{
    CGFloat const duration = 1.0;
    CGFloat const maxScale = 1.2;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.values = @[
                         [NSValue valueWithCATransform3D:self.layer.transform],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(maxScale, maxScale, maxScale)],
                         [NSValue valueWithCATransform3D:self.layer.transform],
                         ];
    animation.keyTimes = @[@0.0, @0.5, @0.9];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = duration;
    animation.removedOnCompletion = YES;
    [self.layer addAnimation:animation forKey:@"tempScale"];
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[@1,@0.5, @1];
    opacityAnimation.keyTimes = animation.keyTimes;
    opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    opacityAnimation.duration = duration;
    opacityAnimation.removedOnCompletion = YES;
    [self.layer addAnimation:opacityAnimation forKey:@"tempFade"];

    return animation;
}

+ (CABasicAnimation*)basicAnimationForKeyPath:(NSString*)keyPath fromValue:(id)fromValue toValue:(id)toValue duration:(CGFloat)duration fillMode:(NSString*)fillMode removeOnCompletion:(BOOL)removeOnCompletion
{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:keyPath];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    if(fromValue)
        animation.fromValue = fromValue;
    if(toValue)
        animation.toValue = toValue;
    
    animation.duration = duration;
    if(fillMode)
        animation.fillMode = fillMode;
    animation.removedOnCompletion = removeOnCompletion;
    return animation;
}

+ (CABasicAnimation *)pulseAnimationToMaxScale:(CATransform3D)scale
{
    CABasicAnimation *animation = [self basicAnimationForKeyPath:@"transform" fromValue:nil toValue:[NSValue valueWithCATransform3D:scale] duration:0.35 fillMode:nil removeOnCompletion:YES];
    animation.autoreverses = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = HUGE_VAL;
    return animation;
}

- (void)addPulseAnimation
{
    if([self.layer animationForKey:@"pulse-animation"]) {
        return;
    }
    [self.layer addAnimation:[self.class pulseAnimationToMaxScale:CATransform3DMakeScale(1.3, 1.3, 1.3)] forKey:@"pulse-animation"];
}

- (void)setHidden:(BOOL)hidden animated:(BOOL)animated
{
    if(animated) {
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = !hidden;
        } completion:^(BOOL finished) {
            self.hidden = hidden;
        }];
    } else {
        self.hidden = hidden;
    }
}

+ (void)animateWithDuration:(NSTimeInterval)duration usingSpringWithDamping:(CGFloat)dampingRatio animations:(void (^)(void))animations
{
    [self animateWithDuration:duration delay:0.0 usingSpringWithDamping:dampingRatio initialSpringVelocity:0.0 options:0 animations:animations completion:nil];
}

+ (void)animateWithDuration:(NSTimeInterval)duration usingSpringWithDamping:(CGFloat)dampingRatio animations:(void (^)(void))animations completion:(void(^)(BOOL finished))completion
{
    [self animateWithDuration:duration delay:0.0 usingSpringWithDamping:dampingRatio initialSpringVelocity:0.0 options:0 animations:animations completion:completion];
}

@end
