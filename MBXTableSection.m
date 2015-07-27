//
//  MBXTableSection.m
//  ParkWhiz
//
//  Created by Mo Bitar on 2/27/15.
//  Copyright (c) 2015 ParkWhiz. All rights reserved.
//

#import "MBXTableSection.h"

@implementation MBXTableSection

+ (instancetype)sectionWithIdentifier:(id)identifier title:(NSString *)title rows:(NSArray *)rows
{
    MBXTableSection *section = [MBXTableSection new];
    section.identifier = identifier;
    section.rows = [rows mutableCopy];
    section.title = title;
    return section;
}

+ (instancetype)sectionWithIdentifier:(id)identifier title:(NSString *)title rowsBlock:(NSArray *(^)())rows
{
    return [self sectionWithIdentifier:identifier title:title rows:rows()];
}

- (NSMutableArray *)rows
{
    if(!_rows) {
        self.rows = [NSMutableArray new];
    }
    return _rows;
}

- (NSInteger)indexForRow:(MBXRow *)row
{
    return [self.rows indexOfObject:row];
}

@end








@implementation MBXRow

+ (instancetype)rowWithIdentifier:(id)identifier
{
    MBXRow *row = [MBXRow new];
    row.identifier = identifier;
    return row;
}

@end












@implementation MBXIndexPath

+ (instancetype)indexPathForRow:(MBXRow *)row section:(MBXTableSection *)section
{
    MBXIndexPath *indexPath = [MBXIndexPath new];
    indexPath.row = row;
    indexPath.section = section;
    return indexPath;
}

@end