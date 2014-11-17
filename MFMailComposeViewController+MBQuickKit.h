//
//  MFMailComposeViewController+MBQuickKit.h
//  Tanger
//
//  Created by Mo Bitar on 5/12/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import <MessageUI/MessageUI.h>

@interface MFMailComposeViewController (MBQuickKit)

+ (MFMailComposeViewController *)composerWithDelegate:(id<MFMailComposeViewControllerDelegate>)delegate
                                              subject:(NSString *)subject
                                           recipients:(NSArray *)recipients
                                          messageBody:(NSString *)body;

+ (NSString *)diagnosticsString;

@end
