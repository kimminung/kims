//
//  Case4ViewController.swift
//  MemoryManagement
//
//  Created by giftbot on 2018. 6. 28..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class Case4ViewController: UIViewController {
  
  let button = UIButton()
  lazy var valueCapture1 = { [button] in
    print(button)       // Release
    print(self.button)  // Leak
  }
  
  var a = 1
  var b = 2
  var c = 10
  var result = 0
  lazy var valueCapture2 = { [a, b] in
    self.result = a + b + self.c
    print(a, b, self.c, self.result)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    print("\n---------- [ Case 4 ] ----------\n")
    
    valueCapture1()
    
    a = 10
    b = 10
    c = 5
    result = a + b + c
    valueCapture2()
    print(a, b, c, result)
  }
  
  deinit {
    print("\(self) is being deinitialized")
  }
}
