//
//  ButtonAppearance.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/20/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import UIKit

class ButtonAppearance: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
    }
}
