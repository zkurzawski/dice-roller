//
//  AccessibilityDiceQtyStepper.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 6/23/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//
//  Make the steppers adjustable accessibility objects
//

import Foundation
import UIKit

class AccessibilityDiceQtyStepper: UIView {
    
//    Assign the elements for dice selection accessibility
    
    static let DICE_TYPE_TAG = 1
    static let STEPPER_TAG = 3
    static let DICE_QTY_TAG = 2
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var diceQtyLabel: UILabel {
        return viewWithTag(AccessibilityDiceQtyStepper.DICE_QTY_TAG) as! UILabel
    }
    
    var diceTypeLabel: UILabel {
        return viewWithTag(AccessibilityDiceQtyStepper.DICE_TYPE_TAG) as! UILabel
    }
    
    var stepper: UIStepper {
        return viewWithTag(AccessibilityDiceQtyStepper.STEPPER_TAG) as! UIStepper
    }
    
//    Assign accessibility label, hint (none), and traits (none) to be announced when selected.
    
    override public var accessibilityLabel: String? {
        get { return "Dice type \(diceTypeLabel.text!), Current Quantity \(diceQtyLabel.text!)" }
        set {}
    }
    
    override public var accessibilityHint: String? {
        get { return "" }
        set {}
    }
    
    override public var isAccessibilityElement: Bool {
        get { return true }
        set {}
    }
    
    override public var accessibilityTraits: UIAccessibilityTraits {
        get { return UIAccessibilityTraits.adjustable }
        set {}
    }
    
//    Increment the dice value with accessibility enabled
    
    override public func accessibilityIncrement() {
        stepper.value += stepper.stepValue
        stepper.sendActions(for: UIControl.Event.valueChanged)
        UIAccessibility.post(notification: UIAccessibility.Notification.announcement, argument: NSLocalizedString("Dice Type \(diceTypeLabel.text!), Quantity \(diceQtyLabel.text!)", comment: ""))
        if stepper.value == 10.0 {
            UIAccessibility.post(notification: UIAccessibility.Notification.announcement, argument: NSLocalizedString("Dice Type \(diceTypeLabel.text!), Quantity \(diceQtyLabel.text!), Maximum quantity reached", comment: ""))
        }
    }
    
//    Decrement the dice value with accessibility enabled
    
    override public func accessibilityDecrement() {
        stepper.value -= stepper.stepValue
        stepper.sendActions(for: UIControl.Event.valueChanged)
        UIAccessibility.post(notification: UIAccessibility.Notification.announcement, argument: NSLocalizedString("Dice Type \(diceTypeLabel.text!), Quantity \(diceQtyLabel.text!)", comment: ""))
        if stepper.value == 0.0 {
            UIAccessibility.post(notification: UIAccessibility.Notification.announcement, argument: NSLocalizedString("Dice Type \(diceTypeLabel.text!), Quantity \(diceQtyLabel.text!), Minimum quantity reached", comment: ""))
        }
    }
    
}
