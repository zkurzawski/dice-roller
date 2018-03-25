//
//  ResetButton.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 3/20/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import UIKit

class ResetButton: UIButton {

    static let instance = ResetButton()
    
    func resetAllMenuItems(diceQtyLbls: [UILabel], diceStepVal: [UIStepper]) -> [Double] {
        let diceQtyArr = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
        for i in 0...6 {
            diceQtyLbls[i].text = "0"
            diceStepVal[i].value = 0.0
        }
        return diceQtyArr
    }

}
