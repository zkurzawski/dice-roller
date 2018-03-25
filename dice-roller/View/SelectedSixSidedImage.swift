//
//  SelectedSixSidedImage.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 3/21/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import UIKit

class SelectedSixSidedImage: UIImageView {
    
    func selected() {
        self.isHighlighted = true
    }
    
    func deselected() {
        self.isHighlighted = false
    }
}
