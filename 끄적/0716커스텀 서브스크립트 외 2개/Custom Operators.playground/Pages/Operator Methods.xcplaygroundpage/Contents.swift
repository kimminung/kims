//: [Previous](@previous)
/*:
 ---
 # Operator Methods
 - Binary (이항) : Infix (중위 연산자)
 - Unary (단항) : Prefix (전위 연산자), Postfix (후위 연산자)
 ---
 */

struct Vector2D {
  var x = 0.0, y = 0.0
}

/*:
 ---
 ## Infix Operator
 ---
 */

print("\n---------- [ Infix ] ----------\n")

extension Vector2D {
  static func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
  }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
print("combinedVector :", combinedVector)


/*:
 ---
 ## Prefix Operator
 ---
 */

print("\n---------- [ Prefix ] ----------\n")

extension Vector2D {
  static prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
  }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative
print("positive :", positive)
print("negative :", negative)
print("alsoPositive :", alsoPositive)


/*:
 ---
 ## Postfix Operator
 ---
 */
print("\n---------- [ Postfix ] ----------\n")

postfix operator **

extension Vector2D {
  static postfix func ** (vector: Vector2D) -> Vector2D {
    return Vector2D(x: vector.x * vector.x, y: vector.y * vector.y)
  }
}

let baseVector = Vector2D(x: 4, y: 6)
let sqaredVector = baseVector**
print(sqaredVector)

//: [Next](@next)
