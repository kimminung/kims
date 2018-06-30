//: [Previous](@previous)
//: # NoEscaping
//: * Swift 3.0 이전 - @escaping 이 기본
//: * Swift 3.0 이후 - @noescaping 이 기본
//: ##
//: * @noescaping -> @noescaping 가능
//: * @noescaping -> @escaping   불가능
//: * @escaping   -> @noescaping, @escaping 둘 다 가능
                                        //closure : 폐쇄
                                        //escape  : 탈출하다
final internal class Callee {
  func doSomething(closure: () -> Void) {   //이 함수를
    closure()
    // name = "Tom"
  }                                         //벗어나지 않고 closure()가 있으니까 NoEscaping
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
    callee.doSomething {    //[weak self .. 안써줘도 된다
      name = "Tom"
        //self 안써도 클로져를 이용해 잘 사용됨 - NoEscaping
    }
  }
  
  var closure: (() -> ()) = {}
  func noEscapingClosure(_ arg: ()->()) {
/*
     var closure: (() -> ()) = {}
     arg()
*/
//    let closure = arg       // required @escaping
//    self.closure = arg      // required @escaping   //error -> FIX 누르면(_ arg: @escaping ()->())
    
//    arg()
    
//    someFunc(arg)           // NoEscaping -> NoEscaping   // = arg()랑 똑같음
//    someEscapingFunc(arg)   // NoEscaping -> Escaping

  }
  
  func someFunc(_ arg: () -> ()) {
    arg()
//    self.closure = arg    // required @escaping
//    let closure = arg
  }
  
  func someEscapingFunc(_ arg: @escaping () -> ()) {
    arg()
  }
  
  init() {
    print("Caller was initialized")
  }
  deinit {
    print("Caller was deinitialized")
  }
}

print("---------- [ NoEscaping ] ----------\n")

print("[ Init ]")
var caller: Caller? = Caller()

print("\n[ Deinit ]")
caller?.doSomething()
caller = nil

print("\n[ End ]")

//: [Next](@next)
