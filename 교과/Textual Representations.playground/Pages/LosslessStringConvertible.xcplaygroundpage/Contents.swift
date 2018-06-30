//: [Previous](@previous)
/*:
 ---
 # LosslessStringConvertible
 ---
 */
                                                    //Convertible = 전환 가능한
final class Person: LosslessStringConvertible, CustomDebugStringConvertible {
  let name = "홍길동"
  let age = 20
  let description: String
  init() {
    description = name
  }
  init?(_ description: String) {            // (선택제) 패일러블 이니셜라이져 - 실패하면 제대로 안만들어지고,
    self.description = description
  }
//init(_ description: String) {             //물음표(?)옵셔널 없애면 - '반드시 사용하도록 하겠다'
//  self.description = description
//}
  var debugDescription: String {
    return "\(name): \(age)"
  }
}

class dog {
    
}

print(String(1))
//print(String(dog()))
print(String(describing: dog()))

let person = Person()
print(String(person))           //이 부분에 init?이 있어서 실행된다
print(String(describing: person))
print(String(reflecting: person))
print(person)
debugPrint(person)
dump(person)

print("\n---------- [ init with description ] ----------\n")
let person2 = Person("description 지정")
print(String(person2!))
print(String(describing: person2))
print(String(describing: person2!))
print(String(reflecting: person2!))

print("\n---------- [ dump ] ----------\n")
dump(person)


print("\n---------- [ custom dump ] ----------\n")
dump(person, name: "myDump", indent: 4, maxDepth: 1, maxItems: 3)
                            //주문하다    //maxDepth = ex ) dog. x.y이런거, dictionary: dog이런거에서 딱 dog만 표시되게 하고 싶을때


//: [Next](@next)

