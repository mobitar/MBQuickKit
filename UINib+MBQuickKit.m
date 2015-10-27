//
//  UINib+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 10/27/15.
//  Copyright © 2015 ParkWhiz. All rights reserved.
//

#import "UINib+MBQuickKit.h"

@implementation UINib (MBQuickKit)

+ (BOOL)nibExistsForClass:(Class)class
{
    NSString *pathForNIB = [[NSBundle mainBundle] pathForResource:NSStringFromClass(class) ofType:@"nib"];
    return pathForNIB != nil;
}

@end
