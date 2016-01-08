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