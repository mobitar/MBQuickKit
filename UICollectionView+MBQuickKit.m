//
//  UICollectionView+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 9/29/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "UICollectionView+MBQuickKit.h"

@implementation UICollectionView (MBQuickKit)

- (void)registerNibForClass:(Class)aClass
{
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(aClass) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(aClass)];
}

- (void)registerCellForClass:(Class)aClass
{
    [self registerClass:aClass forCellWithReuseIdentifier:NSStringFromClass(aClass)];
}

- (id)dequeueReusableCellForClass:(Class)aClass indexPath:(NSIndexPath *)indexPath
{
    return [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass(aClass) forIndexPath:indexPath];
}

@end
