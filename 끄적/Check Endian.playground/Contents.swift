//: Playground - noun: a place where people can play

import UIKit

let number: UInt32 = 0x12345678
let convertedToBig = number.bigEndian
//엔디안을 해주는것이 네트워킹에 필요한 부분임
if number == convertedToBig {
    print("Big \(number)")
} else {
    print("Little \(number)")
}
