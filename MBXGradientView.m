//
//  MBXGradientView.m
//  ParkWhiz
//
//  Created by Mo Bitar on 12/7/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "MBXGradientView.h"

@implementation MBXGradientView
{
    CAGradientLayer *_gradientLayer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initialize];
}

- (void)initialize
{
    self.backgroundColor = [UIColor clearColor];
    self.fromColor = [UIColor clearColor];
    self.toColor = [UIColor blackColor];
}

- (UIView *)overlayView
{
    if(!_overlayView) {
        self.overlayView = [[UIView alloc] initWithFrame:self.bounds];
        self.overlayView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.overlayView];
    }
    return _overlayView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if(!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.colors = @[(id)self.fromColor.CGColor, (id)self.toColor.CGColor];
        _gradientLayer.locations = @[@0.3, @1];
        _gradientLayer.opacity = 0.7;
        [self.layer addSublayer:_gradientLayer];
    }
    
    _gradientLayer.frame = self.bounds;
    
    [self.overlayView sizeEqualToSuperview];
}

@end
