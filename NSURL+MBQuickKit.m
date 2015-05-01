//
//  NSURL+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 4/30/15.
//  Copyright (c) 2015 ParkWhiz. All rights reserved.
//

#import "NSURL+MBQuickKit.h"
#import "NSString+Utils.h"

@implementation NSURL (MBQuickKit)

- (NSMutableDictionary *)queryComponents
{
    return [[self query] dictionaryFromQueryComponents];
}

@end
