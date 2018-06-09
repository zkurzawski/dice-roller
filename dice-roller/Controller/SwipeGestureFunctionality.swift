//
//  SwipeGestureFunctionality.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 5/15/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation
import UIKit

func leftSwipeActivated(viewConstraint: NSLayoutConstraint, swipeInfo: UISwipeGestureRecognizer, screenWidth: CGFloat) {
    var menuRestingPlace = 0
    
    if screenWidth > 600{
        menuRestingPlace = -460
    } else {
        menuRestingPlace = -340
    }
    
    UIView.animate(withDuration: 0.5, animations: {
        viewConstraint.constant = CGFloat(menuRestingPlace)
        swipeInfo.view?.layoutIfNeeded()
    })
}

func rightSwipeActivated(viewConstraint: NSLayoutConstraint, swipeInfo: UISwipeGestureRecognizer, screenWidth: CGFloat) {
    UIView.animate(withDuration: 0.5, animations: {
        viewConstraint.constant = 1
        swipeInfo.view?.layoutIfNeeded()
        })
}
