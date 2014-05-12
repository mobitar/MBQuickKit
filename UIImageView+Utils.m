//
//  UIImageView+Utils.m
//  Diveo
//
//  Created by Mo Bitar on 5/10/14.
//  Copyright (c) 2014 progenius. All rights reserved.
//

#import "UIImageView+Utils.h"

@implementation UIImageView (Utils)

- (instancetype)initWithImageNamed:(NSString *)imageName
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
}

- (void)setImageRenderingMode:(UIImageRenderingMode)renderMode
{
    NSAssert(self.image, @"Image must be set before setting rendering mode");
    self.image = [self.image imageWithRenderingMode:renderMode];
}

@end
