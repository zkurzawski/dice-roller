//
//  SixSidedLabel.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/17/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import UIKit

class SixSidedLabel: UILabel {

    func selected() {
        self.textColor = #colorLiteral(red: 0.9999073148, green: 1, blue: 0.999881804, alpha: 1)
    }
    
    func deselected() {
        self.textColor = #colorLiteral(red: 0.6467786431, green: 0.7380540967, blue: 0.8325814605, alpha: 1)
    }
    
}
