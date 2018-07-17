//: [Previous](@previous)

extension String {
  subscript(intIndex: Int) -> Character {
    return self[startIndex]
  }
  
  subscript(intRange: Range<Int>) -> String {
    return String(self[startIndex..<endIndex])
  }
}


let str = "Hello, World!"

/***************************************************
 [ 실습 ]
 1. 자연수를 입력 받아 해당 인덱스에 위치한 문자(Character)를 반환하는 Subscript 구현
 str[0] - "H",  str[5] - ","
 
 2. IntRange ( ..< ) 를 입력받아 해당 범위의 문자열(String)을 반환하는 Subscript 구현
 str[0 ..< 2] - "He",    str[2 ..< 6] - "llo,"
 
 3. 1번과 2번에 대해 음수 값을 입력해도 값이 나오도록 구현
 str[-1] - "!",   str[-5] - o,       str[-5 ..< -1] - "orld"
 ***************************************************/

// 1
str[0]
str[5]

// 2
str[0..<2]
str[2..<6]

// 3
str[-1]
str[-5]
str[-5 ..< -1]


//: [Next](@next)
