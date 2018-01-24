//
//  DiceCell.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/23/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import UIKit

class DiceCell: UICollectionViewCell {
    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var diceValue: UILabel!
    
    func updateViews(dice: Dice) {
        diceImage.image = UIImage(named: dice.imageName)
        diceValue.text = dice.value
    }
}
