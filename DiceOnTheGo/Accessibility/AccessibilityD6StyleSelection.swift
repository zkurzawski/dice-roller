//
//  AccessibilityD6StyleSelection.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 6/29/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//
//  Assign accessibility value to the d6 selection button
//

import Foundation

func d6BtnAccessibilityValueAssignment(d6Choice: Bool) -> String {
    
    var value = ""
    
    if d6Choice {
        value = "is traditional style"
    } else {
        value = "is table top style"
    }
    
    return value
}
