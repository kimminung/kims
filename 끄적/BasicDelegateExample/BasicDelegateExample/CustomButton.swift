//
//  CustomButton.swift
//  BasicDelegateExample
//
//  Created by giftbot on 2018. 6. 7..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit


protocol CustomButtonDelegate: class {
  func sayHello()
}

class CustomButton: UIButton {
  weak var delegate: CustomButtonDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    setTitle("normal", for: .normal)
    setTitleColor(.black, for: .normal)
    backgroundColor = .orange
    addTarget(self, action: #selector(doSomething), for: .touchUpInside)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func doSomething() {
    print("\n---------- [ before ] ----------")
    // do something
    
    delegate?.sayHello()
    
    // do something
    print("---------- [ after sayHello ] ----------")
  }
}
