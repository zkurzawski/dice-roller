//
//  SlideMenu.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/12/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import UIKit

class SlideOutMenu: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 10, height: 0)
    }

}
