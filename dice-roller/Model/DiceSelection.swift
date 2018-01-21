//
//  DiceSelection.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/20/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation

func diceSizeSelect(selected: Int) -> Int {
    
    var diceSize = 4
    
    switch selected {
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
        diceSize = 4
    }
    
    return diceSize
}

func sixSideStackViewVisible (selected: Int) -> Bool {
    var hideMarker: Bool
    
    if selected == 1 {
        hideMarker = false
    } else {
        hideMarker = true
    }
    return hideMarker
}
