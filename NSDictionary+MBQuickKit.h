//
//  NSDictionary+MBQuickKit.h
//  Tanger
//
//  Created by Mo Bitar on 5/14/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MBQuickKit)

- (NSString *)toJSON;

+ (NSDictionary *)dictionaryFromLocalJSONFileNamed:(NSString *)fileName;

@end
