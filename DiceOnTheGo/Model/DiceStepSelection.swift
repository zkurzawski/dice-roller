//
//  DiceStepSelection.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 3/21/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//
//  Assign a value to the stepper label and uodate the stepper value array
//

import Foundation
import UIKit

func diceStepSelection(stepValue: UIStepper, stepLbl: UILabel) -> Double {
    let value = stepValue.value
    stepLbl.text = "\(Int(value))"
    return value
}
