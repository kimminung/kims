//: [Previous](@previous)
/*:
 ---
 ## Precedencegroup
 - 상세 문서: https://goo.gl/aepRXS
 ---
 */
//: ![Precedence Groups](operator_precedence.png)

struct Vector2D {
  var x = 0.0, y = 0.0
  
  static func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
  }
}


infix operator +-: AdditionPrecedence
extension Vector2D {
  static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
  }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
print("plusMinusVector :", plusMinusVector)


/*:
 ---
 ## Custom Precedencegroup
 ---
 */

/***************************************************
 예전 방식
 infix operator <> { precedence 180 associativity left }
 ***************************************************/

print("\n---------- [ precedencegroup ] ----------\n")

precedencegroup DotProductPrecedence {
  associativity: left
  lowerThan: MultiplicationPrecedence
  higherThan: AdditionPrecedence
}

infix operator •: DotProductPrecedence
//infix operator •

extension Vector2D {
  static func • (lhs: Vector2D, rhs: Vector2D) -> Double {
    return lhs.x * rhs.x + lhs.y * rhs.y
  }
}

let vector = Vector2D(x: 3.0, y: 5.0)

//vector + vector • vector
//vector • vector + 3.0

//vector +- vector • vector
//괄호()를 사용하지 않고 위 연산을 수행하게 하는 방법은?



//: [Next](@next)
