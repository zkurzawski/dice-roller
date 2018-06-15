//
//  DiceRollerVC.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/12/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import UIKit

class DiceRollerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tradBtn: UIButton!
    @IBOutlet weak var ddBtn: UIButton!

    @IBOutlet weak var rollBtn: ButtonAppearance!
    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
   
//    test button for accesibility
    @IBOutlet weak var optionsButton: UIButton!
    @IBOutlet weak var closeOptionsBtn: UIButton!
    
    @IBOutlet weak var startingDirectionLbl: UILabel!
    
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
    
    @IBOutlet weak var diceCollectionView: UICollectionView!
    
    var diceQtyLblsArr:[UILabel] = []
    var diceStepperArr:[UIStepper] = []
    var diceQtyArr:[Double] = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    var hiddenBtns:[UIButton] = []
    var hiddenLbls:[UILabel] = []
    
    var diceQty = 1
    var diceSize = 6
    var d6Choice = true
    
    var dieHasBeenSelected = false
    
    var diceTypeQty = [Int]()
    var diceTypeQtyLbls = [UILabel]()
        
    private(set) public var dice: [Dice] = []
    
    override func viewDidLoad() {
        
        accessibilityValueInitializer(rollBtn: rollBtn, optionsBtn: optionsButton, closeBtn: closeOptionsBtn)
 
        diceStepperArr = [d4Stepper, d6Stepper, d8Stepper, d10Stepper,d12Stepper, d20Stepper, d100Stepper]
        diceQtyLblsArr = [d4QtyLbl, d6QtyLbl, d8QtyLbl, d10QtyLbl, d12QtyLbl, d20QtyLbl, d100QtyLbl]
        
        hiddenLbls = [startingDirectionLbl]
        hiddenBtns = [optionsButton, rollBtn]
        
        diceCollectionView.delegate = self
        diceCollectionView.dataSource = self
       
        if self.view.frame.width > 600{
            viewConstraint.constant = -460
            
        } else {
            viewConstraint.constant = -340
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("you shook me")
        diceRolled()
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
    
    func diceRolled() {
        if dieHasBeenSelected{
            startingDirectionLbl.isHidden = true
        }
        dice = DiceArrayFill.instance.arrayFill(diceQty: diceQty, d6Choice: d6Choice, diceQtyArr: diceQtyArr)
        diceCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        if self.view.frame.width > 600 {
            width = ((self.view.frame.size.width - 20) / 6)
        } else {
            width = ((self.view.frame.size.width - 20) / 5)
        }
        let height = width
//        let height = (width * 1.7)
        return CGSize(width: width, height: height)
    }
    
    @IBAction func openOptions(_ sender: UIButton) {
        accessibilityOpenMenu(viewConstraint: viewConstraint, optionsBtn: optionsButton, rollBtn: rollBtn, userDirections: startingDirectionLbl, view: self.view)
        hideUnhideMainViewElements(optionsBtn: optionsButton, rollBtn: rollBtn, dirLbl: startingDirectionLbl, onOff: true)
    }
    
    @IBAction func closeOptions(_ sender: UIButton) {
        accessibilityCloseMenu(viewConstraint: viewConstraint, screenWidth: self.view.frame.width, optionsBtn: optionsButton, rollBtn: rollBtn, userDirections: startingDirectionLbl, view: self.view, diceRolled: dieHasBeenSelected)
        hideUnhideMainViewElements(optionsBtn: optionsButton, rollBtn: rollBtn, dirLbl: startingDirectionLbl, onOff: false)
    }
    
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        leftSwipeActivated(viewConstraint: viewConstraint, swipeInfo: sender, screenWidth: self.view.frame.width)
        hideUnhideMainViewElements(optionsBtn: optionsButton, rollBtn: rollBtn, dirLbl: startingDirectionLbl, onOff: false)
    }
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        rightSwipeActivated(viewConstraint: viewConstraint, swipeInfo: sender, screenWidth: self.view.frame.width)
    }
    
    @IBAction func rollBtn(_ sender: UIButton) {
        diceRolled()
    }
    
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
    
    @IBAction func menuReset(_ sender: UIButton) {
        diceQtyArr = ResetButton.instance.resetAllMenuItems(diceQtyLbls: diceQtyLblsArr, diceStepVal: diceStepperArr)
        dice = DiceArrayFill.instance.arrayFill(diceQty: diceQty, d6Choice: d6Choice, diceQtyArr: diceQtyArr)
        diceCollectionView.reloadData()
        startingDirectionLbl.isHidden = false
        dieHasBeenSelected = false
    }
    
    @IBAction func ddBtnPushed(_ sender: UIButton) {
        d6Choice = false
        d6TypeSelected(btnPushed: ddBtn, btnNotPushed: tradBtn, d6Chosen: d6Choice)
    }
    
    @IBAction func tradBtnPushed(_ sender: UIButton) {
        d6Choice = true
        d6TypeSelected(btnPushed: tradBtn, btnNotPushed: ddBtn, d6Chosen: d6Choice)
    }
    
}
