//
//  PanGestureFunctionality.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/21/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation
import UIKit

func panActivated (viewConstraint: NSLayoutConstraint, panInfo: UIPanGestureRecognizer) {
    if (panInfo.state == .began || panInfo.state == .changed){
        let translation = panInfo.translation(in: panInfo.view).x
        if translation > 0 {
            if viewConstraint.constant < 40 {
                UIView.animate(withDuration: 0.5, animations: {
                    viewConstraint.constant += translation / 10
                    panInfo.view?.layoutIfNeeded()

                })
            }
        } else {
            if viewConstraint.constant > -320 {
                UIView.animate(withDuration: 0.5, animations: {
                    viewConstraint.constant += translation / 10
                    panInfo.view?.layoutIfNeeded()
                })
            }
        }
    } else if panInfo.state == .ended {
        if viewConstraint.constant < -110 {
            UIView.animate(withDuration: 0.5, animations: {
                viewConstraint.constant = -340
                panInfo.view?.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                viewConstraint.constant = 0
                panInfo.view?.layoutIfNeeded()
            })
        }
    }
    
}
    

