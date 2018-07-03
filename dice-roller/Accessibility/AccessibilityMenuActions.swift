//
//  MenuAccessibilityActions.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 6/10/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//
//  Opening and closing the options menu with the accessibility buttons
//  Assigning the accessibility focus after menu opened and closed
//

import Foundation
import UIKit

func accessibilityOpenMenu(viewConstraint: NSLayoutConstraint, optionsBtn: UIButton, rollBtn: UIButton, menuCloseBtn: UIButton, userDirections: UILabel, view: UIView) {
    UIView.animate(withDuration: 0.5, animations: {
        viewConstraint.constant = 1
        view.layoutIfNeeded()
    })
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, menuCloseBtn)
}

func accessibilityCloseMenu(viewConstraint: NSLayoutConstraint, screenWidth: CGFloat, optionsBtn: UIButton, rollBtn: UIButton, userDirections: UILabel, resultsLbl:UILabel, view: UIView, diceRolled: Bool) {
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
        resultsLbl.isHidden = false
        userDirections.isHidden = false
    }
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, rollBtn)

}

