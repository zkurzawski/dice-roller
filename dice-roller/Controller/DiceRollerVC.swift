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
    var diceSize = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        d6SelectionLbl.selected()
        traditionalSelectedLbl.deselected()
        d6StackView.isHidden = true
        d6TypeImage.image = UIImage(named: "d4_img5.png")
        diceSize = 4
    }

    @IBAction func panGestureDone(_ sender: UIPanGestureRecognizer) {
    }
   
    @IBAction func diceSliderChange(_ sender: UISlider) {
        diceQty = Int(sender.value)
        diceSliderValueLbl.text = "Number of Dice in Play: \(diceQty)"
    }
   
    @IBAction func diceSelectionSegCntrl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 1 {
            d6StackView.isHidden = false
        } else {
            d6StackView.isHidden = true
        }
        
        switch sender.selectedSegmentIndex {
        case 0:
            diceSize = 4
        case 1:
            diceSize = 6
        case 2:
            diceSize = 8
        case 3:
            diceSize = 10
        case 4:
            diceSize = 12
        case 5:
            diceSize = 20
        case 6:
            diceSize = 100
        default:
            diceSize = 4
        }
  
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
