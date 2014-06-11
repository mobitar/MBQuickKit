//
//  UILabel+MBQuickKit.m
//  Tanger
//
//  Created by Mo Bitar on 6/11/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "UILabel+MBQuickKit.h"

@implementation UILabel (MBQuickKit)

- (void)applyFont:(UIFont *)font toTextUpToString:(NSString *)string
{
    NSRange range = [self.text rangeOfString:string];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.text
                                                                                   attributes:@{NSFontAttributeName : self.font, NSForegroundColorAttributeName : self.textColor}];
    [attrString addAttributes:@{NSFontAttributeName : font} range:NSMakeRange(0, range.location + range.length)];
    self.attributedText = attrString;
}

@end
