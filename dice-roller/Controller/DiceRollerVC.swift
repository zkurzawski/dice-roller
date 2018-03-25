//
//  DiceRollerVC.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/12/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import UIKit

class DiceRollerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
   
    @IBOutlet weak var d4Stepper: UIStepper!
    @IBOutlet weak var d6Stepper: UIStepper!
    @IBOutlet weak var d8Stepper: UIStepper!
    @IBOutlet weak var d10Stepper: UIStepper!
    @IBOutlet weak var d12Stepper: UIStepper!
    @IBOutlet weak var d20Stepper: UIStepper!
    @IBOutlet weak var d100Stepper: UIStepper!
    
    @IBOutlet weak var d4QtyLbl: UILabel!
    @IBOutlet weak var d6QtyLbl: UILabel!
    @IBOutlet weak var d8QtyLbl: UILabel!
    @IBOutlet weak var d10QtyLbl: UILabel!
    @IBOutlet weak var d12QtyLbl: UILabel!
    @IBOutlet weak var d20QtyLbl: UILabel!
    @IBOutlet weak var d100QtyLbl: UILabel!
    
    @IBOutlet weak var d6DDImg: SelectedSixSidedImage!
    @IBOutlet weak var d6TradImg: SelectedSixSidedImage!
    
    @IBOutlet weak var diceSizeLbl: UILabel!
    @IBOutlet weak var diceQtyLbl: UILabel!
    
    @IBOutlet weak var diceCollectionView: UICollectionView!

    
// Unused Variables
//    var resetValue = false
//    var stepperQty = 0
//    var segmentedSelectionResult = 0

    
    var diceQtyLblsArr:[UILabel] = []
    var diceStepperArr:[UIStepper] = []
    var diceQtyArr:[Double] = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    
    var diceQty = 1
    var diceSize = 6
    var d6Choice = false
    
    var diceTypeQty = [Int]()
    var diceTypeQtyLbls = [UILabel]()
    
    private(set) public var dice: [Dice] = []
    
    override func viewDidLoad() {

        diceStepperArr = [d4Stepper, d6Stepper, d8Stepper, d10Stepper,d12Stepper, d20Stepper, d100Stepper]
        diceQtyLblsArr = [d4QtyLbl, d6QtyLbl, d8QtyLbl, d10QtyLbl, d12QtyLbl, d20QtyLbl, d100QtyLbl]
        diceCollectionView.delegate = self
        diceCollectionView.dataSource = self
    
        d6DDImg.isHighlighted = true
        d6TradImg.isHighlighted = false
        
       /* diceTypeQtyLbls = [diceChoiceLbl00, diceChoiceLbl01, diceChoiceLbl02, diceChoiceLbl03, diceChoiceLbl04, diceChoiceLbl05, diceChoiceLbl06]
        
        super.viewDidLoad()
        d6SelectionLbl.selected()
        traditionalSelectedLbl.deselected()
        d6StackView.isHidden = false
        diceTypeImage.image = UIImage(named: "d6_img5.png")
 */
        
        viewConstraint.constant = -340
       
        diceSizeLbl.text = "Dice Size: d\(diceSize)"
        diceQtyLbl.text = "Number of Dice: \(diceQty)"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dice.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "diceCell", for: indexPath) as? DiceCell {
            let dice = self.dice[indexPath.row]
            cell.updateViews(dice: dice)
            return cell
        }
        return DiceCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((self.view.frame.size.width - 20) / 5)
        let height = (width * 1.5)
        return CGSize(width: ((self.view.frame.size.width - 20) / 5), height: height)
    }
    
    @IBAction func panGestureDone(_ sender: UIPanGestureRecognizer) {
        panActivated(viewConstraint: viewConstraint, panInfo: sender)
    }
    
    @IBAction func rollBtn(_ sender: UIButton) {
        dice = DiceArrayFill.instance.arrayFill(diceQty: diceQty, d6Choice: d6Choice, diceQtyArr: diceQtyArr)
        diceCollectionView.reloadData()
    }
    
    @IBAction func d4Step(_ sender: UIStepper) {
        diceQtyArr[0] = diceStepSelection(stepValue: sender, stepLbl: d4QtyLbl)
//        print("dice qty array values: \(diceQtyArr)")
    }
    @IBAction func d6Step(_ sender: UIStepper) {
        diceQtyArr[1] = diceStepSelection(stepValue: sender, stepLbl: d6QtyLbl)
//        print("dice qty array values: \(diceQtyArr)")
    }
    @IBAction func d8Step(_ sender: UIStepper) {
        diceQtyArr[2] = diceStepSelection(stepValue: sender, stepLbl: d8QtyLbl)
//        print("dice qty array values: \(diceQtyArr)")
    }
    @IBAction func d10Step(_ sender: UIStepper) {
        diceQtyArr[3] = diceStepSelection(stepValue: sender, stepLbl: d10QtyLbl)
//        print("dice qty array values: \(diceQtyArr)")
    }
    @IBAction func d12Step(_ sender: UIStepper) {
        diceQtyArr[4] = diceStepSelection(stepValue: sender, stepLbl: d12QtyLbl)
//        print("dice qty array values: \(diceQtyArr)")
    }
    @IBAction func d20Step(_ sender: UIStepper) {
        diceQtyArr[5] = diceStepSelection(stepValue: sender, stepLbl: d20QtyLbl)
//        print("dice qty array values: \(diceQtyArr)")
    }
    @IBAction func d100Step(_ sender: UIStepper) {
        diceQtyArr[6] = diceStepSelection(stepValue: sender, stepLbl: d100QtyLbl)
//        print("dice qty array values: \(diceQtyArr)")
    }
    
    @IBAction func d6AppearanceSwitch(_ sender: UISwitch) {
        d6Choice = d6SwitchOnOff(d6AppearenceSwitch: sender, d6DDImg: d6DDImg, d6TradImg: d6TradImg)
//        print("switch set to \(d6Choice)")
        /*if sender.isOn {
            d6DDImg.deselected()
            d6TradImg.selected()
        } else {
            d6DDImg.selected()
            d6TradImg.deselected()
        }*/
    }
    
    @IBAction func menuReset(_ sender: UIButton) {
        diceQtyArr = ResetButton.instance.resetAllMenuItems(diceQtyLbls: diceQtyLblsArr, diceStepVal: diceStepperArr)
    }
}
