//
//  MBQuickKit+Extras.swift
//  ParkWhiz
//
//  Created by Mo Bitar on 1/8/16.
//  Copyright © 2016 ParkWhiz. All rights reserved.
//

import Foundation

var startTime = NSDate()
func TICK(){ startTime =  NSDate() }
func TOCK(function: String = __FUNCTION__, file: String = __FILE__, line: Int = __LINE__){
    print("\(function) Time: \(-startTime.timeIntervalSinceNow)\nLine:\(line) File: \(file)")
}

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}