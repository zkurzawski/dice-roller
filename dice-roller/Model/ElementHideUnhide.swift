//
//  ElementHideUnhide.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 6/14/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//
//  Hides and unhides roll dice button and directions label.
//  To be used for accessibility purposes.
//

import Foundation
import UIKit

func hideUnhideMainViewElements(optionsBtn: UIButton, rollBtn: UIButton, dirLbl: UILabel, resultsLbl: UILabel, onOff: Bool, dieSelected: Bool) {
    if UIAccessibilityIsVoiceOverRunning(){
        optionsBtn.isHidden = onOff
        rollBtn.isHidden = onOff
    }
        
    if dieSelected {

        dirLbl.isHidden = true
    } else {
        dirLbl.isHidden = false
    }
}
