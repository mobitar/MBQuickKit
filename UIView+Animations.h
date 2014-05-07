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

- (CAKeyframeAnimation *)addMomentaryExpandAndFadeAnimation;

@end
