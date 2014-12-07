//
//  UIButton+MBQuickKit.h
//  Tanger
//
//  Created by Mo Bitar on 5/19/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MBQuickKit)

@property (nonatomic, readwrite) NSString *normalTitle;

@property(nonatomic, assign) UIEdgeInsets hitTestEdgeInsets;

- (void)setImageRenderingMode:(UIImageRenderingMode)renderMode;

@end
