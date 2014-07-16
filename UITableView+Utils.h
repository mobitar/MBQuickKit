//
//  UITableView+Utils.h
//  Tanger
//
//  Created by Mo Bitar on 4/25/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Utils)

- (void)registerNibForClass:(Class)aClass;

- (void)registerCellForClass:(Class)aClass;

- (id)dequeueReusableCellForClass:(Class)aClass;

- (BOOL)isIndexPathLast:(NSIndexPath *)indexPath;

@end
