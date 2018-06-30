//: [Previous](@previous)
//: # Value Type Capture
print("\n---------- [ Value Type Capture ] ----------\n")
var a = 1
var b = 2
var c = 10
var result = 0
print("초기화 값 :", a, b, c, result)
print("a, b 만 캡쳐")

let valueCapture = { [a, b] in                  //[a,b]가 선언될 때 지역변수로서 이 값을 고정
    /*
    let a = 1
    let b = 2
     */
  result = a + b + c
  print("클로저 내부 값 :", a, b, c, result)
}

//let valueCapture = { [a, b, result] in
//     let result = result + c
//
//    result = a + b + c
//    print("클로저 내부 값 :", a, b, c, result)
//}

//let valueCapture = {
//    result = a + b + c
//    print("클로저 내부 값:", a, b, c, result)
//}

a = 10
b = 10
c = 5
result = a + b + c
print("변경 값 :", a, b, c, result)

valueCapture()
print("실행 이후 값 :", a, b, c, result)
//: # Reference Type Capture
print("\n---------- [ RefType Capture ] ----------\n")

final class RefType {
  var number = 0
}
var x = RefType()
var y = RefType()

//x.number = 2
print("초기화 값 :", x.number, y.number)

                //ARC가 관리
let refCapture = { [x] in                       //ARC가 관리
  print("클로저 내부 값 :", x.number, y.number)     //ARC가 관리
}

//x = RefType()
x.number = 5
y.number = 7
print("변경 값 :", x.number, y.number)

refCapture()
print("실행 이후 값 :", x.number, y.number)

//: # Binding an arbitrary expression
print("\n---------- [ binding ] ----------\n")
let captureBinding = { [z = x] in
    // let x = RefType()        // rc = 1
    // let y = x     // rc = 2
  print(z.number)               // rc = 2
}
let captureWeakBinding = { [weak z = x] in
  print(z?.number ?? 0)
    
    /*  // ?? 기호
     if z == nil {
     print(0)
     }else{
     print(number)
     }
     */
}
let captureUnownedBinding = { [unowned z = y] in
  print(z.number)
}

captureBinding()
captureWeakBinding()
captureUnownedBinding()



/*:
 # Example
 */
print("\n---------- [ EX ] ----------\n")
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
  var runningTotal = 0
  func incrementer() -> Int {
    runningTotal += amount
    return runningTotal
  }
  return incrementer
}

let incrementer = makeIncrementer(forIncrement: 7)  //ARC에서 이 부분이 사라져도 위에
//print(incrementer)                                //var runningTotal = 0 부분이 살아있으므로 실행됨
print(incrementer())
print(incrementer())

let incrementer2 = makeIncrementer(forIncrement: 10)
print(incrementer())
print(incrementer())

//: [Next](@next)
