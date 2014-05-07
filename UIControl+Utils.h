//
//  UIControl+Utils.h
//  Tanger
//
//  Created by Mo Bitar on 4/29/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Utils)

- (void)removeAllTargets;

- (void)addTouchUpInsideTarget:(id)target selector:(SEL)selector;

@end
