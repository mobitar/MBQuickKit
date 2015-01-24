//
//  PWImageViewController.h
//  ParkWhiz
//
//  Created by Mo Bitar on 12/11/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBXImageViewController : UIViewController

- (instancetype)initWithImage:(UIImage *)image;

@property (nonatomic) UIColor *backgroundColor;

@property (nonatomic) BOOL zoomEnabled;

@end
