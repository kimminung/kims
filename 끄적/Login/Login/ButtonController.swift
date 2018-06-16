//
//  ButtonController.swift
//  Login
//
//  Created by 김민웅 on 07/06/2018.
//  Copyright © 2018 김민웅. All rights reserved.
//

import Foundation
import UIKit

protocol CustomButtonDelegate: class {
    func LoginButton()
}

class CustomButton: UIButton {
    weak var delegate: CustomButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setTitle("로그인", for: .normal)
        setTitleColor(.black, for: .normal)
        backgroundColor = .orange
        addTarget(self, action: #selector(doSomething), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func doSomething() {
//        print("\n---------- [ before ] ----------")
        // do something
        
        delegate?.LoginButton()
        
        // do something
//        print("---------- [ after sayHello ] ----------")
    }
}
