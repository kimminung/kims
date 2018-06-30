//
//  Case2ViewController.swift
//  MemoryManagement
//
//  Created by giftbot on 2018. 6. 28..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class Case2ViewController: UIViewController {
  
  final class Person {
    var name = "Edward"
    var membership: Membership?
    deinit {
      print("Person is being deinitialized")
    }
  }
  
  final class Membership {
    var owner: Person
    init(owner: Person) { self.owner = owner }
    deinit {
      print("Membership is being deinitialized")
    }
  }
  
  var person: Person? = Person()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("\n---------- [ Case 2 ] ----------\n")
    
    person?.membership = Membership(owner: person!)
  }
  
  deinit {
    print("\(self) is being deinitialized")
  }
}
