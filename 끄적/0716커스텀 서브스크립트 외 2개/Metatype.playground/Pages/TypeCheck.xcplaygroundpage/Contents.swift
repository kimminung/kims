//: # Type Check
import Foundation

print("\n---------- [ Print Type ] ----------\n")

private func printType<T>(of type: T.Type) {
  print("\(type)")
}
printType(of: type(of: Int.self))
printType(of: Int.self)
printType(of: type(of: 10))



print("\n---------- [ Print Instance ] ----------\n")

private func printInstance<T>(of instance: T) {
  print("\(instance)")
}
printInstance(of: Int.self)
printInstance(of: 10)

private func printInstance(of number: Int) {
  print("\(number)")
}
printInstance(of: 20)
printInstance(of: 30)


func printGenericInfo<T>(_ value: T) {
  let valueType = type(of: value)
  print("'\(value)' of type '\(valueType)'")
}

protocol P {}
extension String: P {}

let stringAsP: P = "Hello!"
printGenericInfo(stringAsP)
// 'Hello!' of type 'P'

func betterPrintGenericInfo<T>(_ value: T) {
  let valueType = type(of: value as Any)
  print("'\(value)' of type '\(valueType)'")
}

betterPrintGenericInfo(stringAsP)


print("\n---------- [ Instance Type Check ] ----------\n")

// == 값 비교
// is 타입 비교
//3 is Int -> 3은 인트의 타입


let str = "StringInstance"
print(str is String)           // true, str 은 String Type 의 객체
print(str == "StringInstance") // true, str 은 "StringInstance" 와 동일(파일을 묻는게 아니고 값을 말함)
print(str is String.Type)      // false
print(str is String.Type.Type) // false


print("\n---------- [ Type's Type check ] ----------\n")

//print(str is String)       // true
//print(String is String)    // false
print(String.self is String)
print(String.self == String.self)

print(type(of: str) is String)       // false

print(type(of: str) == String.self)  // true, str 객체의 타입은 String 그 자체
print(String.self is String.Type)  // true, str 객체의 타입은 String.Type 의 객체
print(type(of: str) is String.Type)  // true, str 객체의 타입은 String.Type 의 객체


print("\n---------- [ Metatype's Type check ] ----------\n")

private let meta = type(of: String.self)
print(meta is String)  // false
print(meta == String.self)  // false
print(meta == String.Type.self)  // true, String 메타타입은 String.Type
print(meta is String.Type.Type)  // true, String 메타타입은 String.Type.Type 의 객체


//: [Next](@next)
