//: [Previous](@previous)
//: # Escaping01
import Foundation

final class Callee {
//  func doSomething(closure: () -> Void) {    // @noescaping
//    closure()
//  }
  func doSomething(closure: @escaping () -> Void) {  // @escaping
    closure()
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

                            //내부적으로 escaping이 항상 써지고 있어서 self를 써줘야만 했다
  func doSomething() {
//    callee.doSomething {
//      name = "Tom"     // self keyword (X)
//    }
    callee.doSomething {
      self.name = "Tom"   // self keyword  (O) @escaping
    }
    
                            //Dispatch : 보내다
                            //async : 비동기식(클로져)
                            //DispatchQueue : 다중 스레드 큐
    /*
     caller가 입력을 받아 1을 가지고, callee에게 전달해서 디스패치 큐를 통해 1을 보내고
     다시 caller에게 돌아왔을때 2를 준 다음 nil을 해줘야하는데 이때, 2에서 1로 변경되며
     사이클이 형성되고 leak이 발생
     */
//    callee.doSomething {
//      DispatchQueue.main.async {
//        self.name = "Tom"    // Leak      OO사이클 발생
//      }
    
      DispatchQueue.main.async { [weak self] in
        self?.name = "Tom"   // Release
      }
    }
//  }
  
  init() {
    print("Caller was initialized")
  }
  deinit {
    print("Caller was deinitialized")
  }
}


print("---------- [ Escaping01 ] ----------\n")

print("[ Init ]")
var caller: Caller? = Caller()

print("\n[ Deinit ]")
caller?.doSomething()
caller = nil

print("\n[ End ]")
//: [Next](@next)
