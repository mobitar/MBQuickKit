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

@end
