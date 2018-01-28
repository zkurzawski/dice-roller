//
//  OptionsResults.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/27/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation
import UIKit

class OptionsResults{
    static let instance = OptionsResults()
    
    func sliderResults(diceTypeLbl: UILabel, diceQtyLbl: UILabel, diceQty: Int) {
        diceTypeLbl.text = "Number of Dice in Play: \(diceQty)"
        diceQtyLbl.text = "Number of Dice: \(diceQty)"
    }
    
    func segmentedCntrlResults(d6Stack: UIStackView, diceTypeImg: UIImageView, diceSizeLbl: UILabel, diceSize: Int, segmentedChoice: UISegmentedControl) {
        d6Stack.isHidden = sixSideStackViewVisible(selected: segmentedChoice.selectedSegmentIndex)
        diceTypeImg.image = UIImage(named: "d\(diceSize)_img5")
        if diceSize == 100 {
            diceSizeLbl.text = "Dice Size: d%"
        } else {
            diceSizeLbl.text = "Dice Size: d\(diceSize)"
        }
    }
    
    func sixSidedTypeChoose(d6TypeLbl: SixSidedLabel, tradTypeLbl: SixSidedLabel, d6TradImage: UIImageView, switchResult: UISwitch) {
        if (switchResult.isOn == false) {
            tradTypeLbl.deselected()
            d6TypeLbl.selected()
            d6TradImage.image = UIImage(named: "d6_img5")
        } else {
            tradTypeLbl.selected()
            d6TypeLbl.deselected()
            d6TradImage.image = UIImage(named: "trad_img5")
        }
    }
}
