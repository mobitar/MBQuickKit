//
//  MFMailComposeViewController+MBQuickKit.m
//  Tanger
//
//  Created by Mo Bitar on 5/12/14.
//  Copyright (c) 2014 Punchkick. All rights reserved.
//

#import "MFMailComposeViewController+MBQuickKit.h"
#include <sys/types.h>
#include <sys/sysctl.h>

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

+ (NSString *)diagnosticsString
{
    NSString *deviceType = [self platform];
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    NSString *info = [NSString stringWithFormat:@"-----------------\nDevice Information\n\nOS Version: %@\nDevice Model: %@\nApp Version: %@\n-----------------", systemVersion, deviceType, appVersion];
    return info;
}

+ (NSString *)platform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

@end
