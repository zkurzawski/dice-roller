//
//  d6SwitchOnOff.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 3/21/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation
import UIKit

func d6SwitchOnOff(d6AppearenceSwitch: UISwitch, d6DDImg: SelectedSixSidedImage, d6TradImg: SelectedSixSidedImage) -> Bool {
    var switchOn: Bool
    if d6AppearenceSwitch.isOn {
        d6DDImg.deselected()
        d6TradImg.selected()
        switchOn = true
    } else {
        d6DDImg.selected()
        d6TradImg.deselected()
        switchOn = false
    }
    return switchOn
}
