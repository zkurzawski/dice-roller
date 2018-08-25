//
//  ResetAll.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 7/1/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//
//  Resets the values for the dice quantites, stepper label and stepper.
//  Clears out the dice array for the next use.
//

import Foundation
import UIKit

func resetAllBtn(diceQtyLbl: [UILabel], diceStepperVal: [UIStepper], rollResults: UILabel) -> [Double] {
    let diceQtyArr = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    
    for i in 0...6 {
        diceQtyLbl[i].text = "0"
        diceStepperVal[i].value = 0.0
    }
    rollResults.isHidden = true
    return diceQtyArr
}
