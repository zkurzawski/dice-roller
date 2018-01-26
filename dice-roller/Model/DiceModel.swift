//
//  DiceModel.swift
//  dice-roller
//
//  Created by Zakary Kurzawski on 1/22/18.
//  Copyright © 2018 Zakary Kurzawski. All rights reserved.
//

import Foundation
//import UIKit

struct Dice {
    private(set) public var imageName: String
    private(set) public var value: String
    
    init(imageName: String, value: String){
        self.imageName = imageName
        self.value = value
    }
    
}
