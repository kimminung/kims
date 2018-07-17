/*:
 # Subscripts
 - Class, Struct 는 연산자를 자체적으로 구현 가능
 - 별도의 메서드를 구성하지 않고도 인덱스를 통해 어떤 값을 빠르게 설정(set)하고 검색(retrieve) 가능
 - Subscript Overloading : 하나의 타입에 여러 개의 Subscripts(첨자) 정의 가능하며 전달 Index의 타입으로 구분
 */


// Int
var num = 5
num += 5
num -= 5

// String
var str = "He"
str += "llo"
// str -= "llo"

// Array
var arr = [1, 2]
arr += [3]
// arr -= [2]



print("\n---------- [ Custom Type ] ----------\n")

struct SomeClass {
  var prop: Int
}

let class1 = SomeClass(prop: 1)
let class2 = SomeClass(prop: 2)
// class1 + class2  // error


//: ---
//: ## Operator Syntax
//: ---

extension SomeClass {
  // rhs: Right Hand Side,   lhs: Left Hand Side
  static func + (lhs: SomeClass, rhs: SomeClass) -> SomeClass {
    return SomeClass(prop: lhs.prop + rhs.prop)
  }
}


class1 + class2
dump(class1 + class2)


//: [Next](@next)
