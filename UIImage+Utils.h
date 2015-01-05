//
//  UIImage+Utils.h
//  Tanger
//
//  Created by Mo Bitar on 5/9/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)

- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;

+ (UIImage *)backButtonImage;

+ (UIImage *)forwardButtonImage;

- (UIImage *)imageByResizingToSize:(CGSize)size;

+ (UIImage *)imageFromLayer:(CALayer *)layer;

@end
