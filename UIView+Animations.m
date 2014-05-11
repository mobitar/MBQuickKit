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

@end
