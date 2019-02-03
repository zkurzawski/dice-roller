//
//  DiceOnTheGo.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/12/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import UIKit
import StoreKit

class DiceOnTheGo: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//  Main View Element IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var optionsButton: UIButton!
    @IBOutlet weak var rollBtn: ButtonAppearance!
    @IBOutlet weak var rollResultsLbl: UILabel!
    @IBOutlet weak var startingDirectionLbl: UILabel!
    @IBOutlet weak var diceCollectionView: UICollectionView!

//  Sliding Menu View IBOtlet
    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    
//  Sliding Menu Element IBOutlets
    @IBOutlet weak var closeOptionsBtn: UIButton!
    
//  Dice Quantity Selection Stepper IBOutlets
    @IBOutlet weak var d4Stepper: UIStepper!
    @IBOutlet weak var d6Stepper: UIStepper!
    @IBOutlet weak var d8Stepper: UIStepper!
    @IBOutlet weak var d10Stepper: UIStepper!
    @IBOutlet weak var d12Stepper: UIStepper!
    @IBOutlet weak var d20Stepper: UIStepper!
    @IBOutlet weak var d100Stepper: UIStepper!
    
//  Dice Quantity Selection Label IBOutlets
    @IBOutlet weak var d4QtyLbl: UILabel!
    @IBOutlet weak var d6QtyLbl: UILabel!
    @IBOutlet weak var d8QtyLbl: UILabel!
    @IBOutlet weak var d10QtyLbl: UILabel!
    @IBOutlet weak var d12QtyLbl: UILabel!
    @IBOutlet weak var d20QtyLbl: UILabel!
    @IBOutlet weak var d100QtyLbl: UILabel!
    
//  D6 Image Style Selection Button IBOutlet
    @IBOutlet weak var d6StyleBtn: UIButton!
    
    
    var diceQtyLblsArr:[UILabel] = []
    var diceStepperArr:[UIStepper] = []
    var diceQtyArr:[Double] = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]

    var diceQty = 1
    
    var d6Choice = true
    
    var dieHasBeenSelected = false
    
    private(set) public var dice: [Dice] = []
    
    override func viewDidLoad() {
        
        reviewRequest()
        
        accessibilityValueInitializer(rollBtn: rollBtn, optionsBtn: optionsButton, closeBtn: closeOptionsBtn)
        
        diceStepperArr = [d4Stepper, d6Stepper, d8Stepper, d10Stepper,d12Stepper, d20Stepper, d100Stepper]
        diceQtyLblsArr = [d4QtyLbl, d6QtyLbl, d8QtyLbl, d10QtyLbl, d12QtyLbl, d20QtyLbl, d100QtyLbl]

        diceCollectionView.delegate = self
        diceCollectionView.dataSource = self
       
        if self.view.frame.width > 600{
            viewConstraint.constant = -460
        } else {
            viewConstraint.constant = -340
        }
        
        d6StyleBtn.accessibilityLabel = "D 6 Appearance"
        d6StyleBtn.accessibilityValue = d6BtnAccessibilityValueAssignment(d6Choice: d6Choice)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
//  Shake phone to roll dice
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if viewConstraint.constant < 0 && dieHasBeenSelected {
            diceRolled()
        }
    }
    
//  Define number of collection view cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dice.count
    }
    
//  Fill collection view cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "diceCell", for: indexPath) as? DiceCell {
            let dice = self.dice[indexPath.row]
            cell.updateViews(dice: dice)
            cell.isAccessibilityElement = true
            cell.accessibilityValue = "\(dice.diceType), value \(dice.value)"
            return cell
        }
        return DiceCell()
    }

//  Define size of collection view cells based on device size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        if self.view.frame.width > 600 {
            width = ((self.view.frame.size.width - 20) / 6)
        } else {
            width = ((self.view.frame.size.width - 20) / 5)
        }   
        let height = width
        return CGSize(width: width, height: height)
    }

//  Fill dice array, reload collection view, hide directions from main view
    func diceRolled() {
        diceCollectionView.collectionViewLayout.invalidateLayout()
        dice = DiceArrayFill.instance.arrayFill(diceQty: diceQty, d6Choice: d6Choice, diceQtyArr: diceQtyArr)
        diceCollectionView.reloadData()
        diceCollectionView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: false)
        if dieHasBeenSelected{
            startingDirectionLbl.isHidden = true
            if UIAccessibility.isVoiceOverRunning {
                rollResultsLbl.isHidden = false
                UIAccessibility.post(notification: UIAccessibility.Notification.layoutChanged, argument: rollResultsLbl)
            } else {
                rollResultsLbl.isHidden = true
            }
        }
    }

//  Open options menu button for accessibility
    @IBAction func openOptions(_ sender: UIButton) {
        mainView.accessibilityElementsHidden = true
        menuOpen(viewConstraint: viewConstraint, view: self.view)
        UIAccessibility.post(notification: UIAccessibility.Notification.layoutChanged, argument: closeOptionsBtn)
        hideUnhideMainViewElements(optionsBtn: optionsButton, rollBtn: rollBtn, dirLbl: startingDirectionLbl, resultsLbl: rollResultsLbl, onOff: true, dieSelected: dieHasBeenSelected)
    }

//  Close options menu for accessibility
    @IBAction func closeOptions(_ sender: UIButton) {
        mainView.accessibilityElementsHidden = false
        menuClose(viewConstraint: viewConstraint, view: self.view, screenWidth: self.view.frame.width)
        UIAccessibility.post(notification: UIAccessibility.Notification.layoutChanged, argument: rollBtn)
        hideUnhideMainViewElements(optionsBtn: optionsButton, rollBtn: rollBtn, dirLbl: startingDirectionLbl, resultsLbl: rollResultsLbl, onOff: false, dieSelected: dieHasBeenSelected)
    }
    
//  Swipe left to close options menu
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        menuClose(viewConstraint: viewConstraint, view: self.view, screenWidth: self.view.frame.width)
    }
    
//  Swipe right to open options menu
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        menuOpen(viewConstraint: viewConstraint, view: self.view)
    }
    
//  Roll button IBAction
    @IBAction func rollBtn(_ sender: UIButton) {
        diceRolled()
    }
    
//  Dice type quantity stepper IBActions
    @IBAction func d4Step(_ sender: UIStepper) {
        diceQtyArr[0] = diceStepSelection(stepValue: sender, stepLbl: d4QtyLbl)
        dieHasBeenSelected = true
    }
    @IBAction func d6Step(_ sender: UIStepper) {
        diceQtyArr[1] = diceStepSelection(stepValue: sender, stepLbl: d6QtyLbl)
        dieHasBeenSelected = true
    }
    @IBAction func d8Step(_ sender: UIStepper) {
        diceQtyArr[2] = diceStepSelection(stepValue: sender, stepLbl: d8QtyLbl)
        dieHasBeenSelected = true
    }
    @IBAction func d10Step(_ sender: UIStepper) {
        diceQtyArr[3] = diceStepSelection(stepValue: sender, stepLbl: d10QtyLbl)
        dieHasBeenSelected = true
    }
    @IBAction func d12Step(_ sender: UIStepper) {
        diceQtyArr[4] = diceStepSelection(stepValue: sender, stepLbl: d12QtyLbl)
        dieHasBeenSelected = true
    }
    @IBAction func d20Step(_ sender: UIStepper) {
        diceQtyArr[5] = diceStepSelection(stepValue: sender, stepLbl: d20QtyLbl)
        dieHasBeenSelected = true
    }
    @IBAction func d100Step(_ sender: UIStepper) {
        diceQtyArr[6] = diceStepSelection(stepValue: sender, stepLbl: d100QtyLbl)
        dieHasBeenSelected = true
    }
    
//  Clear all dice selection choices, unhide directions label
    @IBAction func menuReset(_ sender: UIButton) {
        diceQtyArr = resetAllBtn(diceQtyLbl: diceQtyLblsArr, diceStepperVal: diceStepperArr, rollResults: rollResultsLbl)
        dice = DiceArrayFill.instance.arrayFill(diceQty: diceQty, d6Choice: d6Choice, diceQtyArr: diceQtyArr)
        diceCollectionView.reloadData()
        startingDirectionLbl.isHidden = false
        dieHasBeenSelected = false
    }

//  Select d6 image style
    @IBAction func d6StyleBtnPushed(_ sender: UIButton) {
        d6Choice = d6TypeSelected(d6SelectBtn: d6StyleBtn, d6Chosen: d6Choice)
        d6StyleBtn.accessibilityValue = d6BtnAccessibilityValueAssignment(d6Choice: d6Choice)
    }
}
