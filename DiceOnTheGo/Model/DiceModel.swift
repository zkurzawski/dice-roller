//
//  DiceModel.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/22/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//
//  Define the Dice struct
//

import Foundation

struct Dice {
    private(set) public var imageName: String
    private(set) public var value: String
    private(set) public var diceType: String
    
    init(imageName: String, value: String, diceType: String){
        self.imageName = imageName
        self.value = value
        self.diceType = diceType
    }
    
}
