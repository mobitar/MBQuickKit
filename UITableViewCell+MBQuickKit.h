//
//  UITableViewCell+MBQuickKit.h
//  ParkWhiz
//
//  Created by Mo Bitar on 10/14/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (MBQuickKit)

/** Note: This modifies the cell's selectedBackgroundView */
- (void)setSelectedColor:(UIColor *)color;

@end
