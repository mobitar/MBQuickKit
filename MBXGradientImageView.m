//
//  MBXGradientImageView.m
//  ParkWhiz
//
//  Created by Mo Bitar on 12/8/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "MBXGradientImageView.h"
#import "MBQuickKit.h"

@implementation MBXGradientImageView

- (MBXGradientView *)gradientView
{
    if(!_gradientView ) {
        self.gradientView = [[MBXGradientView alloc] initWithFrame:self.bounds];
        [self addSubview:self.gradientView];
    }
    
    return _gradientView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.gradientView sizeEqualToSuperview];
}

@end
