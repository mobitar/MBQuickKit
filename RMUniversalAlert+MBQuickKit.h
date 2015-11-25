//
//  RMUniversalAlert+MBQuickKit.h
//  ParkWhiz
//
//  Created by Mo Bitar on 11/24/15.
//  Copyright © 2015 ParkWhiz. All rights reserved.
//

#import "RMUniversalAlert.h"

@interface RMUniversalAlert (MBQuickKit)
+ (void)showAlertWithTitle:(NSString *)title text:(NSString *)text onViewController:(UIViewController *)controller;
@end
