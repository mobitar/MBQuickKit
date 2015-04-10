//
//  MBXScrollingImagesView.m
//  ParkWhiz
//
//  Created by Mo Bitar on 3/12/15.
//  Copyright (c) 2015 ParkWhiz. All rights reserved.
//

#import "MBXScrollingImagesView.h"
#import "UIImageView+WebCache.h"
#import "MBQuickKit.h"

@interface MBXScrollingImagesView ()
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSMutableArray *imageViews;
@end

@implementation MBXScrollingImagesView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        self.imageViews = [NSMutableArray new];
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
        [self addSubview:self.scrollView];
    }
    
    return self;
}

- (void)setUrls:(NSArray *)urls
{
    for(UIImageView *imageView in self.imageViews) {
        [imageView removeFromSuperview];
    }
    
    [self.imageViews removeAllObjects];
    
    _urls = urls;
    
    for(NSURL *url in self.urls) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.imageSize.width, self.imageSize.height)];
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDidRecognize:)];
        [imageView addGestureRecognizer:tapGesture];
        imageView.contentMode = self.imageViewContentMode;
        [imageView sd_setImageWithURL:url];
        [self.imageViews addObject:imageView];
        [self.scrollView addSubview:imageView];
    }
}

- (void)layoutImageViews
{
    CGFloat currentX = 0;
    for(UIImageView *imageView in self.imageViews) {
        [imageView setXOrigin:currentX];
        currentX += UIViewGetWidth(imageView) + self.horizontalSpaceBetweenImages;
    }
    
    [self.scrollView autoContentSizeWidth];
    [self.scrollView autoContentSizeHeight];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.scrollView sizeEqualToSuperview];
    
    [self layoutImageViews];
    
    self.scrollView.showsHorizontalScrollIndicator = self.showScrollers;
    
    self.scrollView.contentInset = self.contentInset;
    
    [self.scrollView setContentOffset:CGPointMake(-self.contentInset.left, 0)];
}

- (void)tapGestureDidRecognize:(UITapGestureRecognizer *)gesture
{
    [self.delegate scrollingImagesViewDidSelectImageAtIndex:[self.imageViews indexOfObject:gesture.view]];
}

@end
