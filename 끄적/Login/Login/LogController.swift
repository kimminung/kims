//
//  LogController.swift
//  Login
//
//  Created by 김민웅 on 07/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

//import Foundation
import UIKit

protocol CustomLoginDelegate: class {
    func ung()
}

class CustomLogin: UIImageView {
    weak var delegate: CustomLoginDelegate?
    
//    static let main: CustomLogin = CustomLogin()
    
    @objc func doSomething() {
//        print("\n---------- [ before ] ----------")
        // do something
        
        delegate?.ung()
        
        // do something
//        print("---------- [ after sayHello ] ----------")
    }
}
