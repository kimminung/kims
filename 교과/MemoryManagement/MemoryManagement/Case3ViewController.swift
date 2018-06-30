//
//  Case3ViewController.swift
//  MemoryManagement
//
//  Created by giftbot on 2018. 6. 28..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class Car {
  var totalDistance = 0.0
  var totalGas = 0.0
  
  func drive() {
    totalDistance += Double(arc4random_uniform(100) + 500)
    totalGas += Double(arc4random_uniform(10) + 50)
  }

  lazy var checkMileage: () -> () = {
    print(self.totalDistance / self.totalGas)
  }
  
  deinit {
    print("\(self) is being deinitialized")
  }
}


final class Case3ViewController: UIViewController {
  var myCar = Car()
  
  @IBAction private func noLeak(_ sender: UIButton) {
    myCar.drive()
  }
  
  @IBAction private func leak(_ sender: UIButton) {
    print("\n---------- [ Case 3 ] ----------\n")
    myCar.drive()
    myCar.checkMileage()
  }
  
  deinit {
    print("\(self) is being deinitialized")
  }
}
