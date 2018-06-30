//: [Previous](@previous)

import UIKit

/***************************************************
 1. 문제가 있는지 없는지 확인
 2. 문제가 있다면 어느 상황에 나타날 수 있는지 어떻게 해결해야 할 지 알아보고
    문제가 없다면 어째서 없는지 정리
 3. 각 경우마다 참조카운트가 몇인지 헤아려보기
 ***************************************************/

final class MemoryViewController: UIViewController {

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
   weak var tenant: Person?
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
var memoryVC: MemoryViewController? = MemoryViewController()
memoryVC?.viewDidLoad()
memoryVC = nil

//: [Next](@next)
