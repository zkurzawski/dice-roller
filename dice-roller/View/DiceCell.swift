//
//  DiceCell.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/24/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import UIKit

class DiceCell: UICollectionViewCell {
    
    @IBOutlet weak var diceImageCell: UIImageView!
    @IBOutlet weak var diceLblCell: UILabel!

    func updateViews(dice: Dice) {
        diceImageCell.image = UIImage(named: dice.imageName)
        diceLblCell.text = dice.value
    }
}
