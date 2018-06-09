//
//  d6TypeSelection.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 3/30/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation
import UIKit

func d6TypeSelected(btnPushed: UIButton, btnNotPushed: UIButton, d6Chosen: Bool) {
    let regD6 = UIImage(named:  "d6img5.png") as UIImage?
    let dimD6 = UIImage(named: "d6dim.png") as UIImage?
    let regTrad6 = UIImage(named: "trad_img5.png") as UIImage?
    let dimTrad6 = UIImage(named: "trad_dim") as UIImage?
    
    if d6Chosen {
        btnNotPushed.setImage(dimD6, for: UIControlState.normal)
        btnPushed.setImage(regTrad6, for: UIControlState.normal)
        
    } else {
        btnNotPushed.setImage(dimTrad6, for: UIControlState.normal)
        btnPushed.setImage(regD6, for: UIControlState.normal)
    }
//    print("d6 selected")
//    btnNotPushed.setImage(image2, for: UIControlState.normal)
//    btnPushed.setImage(image, for: UIControlState.normal)
}
