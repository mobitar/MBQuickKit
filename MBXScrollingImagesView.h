//
//  MBXScrollingImagesView.h
//  ParkWhiz
//
//  Created by Mo Bitar on 3/12/15.
//  Copyright (c) 2015 ParkWhiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBXScrollingImagesView : UIView

@property (nonatomic) NSArray *urls;
@property (nonatomic) CGSize imageSize;
@property (nonatomic) UIViewContentMode imageViewContentMode;
@property (nonatomic) CGFloat horizontalSpaceBetweenImages;
@property (nonatomic) UIEdgeInsets contentInset;
@property (nonatomic) BOOL showScrollers;

@end
