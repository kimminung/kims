//: [Previous](@previous)
/*:
 ---
 # Scope
   - 스코프 범위에 의한 할당 및 해제
 ---
 */


class LocalScope {
  func doSomething() {}
  deinit {
    print("LocalScope is being deinitialized")
  }
}

class ClassProperty {
  func doSomething() {}
  deinit {
    print("ClassProperty is being deinitialized")
  }
}

class Application {
    var prop = ClassProperty()      //1. 여기에 옵셔널 ? 을 추가하고 변수에 담음
  
  func allocateInstance() {
    let local = LocalScope()
    local.doSomething()
  }
  
  deinit {
    print("Application is being deinitialized")
  }
}


var app: Application? = Application()
app?.prop.doSomething()
app?.allocateInstance()
app = nil

//app?.prop = nil       // 2. 이거 해줘서 닐로 만듬

/*:
 ---
 ### Question
 - 어떤 결과가 나올지 예상해보세요.
 - 정확히 메모리가 할당되고 해제되는 시점은 언제일지 생각해보세요.
 ---
 */





//: [Next](@next)
