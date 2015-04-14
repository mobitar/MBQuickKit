//
//  UICollectionView+MBQuickKit.h
//  ParkWhiz
//
//  Created by Mo Bitar on 9/29/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (MBQuickKit)

- (void)registerNibForClass:(Class)aClass;
- (void)registerCellForClass:(Class)aClass;
- (id)dequeueReusableCellForClass:(Class)aClass indexPath:(NSIndexPath *)indexPath;
- (CGFloat)leftInsetForCenteredSection:(NSInteger)section layout:(UICollectionViewLayout *)layout;
@end
