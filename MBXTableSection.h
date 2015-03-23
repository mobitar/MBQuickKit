//
//  MBXTableSection.h
//  ParkWhiz
//
//  Created by Mo Bitar on 2/27/15.
//  Copyright (c) 2015 ParkWhiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBXTableSection : NSObject

@property (nonatomic) id identifier;

@property (nonatomic) NSMutableArray *rows;

@property (nonatomic, copy) NSString *title;

+ (instancetype)sectionWithIdentifier:(id)identifier title:(NSString *)title rows:(NSArray *)rows;
+ (instancetype)sectionWithIdentifier:(id)identifier title:(NSString *)title rowsBlock:(NSArray *(^)())rows;

@end

/** MBXRow Definition */

@interface MBXRow : NSObject

@property (nonatomic) id identifier;

+ (instancetype)rowWithIdentifier:(id)identifier;

@end
