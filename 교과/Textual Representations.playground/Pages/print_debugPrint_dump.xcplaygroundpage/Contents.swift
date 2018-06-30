//: [Previous](@previous)
/*:
 ---
 # print, debugPrint, dump
 ---
 */

print("\n---------- [ double ] ----------\n")   //부동소수점
print(Double(99.99))
debugPrint(Double(99.99))
dump(Double(99.99))     //가장 자세히 확인하고 싶을 때

//99.99 != 99.98999999999995    //이렇게 비교해야하는데 오차때문에 안될때가 있음

print("\n---------- [ string ] ----------\n")
print("string")
debugPrint("string")
dump("string")

print("\n---------- [ array ] ----------\n")
print([1,2,3,4])
debugPrint([1,2,3,4])
dump([1,2,3,4])

print("\n---------- [ dict ] ----------\n")
print(["a": 1, "b": 2, "c":3])
debugPrint(["a": 1, "b": 2, "c":3])
dump(["a": 1, "b": 2, "c":3])

print("\n---------- [ print ] ----------\n")
let str = "myString"
print(str, "hello", "world", separator: " ", terminator: "\n")  //separator는 공백이 기본
print(str, "hello", "world", separator: "/", terminator: "!!!\n")//\n
print(str, "hello", "world", separator: "-", terminator: ">>>\n")
print(str, "hello", "world", separator: "()", terminator: "]]]]] ")
print("world agin")

var textStream = "hello"
print(" world", to: &textStream)

//print(terminator: <#T##String#>)
//어떤 문자열이 마지막에 들어갈 것인지
//print(separator: <#T##String#>)
//콤마 사이에 어떤걸 넣을지

for i in 1...10 {
    print(i, terminator: "!")
}
print(terminator: "\n\n")
//: [Next](@next)
