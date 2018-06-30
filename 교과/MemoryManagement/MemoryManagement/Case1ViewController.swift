//
//  Case1ViewController.swift
//  MemoryManagement
//
//  Created by giftbot on 2018. 6. 28..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

/***************************************************
 1. 각 케이스별로 문제가 있는지 없는지 확인
 2. 문제가 있다면 어느 부분이고 없다면 어째서 없는지 정리
 3. 각 경우마다 참조카운트가 몇인지 헤아려보고 문제가 있을 경우 해결
 ***************************************************/

final class Case1ViewController: UIViewController {
  
  final class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit {
      print("\(name) is being deinitialized")
    }
  }
  
  final class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit {
      print("Apartment \(unit) is being deinitialized")
    }
  }
  
  var person: Person? = Person(name: "James")
  var apartment: Apartment? = Apartment(unit: "3A")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("\n---------- [ Case 1 ] ----------\n")
    
    person?.apartment = apartment
    apartment?.tenant = person
  }
  
  deinit {
    print("\(self) is being deinitialized")
  }
}
