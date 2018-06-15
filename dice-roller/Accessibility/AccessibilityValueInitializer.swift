//
//  AccessibilityValueInitializer.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 6/10/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation
import UIKit

func accessibilityValueInitializer(rollBtn: UIButton, optionsBtn: UIButton, closeBtn: UIButton) {
    optionsBtn.accessibilityLabel = "Open Options Menu"
    closeBtn.accessibilityLabel = "Close Options Menu"
    rollBtn.accessibilityLabel = "Roll Dice"
}
