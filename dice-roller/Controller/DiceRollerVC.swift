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
   
    @IBOutlet weak var d4QtyLbl: UILabel!
    @IBOutlet weak var d6QtyLbl: UILabel!
    @IBOutlet weak var d8QtyLbl: UILabel!
    @IBOutlet weak var d10QtyLbl: UILabel!
    @IBOutlet weak var d12QtyLbl: UILabel!
    @IBOutlet weak var d20QtyLbl: UILabel!
    @IBOutlet weak var d100QtyLbl: UILabel!
    
    @IBOutlet weak var d6DDImg: UIImageView!
    @IBOutlet weak var d6TradImg: UIImageView!
    
    @IBOutlet weak var diceSizeLbl: UILabel!
    @IBOutlet weak var diceQtyLbl: UILabel!
    
    @IBOutlet weak var diceCollectionView: UICollectionView!
    
//    stepper test
    
    var stepperQty = 0
    
    var diceQtyArr = [0.0,0.0,3.0,0.0,0.0,0.0,0.0]
    var resetValue = false
//
    
    var diceQty = 1
    var diceSize = 6
    var d6Choice = false
    
    var diceTypeQty = [Int]()
    var diceTypeQtyLbls = [UILabel]()
    
    var segmentedSelectionResult = 0
    
    private(set) public var dice: [Dice] = []
    
    override func viewDidLoad() {
        
        diceCollectionView.delegate = self
        diceCollectionView.dataSource = self
    
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
   
    
  /*  @IBAction func sixSidedTypeChose(_ sender: UISwitch) {
        d6Choice = sender.isOn
        OptionsResults.instance.sixSidedTypeChoose(d6TypeLbl: d6SelectionLbl, tradTypeLbl: traditionalSelectedLbl, d6TradImage: diceTypeImage, switchResult: sender)
    } */
    
    @IBAction func rollBtn(_ sender: UIButton) {
        dice = DiceArrayFill.instance.arrayFill(diceSize: diceSize, diceQty: diceQty, d6Choice: d6Choice)
        diceCollectionView.reloadData()
    }
    
/*    stepper test actions
    @IBAction func qtyStep(_ sender: UIStepper) {
        
       /******************************************
        ******************************************
        Some indicator that the step has been made
        so the value can increment/decrement. As
        it is, the code sees that the value isn't 0
        and refuses to change it from the if
        statement.
        *******************************************
        ******************************************/
        
        if (diceQtyArr[2] > 0) && (resetValue == false) {
            sender.value = diceQtyArr[2]
            resetValue = true
        }
        stepperQty = Int(sender.value)
//        stepperLbl.text = "\(Int(sender.value))"
        stepperLbl.text = "\(stepperQty)"
        
    }
*/
    
}
