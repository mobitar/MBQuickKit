//
//  NSURL+MBQuickKit.m
//  Tanger
//
//  Created by Mo Bitar on 5/15/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "NSURL+MBQuickKit.h"

@implementation NSURL (MBQuickKit)

- (NSDictionary *)dictionaryFromQueryComponents
{
    NSString *query = [self query];
    NSMutableDictionary *queryComponents = [NSMutableDictionary dictionary];
    for(NSString *keyValuePairString in [query componentsSeparatedByString:@"&"])  {
        NSArray *keyValuePairArray = [keyValuePairString componentsSeparatedByString:@"="];
        if ([keyValuePairArray count] < 2) continue; // Verify that there is at least one key, and at least one value.  Ignore extra = signs
        NSString *key = [[keyValuePairArray objectAtIndex:0] stringByDecodingURLFormat];
        NSString *value = [[keyValuePairArray objectAtIndex:1] stringByDecodingURLFormat];
        NSMutableArray *results = [queryComponents objectForKey:key]; // URL spec says that multiple values are allowed per key
        if(!results) {
            results = [NSMutableArray arrayWithCapacity:1];
            [queryComponents setObject:results forKey:key];
        }
        [results addObject:value];
    }
    
    return [queryComponents copy];
}

@end
