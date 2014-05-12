//
//  UIImageView+Utils.h
//  Diveo
//
//  Created by Mo Bitar on 5/10/14.
//  Copyright (c) 2014 progenius. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Utils)

- (instancetype)initWithImageNamed:(NSString *)imageName;

- (void)setImageRenderingMode:(UIImageRenderingMode)renderMode;

@end
