//
//  PWImageViewController.m
//  ParkWhiz
//
//  Created by Mo Bitar on 12/11/14.
//  Copyright (c) 2014 ParkWhiz. All rights reserved.
//

#import "MBXImageViewController.h"

@interface MBXImageViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) UIImage *image;
@end

@implementation MBXImageViewController

- (instancetype)initWithImage:(UIImage *)image
{
    if(self = [super init]) {
        self.image = image;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.minimumZoomScale = 1.0;
    self.scrollView.maximumZoomScale = 6.0;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.imageView.image = self.image;
    
    [self.imageView centerInSuperview];
    
    self.scrollView.contentSize = self.imageView.size;
    
    [self configureNavBar];
}

- (void)configureNavBar
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed)];
}

- (void)donePressed
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Scroll View

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    
}

@end
