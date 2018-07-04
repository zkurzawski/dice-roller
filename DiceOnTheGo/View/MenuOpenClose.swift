//
//  MenuOpenClose.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 5/15/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation
import UIKit

func menuClose(viewConstraint: NSLayoutConstraint, view: UIView, screenWidth: CGFloat) {
    var menuRestingPlace = 0
    
        if screenWidth > 600{
            menuRestingPlace = -460
        } else {
            menuRestingPlace = -340
        }
    
        UIView.animate(withDuration: 0.5, animations: {
            viewConstraint.constant = CGFloat(menuRestingPlace)
            view.layoutIfNeeded()
        })
}

func menuOpen(viewConstraint: NSLayoutConstraint, view: UIView) {
    UIView.animate(withDuration: 0.5, animations: {viewConstraint.constant = 1
        view.layoutIfNeeded()
    })
}
