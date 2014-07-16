//
//  UITableView+Utils.m
//  Tanger
//
//  Created by Mo Bitar on 4/25/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "UITableView+Utils.h"

@implementation UITableView (Utils)

- (void)registerNibForClass:(Class)aClass
{
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(aClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(aClass)];
}

- (void)registerCellForClass:(Class)aClass
{
    [self registerClass:aClass forCellReuseIdentifier:NSStringFromClass(aClass)];
}

- (id)dequeueReusableCellForClass:(Class)aClass
{
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(aClass)];
}

- (BOOL)isIndexPathLast:(NSIndexPath *)indexPath
{
    return [self numberOfRowsInSection:indexPath.section] - 1 == indexPath.row;
}

@end
