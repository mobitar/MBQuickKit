//
//  UILabel+MBQuickKit.h
//  Tanger
//
//  Created by Mo Bitar on 6/11/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MBQuickKit)

/** Applies the font using an attributed string from the beginning of the string to the end of the given string */
- (void)applyFont:(UIFont *)font toTextUpToString:(NSString *)string;

@end
