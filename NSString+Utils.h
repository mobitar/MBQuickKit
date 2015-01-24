//
//  NSString+Utils.h
//  Tanger
//
//  Created by Mo Bitar on 4/29/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Utils)

- (NSString *)stringByRemovingAllButNumbers;

- (CGFloat)heightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (CGSize)mb_sizeWithFont:(UIFont *)font;

- (void)mb_drawInRect:(CGRect)rect withFont:(UIFont *)font color:(UIColor *)color;

- (NSString *)stringByRemovingWhiteSpace;

- (BOOL)isValidURL;

- (NSString *)stringByDecodingURLFormat;

- (NSString *)stringByEncodingURLFormat;

+ (NSString *)emdashString;

@end
