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
    
    func arrayFill(diceQty: Int, d6Choice: Bool, diceQtyArr: [Double]) -> [Dice] {
        
        var diceSize = 0
        var results: [Dice] = []
        var randValue: Int
        var index = 0
        
        for i in 0...6 {
            if diceQtyArr[i] > 0 {
                index = 0
                diceSize = diceSizeAssignment(indexValue: i)
//
//     CREATE A FUNCTION THAT DEALS WITH THE DICE SIZE. A SWITCH BASED ON THE i VALUE
//
                repeat {
                    randValue = Int(arc4random_uniform(UInt32(diceSize)) + 1)
                    if (diceSize == 6 && d6Choice == true){
                        results.append(Dice(imageName: "trad_img\(randValue)", value: "\(randValue)"))
                    } else{
                        results.append(Dice(imageName: "d\(diceSize)_img\(randValue)", value: "\(randValue)"))
                    }
                    index += 1
                    
                    
//                    print("entering value \(index) into the array")
//                    index += 1
                } while (index < Int(diceQtyArr[i]))
//                print("dice qty arry \(i) has \(Int(diceQtyArr[i])) dice in it")
            }
        }
/*
//        add in a second repeat while loop for each type of dice
        repeat{
            randValue = Int(arc4random_uniform(UInt32(diceSize)) + 1)
            if (diceSize == 6 && d6Choice == true){
                results.append(Dice(imageName: "trad_img\(randValue)", value: "\(randValue)"))
            } else{
                results.append(Dice(imageName: "d\(diceSize)_img\(randValue)", value: "\(randValue)"))
            }
            index += 1
        } while (index < diceQty)
 */
        return results
 
    }
    
    func diceSizeAssignment(indexValue: Int) -> Int {
        var diceSize = 0
        
        switch indexValue {
        case 0:
            diceSize = 4
        case 1:
            diceSize = 6
        case 2:
            diceSize = 8
        case 3:
            diceSize = 10
        case 4:
            diceSize = 12
        case 5:
            diceSize = 20
        case 6:
            diceSize = 100
        default:
            diceSize = 6
        }
        
        return diceSize
    }
}
