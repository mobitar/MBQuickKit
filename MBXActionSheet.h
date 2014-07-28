//
//  MBXActionSheet.h
//  WordPack
//
//  Created by Mo Bitar on 7/28/14.
//  Copyright (c) 2014 progenius inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBXActionSheet : UIActionSheet

+ (instancetype)showInView:(UIView *)view
                 withTitle:(NSString *)title
         cancelButtonTitle:(NSString *)cancelButtonTitle
    destructiveButtonTitle:(NSString *)destructiveButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
                  tapBlock:(void(^)(UIActionSheet *actionSheet, NSInteger buttonIndex))tapBlock;

@end
