//
//  UICollectionView+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 9/29/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "UICollectionView+MBQuickKit.h"
#import "NSString+MBQuickKit.h"

@implementation UICollectionView (MBQuickKit)

- (void)registerNibForClass:(Class)aClass
{
    [self registerNib:[UINib nibWithNibName:MBXSwiftSafeStringFromClass(aClass) bundle:nil] forCellWithReuseIdentifier:MBXSwiftSafeStringFromClass(aClass)];
}

- (void)registerCellForClass:(Class)aClass
{
    [self registerClass:aClass forCellWithReuseIdentifier:MBXSwiftSafeStringFromClass(aClass)];
}

- (id)dequeueReusableCellForClass:(Class)aClass indexPath:(NSIndexPath *)indexPath
{
    return [self dequeueReusableCellWithReuseIdentifier:MBXSwiftSafeStringFromClass(aClass) forIndexPath:indexPath];
}

- (CGFloat)leftInsetForCenteredSection:(NSInteger)section layout:(UICollectionViewLayout *)layout
{
    // Add inset to the collection view if there are not enough cells to fill the width.
    CGFloat cellSpacing = ((UICollectionViewFlowLayout *) layout).minimumInteritemSpacing;
    CGFloat cellWidth = ((UICollectionViewFlowLayout *) layout).itemSize.width;
    NSInteger cellCount = [self numberOfItemsInSection:section];
    CGFloat inset = (self.bounds.size.width - (cellCount * (cellWidth + cellSpacing))) * 0.5;
    inset = MAX(inset, 0.0);
    return inset;
}

@end
