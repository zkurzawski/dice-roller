//
//  d6TypeSelection.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 3/30/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation
import UIKit

func d6TypeSelected(btnPushed: UIButton, btnNotPushed: UIButton) {    
    let image = UIImage(named:  "d6_reg_img.png") as UIImage!
    let image2 = UIImage(named: "d6_dim_img.png") as UIImage!
    btnNotPushed.setImage(image2, for: UIControlState.normal)
    btnPushed.setImage(image, for: UIControlState.normal)
}
