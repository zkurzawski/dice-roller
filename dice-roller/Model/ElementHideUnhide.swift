//
//  ElementHideUnhide.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 6/14/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation
import UIKit

func hideUnhideMainViewElements(optionsBtn: UIButton, rollBtn: UIButton, dirLbl: UILabel, onOff: Bool, dieSelected: Bool) {
    optionsBtn.isHidden = onOff
    rollBtn.isHidden = onOff
    
    if dieSelected {
        dirLbl.isHidden = true
    } else {
        dirLbl.isHidden = false
    }
}
