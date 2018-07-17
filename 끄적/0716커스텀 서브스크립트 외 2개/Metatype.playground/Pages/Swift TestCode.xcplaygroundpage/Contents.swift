//: [Previous](@previous)
//: # Swift Metatypes Test Code
// Swift 공식 GitHub 내 테스트 코드
// https://github.com/apple/swift/blob/master/test/type/metatype/metatypes.swift

struct Test0 {}

var test0 : Test0.Type = Test0.self
print(test0)

test0 = Test0.self
print(test0)

class Test1a {
  init() { }
  class func foo() {}
}
class Test1b : Test1a {
  override init() { super.init() }
}

Test1b.foo()

var test1 = Test1a.self
print(test1)

test1 = Test1b.self
print(test1)

var x = Test1b()
print(x)

test1 = type(of: x)
print(test1)


//: [Next](@next)
