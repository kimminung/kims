//: [Previous](@previous)
import Foundation
import UIKit

extension String {
  static func -= (lhs: inout String, rhs: String) {
    // Case 1
  }
}

extension CGRect {
  static func * (frame: CGRect, num: CGFloat) -> CGRect {
    // Case 2
    return .zero
  }
}


let str = "Hello, World!"

/***************************************************
 [ 실습 ]
 1. String 에 -= 연산자 적용하기
 str -= "He"
 str => "llo, World!"
 
 2. CGRect 에 사이즈 (width, height)만 키우는 곱하기(*) 연산자 구현
 ex) aView.frame = bView.frame * 1.2
     someFrame = someFrame * 2
 ***************************************************/

var first = str
first -= "He"
first

var someFrame = CGRect(x: 10, y: 20, width: 50, height: 60)
someFrame * 1.3
someFrame = someFrame * 2



//: [Next](@next)
