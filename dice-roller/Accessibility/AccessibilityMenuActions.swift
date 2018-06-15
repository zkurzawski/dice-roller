//
//  MenuAccessibilityActions.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 6/10/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation
import UIKit

func accessibilityOpenMenu(viewConstraint: NSLayoutConstraint, optionsBtn: UIButton, rollBtn: UIButton, userDirections: UILabel, view: UIView) {
    UIView.animate(withDuration: 0.5, animations: {
        viewConstraint.constant = 1
        view.layoutIfNeeded()
    })
    
//    optionsBtn.isHidden = true
//    rollBtn.isHidden = true
//    userDirections.isHidden = true
}

func accessibilityCloseMenu(viewConstraint: NSLayoutConstraint, screenWidth: CGFloat, optionsBtn: UIButton, rollBtn: UIButton, userDirections: UILabel, view: UIView, diceRolled: Bool) {
    UIView.animate(withDuration: 0.5, animations: {
        if screenWidth > 600 {
            viewConstraint.constant = -460
        } else {
            viewConstraint.constant = -340
        }
        view.layoutIfNeeded()
    })

    optionsBtn.isHidden = false
    rollBtn.isHidden = false
    if !diceRolled {
        userDirections.isHidden = false
    }
}

