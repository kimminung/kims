//
//  DrinkItemController.swift
//  자판기
//
//  Created by 김민웅 on 08/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

//import Foundation
import UIKit

protocol DrinkItemDelegate: class {
    func drink()
}

class DrinkItem: UIImageView {
    
    weak var drinkDelegate: DrinkItemDelegate?
    
    @objc func doSomething() {

        
        drinkDelegate?.drink()
        
    }
}
