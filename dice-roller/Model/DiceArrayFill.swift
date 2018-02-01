//
//  DiceArrayFill.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/18/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation

class DiceArrayFill {
    
    static let instance = DiceArrayFill()
    
    func arrayFill(diceSize: Int, diceQty: Int, d6Choice: Bool) -> [Dice] {
        
        var results: [Dice] = []
        var randValue: Int
        var index = 0
        
//        add in a second repeat while loop for each type of dice
        repeat{
            randValue = Int(arc4random_uniform(UInt32(diceSize)) + 1)
            if d6Choice == true{
                results.append(Dice(imageName: "trad_img\(randValue)", value: "\(randValue)"))
            } else{
                results.append(Dice(imageName: "d\(diceSize)_img\(randValue)", value: "\(randValue)"))
            }
            index += 1
        } while (index < diceQty)
        
        return results
    }
    
    
}
