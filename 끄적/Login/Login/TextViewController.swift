//
//  TextViewController.swift
//  Login
//
//  Created by 김민웅 on 07/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import Foundation
import UIKit

protocol CustomTextDelegate: class {
    func min()
}

class CustomText: UITextField {
    weak var customDelegate: CustomTextDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textColor = .black
        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func doSomething() {
        //        print("\n---------- [ before ] ----------")
        // do something
        
        customDelegate?.min()
        
        // do something
        //        print("---------- [ after sayHello ] ----------")
    }
    
}
