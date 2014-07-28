//
//  MBXActionSheet.m
//  WordPack
//
//  Created by Mo Bitar on 7/28/14.
//  Copyright (c) 2014 progenius inc. All rights reserved.
//

#import "MBXActionSheet.h"

@interface MBXActionSheet() <UIActionSheetDelegate>
@property (nonatomic, copy) void(^tapBlock)(MBXActionSheet *actionSheet, NSInteger buttonIndex);
@end

#define NSArrayObjectMaybeNil(__ARRAY__, __INDEX__) ((__INDEX__ >= [__ARRAY__ count]) ? nil : [__ARRAY__ objectAtIndex:__INDEX__])
// This is a hack to turn an array into a variable argument list. There is no good way to expand arrays into variable argument lists in Objective-C. This works by nil-terminating the list as soon as we overstep the bounds of the array. The obvious glitch is that we only support a finite number of buttons.
#define NSArrayToVariableArgumentsList(__ARRAYNAME__) NSArrayObjectMaybeNil(__ARRAYNAME__, 0), NSArrayObjectMaybeNil(__ARRAYNAME__, 1), NSArrayObjectMaybeNil(__ARRAYNAME__, 2), NSArrayObjectMaybeNil(__ARRAYNAME__, 3), NSArrayObjectMaybeNil(__ARRAYNAME__, 4), NSArrayObjectMaybeNil(__ARRAYNAME__, 5), NSArrayObjectMaybeNil(__ARRAYNAME__, 6), NSArrayObjectMaybeNil(__ARRAYNAME__, 7), NSArrayObjectMaybeNil(__ARRAYNAME__, 8), NSArrayObjectMaybeNil(__ARRAYNAME__, 9), nil

@implementation MBXActionSheet

+ (instancetype)showInView:(UIView *)view
                 withTitle:(NSString *)title
         cancelButtonTitle:(NSString *)cancelButtonTitle
    destructiveButtonTitle:(NSString *)destructiveButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
                  tapBlock:(void(^)(UIActionSheet *actionSheet, NSInteger buttonIndex))tapBlock
{
    MBXActionSheet *actionSheet = [[self alloc] initWithTitle:title
                                                    delegate:nil
                                           cancelButtonTitle:cancelButtonTitle
                                      destructiveButtonTitle:destructiveButtonTitle
                                           otherButtonTitles:NSArrayToVariableArgumentsList(otherButtonTitles)];
    actionSheet.delegate = actionSheet;
    
    if (tapBlock) {
        actionSheet.tapBlock = tapBlock;
    }
    
    [actionSheet showInView:view];
    
    return actionSheet;
}

#pragma mark - Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(self.tapBlock) {
        self.tapBlock(self, buttonIndex);
    }
}

@end
