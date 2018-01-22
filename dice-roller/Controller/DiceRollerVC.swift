//
//  DiceRollerVC.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/12/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import UIKit

class DiceRollerVC: UIViewController {

    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    @IBOutlet weak var diceSliderValueLbl: UILabel!
    @IBOutlet weak var d6SelectionLbl: SixSidedLabel!
    @IBOutlet weak var traditionalSelectedLbl: SixSidedLabel!
    @IBOutlet weak var d6TypeImage: UIImageView!
    @IBOutlet weak var d6StackView: UIStackView!
  
    var diceQty = 1
    var diceSize = 6
    
    var gestureTest = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        d6SelectionLbl.selected()
        traditionalSelectedLbl.deselected()
        d6StackView.isHidden = false
        d6TypeImage.image = UIImage(named: "d6_img5.png")
        viewConstraint.constant = -320
    }

    @IBAction func panGestureDone(_ sender: UIPanGestureRecognizer) {
        panActivated(viewConstraint: viewConstraint, panInfo: sender)
    }
   
    @IBAction func diceSliderChange(_ sender: UISlider) {
        diceQty = Int(sender.value)
        diceSliderValueLbl.text = "Number of Dice in Play: \(diceQty)"
    }
   
    @IBAction func diceSelectionSegCntrl(_ sender: UISegmentedControl) {
        d6StackView.isHidden = sixSideStackViewVisible(selected: sender.selectedSegmentIndex)
        diceSize = diceSizeSelect(selected: sender.selectedSegmentIndex)
        d6TypeImage.image = UIImage(named: "d\(diceSize)_img5")
    }
    
    @IBAction func sixSidedTypeChose(_ sender: UISwitch) {
        if (sender.isOn == false) {
            traditionalSelectedLbl.deselected()
            d6SelectionLbl.selected()
        } else {
            traditionalSelectedLbl.selected()
            d6SelectionLbl.deselected()
        }
    }
    
    
}
