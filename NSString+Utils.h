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
- (CGFloat)heightWithFont:(UIFont *)font lineHeight:(CGFloat)lineHeight constrainedToSize:(CGSize)size;

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (CGSize)mb_sizeWithFont:(UIFont *)font;

- (void)mb_drawInRect:(CGRect)rect withFont:(UIFont *)font color:(UIColor *)color;

- (NSString *)stringByRemovingWhiteSpace;

- (BOOL)isValidURL;

- (BOOL)isValidEmail;

- (BOOL)containsOnlyLetters;

- (NSString *)stringByDecodingURLFormat;

- (NSString *)stringByEncodingURLFormat;

- (NSMutableDictionary *)dictionaryFromQueryComponents;

+ (NSString *)emdashString;

- (NSArray *)sentences;

+ (NSString *)properlyPluralizedNounForNoun:(NSString *)noun pluralizationSuffix:(NSString *)suffix count:(CGFloat)count;

@end
