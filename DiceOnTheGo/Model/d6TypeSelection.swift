//
//  d6TypeSelection.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 3/30/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//
//  Changes image for d6 image type button and sets boolean value
//  for image type selected to be used in Dice Array filling
//

import Foundation
import UIKit

func d6TypeSelected(d6SelectBtn: UIButton, d6Chosen: Bool) -> Bool {

    var d6Trad = d6Chosen
    
    let d6Selected = UIImage(named: "appearanceBtnTrad6Dim.png") as UIImage?
    let tradSelected = UIImage(named: "appearanceBtnD6Dim.png") as UIImage?
    
    if d6Trad {
        d6SelectBtn.setImage(d6Selected, for: UIControl.State.normal)
        d6Trad = false
    } else {
        d6SelectBtn.setImage(tradSelected, for: UIControl.State.normal)
        d6Trad = true
    }
    
    return d6Trad
}
