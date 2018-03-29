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
        var percentileValue = " "
        
        for i in 0...6 {
            if diceQtyArr[i] > 0 {
                index = 0
                diceSize = diceSizeAssignment(indexValue: i)

                repeat {
                    randValue = Int(arc4random_uniform(UInt32(diceSize)) + 1)
                    if (diceSize == 6 && d6Choice == true){
                        results.append(Dice(imageName: "trad_img\(randValue)", value: "\(randValue)"))
                    } else if (diceSize == 50){
                        percentileValue = percetileDiceAssignment(rollValue: (randValue * 2))
                        results.append(Dice(imageName: "d%img" + percentileValue , value: percentileValue))
                    } else {
                        results.append(Dice(imageName: "d\(diceSize)img\(randValue)", value: "\(randValue)"))
                    }
                    index += 1
                } while (index < Int(diceQtyArr[i]))
            }
        }
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
            diceSize = 50
        default:
            diceSize = 6
        }
        return diceSize
    }
    
    func percetileDiceAssignment(rollValue: Int) -> String {
        var percentValue = " "
        
        switch rollValue {
        case _ where (rollValue >= 0 && rollValue < 10) :
            percentValue = "00"
        case _ where (rollValue >= 10 && rollValue < 20) :
            percentValue = "10"
        case _ where (rollValue >= 20 && rollValue < 30) :
            percentValue = "20"
        case _ where (rollValue >= 30 && rollValue < 40) :
            percentValue = "30"
        case _ where (rollValue >= 40 && rollValue < 50) :
            percentValue = "40"
        case _ where (rollValue >= 50 && rollValue < 60) :
            percentValue = "50"
        case _ where (rollValue >= 60 && rollValue < 70) :
            percentValue = "60"
        case _ where (rollValue >= 70 && rollValue < 80) :
            percentValue = "70"
        case _ where (rollValue >= 80 && rollValue < 90) :
            percentValue = "80"
        case _ where (rollValue >= 90 && rollValue < 100) :
            percentValue = "90"
        default:
            percentValue = "00"
        }
        return percentValue
    }
}

