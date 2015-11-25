//
//  RMUniversalAlert+MBQuickKit.m
//  ParkWhiz
//
//  Created by Mo Bitar on 11/24/15.
//  Copyright © 2015 ParkWhiz. All rights reserved.
//

#import "RMUniversalAlert+MBQuickKit.h"

@implementation RMUniversalAlert (MBQuickKit)

+ (void)showAlertWithTitle:(NSString *)title text:(NSString *)text onViewController:(UIViewController *)controller
{
    [RMUniversalAlert showAlertInViewController:controller withTitle:title message:text cancelButtonTitle:@"Ok" destructiveButtonTitle:nil otherButtonTitles:nil tapBlock:nil];
}

@end
