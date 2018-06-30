//: [Previous](@previous)
/*:
 ---
 # Strong Reference Cycles
 ---
 */

class Person {
  var pet: Dog?
  func doSomething() {}
  deinit {
    print("Person is being deinitialized")
  }
}

class Dog {
//  weak var owner: Person? //하나만 윅처리 해줘도 해결됨.
    var owner: Person?
  func doSomething() {}
  deinit {
    print("Dog is being deinitialized")
  }
}



var giftbot: Person! = Person()         //rc 1
var tori: Dog! = Dog()                  //rc 1

giftbot.pet = tori                      //rc 2
tori.owner = giftbot                    //rc 2

giftbot.doSomething()
tori.doSomething()

//
giftbot?.pet = nil  //
tori?.owner = nil

giftbot = nil
tori = nil      //tori가 nil이 되버리면 그 뒤에는 처리가 힘듬


//giftbot = nil                         //rc 1
//tori = nil                            //rc 1
//
//giftbot?.pet = nil                    //불가
//tori?.owner = nil                     //불가

/*:
 ---
 ### Question
 - 두 객체를 메모리에서 할당 해제해보세요.
 ---
 */


//: [Next](@next)
