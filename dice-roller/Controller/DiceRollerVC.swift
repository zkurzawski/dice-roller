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
   
    @IBOutlet weak var diceSliderValueLbl: UILabel!
    @IBOutlet weak var diceSizeLbl: UILabel!
    @IBOutlet weak var diceQtyLbl: UILabel!
    
    @IBOutlet weak var d6SelectionLbl: SixSidedLabel!
    @IBOutlet weak var traditionalSelectedLbl: SixSidedLabel!
    
    @IBOutlet weak var diceTypeImage: UIImageView!
    @IBOutlet weak var d6StackView: UIStackView!
    
    @IBOutlet weak var diceCollectionView: UICollectionView!
    
    var diceQty = 1
    var diceSize = 6
    var d6Choice = false
  
    private(set) public var dice: [Dice] = []
    
    override func viewDidLoad() {
        
        diceCollectionView.delegate = self
        diceCollectionView.dataSource = self
        
        super.viewDidLoad()
        d6SelectionLbl.selected()
        traditionalSelectedLbl.deselected()
        d6StackView.isHidden = false
        diceTypeImage.image = UIImage(named: "d6_img5.png")
        
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
        let width = ((self.view.frame.size.width - 20) / 4)
        let height = (width * 1.5)
        return CGSize(width: width, height: height)
    }
    
    @IBAction func panGestureDone(_ sender: UIPanGestureRecognizer) {
        panActivated(viewConstraint: viewConstraint, panInfo: sender)
    }
   
    @IBAction func diceSliderChange(_ sender: UISlider) {
        diceQty = Int(sender.value)
        OptionsResults.instance.sliderResults(diceTypeLbl: diceSliderValueLbl, diceQtyLbl: diceQtyLbl, diceQty: diceQty)
    }
   
    @IBAction func diceSelectionSegCntrl(_ sender: UISegmentedControl) {
        diceSize = diceSizeSelect(selected: sender.selectedSegmentIndex)
        OptionsResults.instance.segmentedCntrlResults(d6Stack: d6StackView, diceTypeImg: diceTypeImage, diceSizeLbl: diceSizeLbl, diceSize: diceSize, segmentedChoice: sender)
    }
    
    @IBAction func sixSidedTypeChose(_ sender: UISwitch) {
        d6Choice = sender.isOn
        OptionsResults.instance.sixSidedTypeChoose(d6TypeLbl: d6SelectionLbl, tradTypeLbl: traditionalSelectedLbl, d6TradImage: diceTypeImage, switchResult: sender)
    }
    
    @IBAction func rollBtn(_ sender: UIButton) {
        dice = DiceArrayFill.instance.arrayFill(diceSize: diceSize, diceQty: diceQty, d6Choice: d6Choice)
        diceCollectionView.reloadData()
    }
    
}
