//
//  UIButton+MBQuickKit.m
//  Tanger
//
//  Created by Mo Bitar on 5/19/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "UIButton+MBQuickKit.h"
#import <objc/runtime.h>
#import "UIView+Utils.h"

@implementation UIButton (MBQuickKit)

- (NSString *)normalTitle
{
    return [self titleForState:UIControlStateNormal];
}

- (void)setNormalTitle:(NSString *)normalTitle
{
    [self setTitle:normalTitle forState:UIControlStateNormal];
}

- (void)setImageRenderingMode:(UIImageRenderingMode)renderMode
{
    UIImage *image = [self imageForState:UIControlStateNormal];
    NSAssert(image, @"Image must be set before setting rendering mode");
    [self setImage:[image imageWithRenderingMode:renderMode] forState:UIControlStateNormal];
}

/** 
 Increase button tappable area, via http://stackoverflow.com/a/13067285/458960
 */
static const NSString *KEY_HIT_TEST_EDGE_INSETS = @"HitTestEdgeInsets";

-(void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = [NSValue value:&hitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets; [value getValue:&edgeInsets]; return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsetsZero) ||       !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitTestEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

static NSInteger const activityIndicatorTag = 89235;

- (UIActivityIndicatorView *)addActivityIndicatorWithColor:(UIColor *)color
{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicator startAnimating];
    indicator.tintColor = color;
    indicator.color = color;
    indicator.tag = activityIndicatorTag;
    
    
    [self.titleLabel sizeToFit];
    
    [self addSubview:indicator];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -UIViewGetWidth(indicator), 0, 0)];
    [indicator trailHorizontallyTo:self.titleLabel withOffset:0];
    [indicator centerVerticallyInSuperview];
    
    return indicator;
}

- (void)removeActivityIndicator
{
    [self setTitleEdgeInsets:UIEdgeInsetsZero];
    [[self viewWithTag:activityIndicatorTag] removeFromSuperview];
}

@end
