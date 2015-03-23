//
//  NSString+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 4/29/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

- (NSString *)stringByRemovingAllButNumbers
{
    NSString *newString = [[self componentsSeparatedByCharactersInSet: [[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
    return newString;
}

- (CGFloat)heightWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName : font} context:nil].size.height;
}

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:@{NSFontAttributeName : font} context:nil].size;
}

- (void)mb_drawInRect:(CGRect)rect withFont:(UIFont *)font color:(UIColor *)color
{
    [self drawInRect:rect withAttributes:@{NSFontAttributeName : font, NSForegroundColorAttributeName : color}];
}

- (CGSize)mb_sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
}

- (NSString *)stringByRemovingWhiteSpace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (BOOL)containsOnlyLetters
{
    NSCharacterSet *set = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"] invertedSet];
    return [self rangeOfCharacterFromSet:set].location == NSNotFound;
}

- (BOOL)isValidEmail
{
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidURL
{
    if (!self.length) {
        return NO;
    }
    
    NSDataDetector *linkDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    NSRange urlStringRange = NSMakeRange(0, [self length]);
    NSMatchingOptions matchingOptions = 0;
    
    if ([linkDetector numberOfMatchesInString:self options:matchingOptions range:urlStringRange] == 0) {
        return NO;
    }
    
    NSTextCheckingResult *checkingResult = [linkDetector firstMatchInString:self options:matchingOptions range:urlStringRange];
    return checkingResult.resultType == NSTextCheckingTypeLink && NSEqualRanges(checkingResult.range, urlStringRange);
}

- (NSString *)stringByDecodingURLFormat
{
    NSString *result = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

- (NSString *)stringByEncodingURLFormat
{
    NSString *result = [self stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    result = [result stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

+ (NSString *)emdashString
{
    return [NSString stringWithFormat: @"%C", (unichar)0x2014];
}

- (NSArray *)sentences
{
    NSMutableArray *results = [NSMutableArray array];
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationBySentences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [results addObject:substring];
    }];
    return results;
}

@end
