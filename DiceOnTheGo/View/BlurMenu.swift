//
//  BlurMenu.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/12/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//
//  Corner radius for the blurred portion of the options menu
//

import UIKit

class BlurMenu: UIVisualEffectView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
    }

}
