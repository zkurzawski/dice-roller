//
//  DiceRollerVC.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/12/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import UIKit

class DiceRollerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
   
    @IBOutlet weak var diceSliderValueLbl: UILabel!
    @IBOutlet weak var d6SelectionLbl: SixSidedLabel!
    @IBOutlet weak var traditionalSelectedLbl: SixSidedLabel!
    @IBOutlet weak var d6TypeImage: UIImageView!
    @IBOutlet weak var d6StackView: UIStackView!
    
    @IBOutlet weak var diceSizeLbl: UILabel!
    @IBOutlet weak var diceQtyLbl: UILabel!
    
    @IBOutlet weak var diceCollectionView: UICollectionView!
    
    var diceQty = 1
    var diceSize = 6
    
    private(set) public var dice: [Dice] = []
    
    override func viewDidLoad() {
        diceCollectionView.delegate = self
        diceCollectionView.dataSource = self
        
        super.viewDidLoad()
        d6SelectionLbl.selected()
        traditionalSelectedLbl.deselected()
        d6StackView.isHidden = false
        d6TypeImage.image = UIImage(named: "d6_img5.png")
        
        viewConstraint.constant = -320
       
        diceSizeLbl.text = "Dice Size: d\(diceSize)"
        diceQtyLbl.text = "Number of Dice: \(diceQty)"
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

    @IBAction func panGestureDone(_ sender: UIPanGestureRecognizer) {
        panActivated(viewConstraint: viewConstraint, panInfo: sender)
    }
   
    @IBAction func diceSliderChange(_ sender: UISlider) {
        diceQty = Int(sender.value)
        diceSliderValueLbl.text = "Number of Dice in Play: \(diceQty)"
        diceQtyLbl.text = "Number of Dice: \(diceQty)"
    }
   
    @IBAction func diceSelectionSegCntrl(_ sender: UISegmentedControl) {
        d6StackView.isHidden = sixSideStackViewVisible(selected: sender.selectedSegmentIndex)
        diceSize = diceSizeSelect(selected: sender.selectedSegmentIndex)
        d6TypeImage.image = UIImage(named: "d\(diceSize)_img5")
        diceSizeLbl.text = "Dice Size: d\(diceSize)"
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
    
    @IBAction func rollBtn(_ sender: UIButton) {
        dice = DiceArrayFill.instance.arrayFill(diceSize: diceSize, diceQty: diceQty)
        diceCollectionView.reloadData()
//        print(dice)
    }
    
}
