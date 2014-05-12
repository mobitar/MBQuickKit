//
//  MFMailComposeViewController+MBQuickKit.m
//  Tanger
//
//  Created by Mo Bitar on 5/12/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "MFMailComposeViewController+MBQuickKit.h"

@implementation MFMailComposeViewController (MBQuickKit)

+ (MFMailComposeViewController *)composerWithDelegate:(id<MFMailComposeViewControllerDelegate>)delegate
                                              subject:(NSString *)subject
                                           recipients:(NSArray *)recipients
                                          messageBody:(NSString *)body
{
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *composeViewController = [[MFMailComposeViewController alloc] init];
        [composeViewController setMailComposeDelegate:delegate];
        [composeViewController setSubject:subject];
        [composeViewController setToRecipients:recipients];
        [composeViewController setMessageBody:body isHTML:NO];
        return composeViewController;
    } else {
        return nil;
    }
}

@end
