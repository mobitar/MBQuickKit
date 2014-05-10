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

@end
