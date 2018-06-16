//
//  DisplayController.swift
//  자판기
//
//  Created by 김민웅 on 08/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import Foundation
import UIKit

protocol DisplayDelegate: class {
    func display()
}

enum Operator: String {
    case addition = "+"
    case subtraction = "-"
    
    var calculate: (Int, Int) -> Int {
        switch self {
        case .addition:         return (+)
        case .subtraction:      return (-)
            
        }
    }
}

enum Command {
    case clear
    case equal
    case operation(Operator)
    case addNumber(Character)
}

class Display: UILabel{
    
    weak var delegate: DisplayDelegate?
    
    
    @objc func doSomething() {
        
        
        delegate?.display()
        
    }
    
}
