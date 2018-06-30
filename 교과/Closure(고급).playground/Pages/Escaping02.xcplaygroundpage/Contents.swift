//: [Previous](@previous)
//: # Escaping02
import Foundation

final class Callee {
//  func doSomething(closure: () -> Void) {    // Error
  func doSomething(closure: @escaping () -> Void) {
    DispatchQueue.main.async {
      closure()
    }
  }
  
  init() {
    print("Callee was initialized")
  }
  deinit {
    print("Callee was deinitialized")
  }
}

final class Caller {
  let callee = Callee()
  var name = "James"
  
  func doSomething() {
    callee.doSomething {
      self.name = "Tom"    // Leak
    }
//    callee.doSomething { [weak self] in
//      self?.name = "Tom"    // Release
//    }
    
//    callee.doSomething { [weak self] in           //외부에서 제대로 동작
//      DispatchQueue.main.async {
//        self?.name = "Tom"   // Release
//      }
//    }
    
//    callee.doSomething {
//      DispatchQueue.main.async { [weak self] in   //스트롱 레퍼런스사이클 발생
//        self?.name = "Tom"   // Leak              //내부에서 처리가 발생되기 때문
//      }
//    }
  }
  
  init() {
    print("Caller was initialized")
  }
  deinit {
    print("Caller was deinitialized")
  }
}

print("---------- [ Escaping02 ] ----------\n")

print("[ Init ]")
var caller: Caller? = Caller()

print("\n[ Deinit ]")
caller?.doSomething()
caller = nil

print("\n[ End ]")

//: [Next](@next)
