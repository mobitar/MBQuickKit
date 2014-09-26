//
//  NSDictionary+MBQuickKit.m
//  Tanger
//
//  Created by Mo Bitar on 5/14/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "NSDictionary+MBQuickKit.h"

@implementation NSDictionary (MBQuickKit)

- (NSString *)toJSON
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

+ (NSDictionary *)dictionaryFromLocalJSONFileNamed:(NSString *)fileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension] ofType:[fileName pathExtension]];
    NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingMutableContainers error:nil];
    return jsonDict;
}

@end
