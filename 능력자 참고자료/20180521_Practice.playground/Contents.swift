//: Playground - noun: a place where people can play

import UIKit

//하샤드 수 구하기
//자연수 N 의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수

func hashadNumber(number: Int) {
    let stringNumber: String = String(number)
    var plusNumber: Int = 0
   
    for characterOfNumbers in stringNumber {
        let resultString = String(characterOfNumbers)
        plusNumber += Int(resultString)!
    }
    
    if number % plusNumber == 0 {
        print("\(number) is Hashad Number")
    } else {
        print("\(number) is not Hashad Number")
    }
}

hashadNumber(number: 18)

// 두 수의 최대 공약수 및 최소 공배수 구하기

func theGreatestCommonMeasureAndTheLeastCommonMultiple(firstNumber: Int, secondNumber: Int) {
    var resultFirstMeasure: Set<Int> = []
    var firstMeasure: Int = 0
    var resultSecondMeasure: Set<Int> = []
    var secondMeasure: Int = 0
    
    var A: Int = 0
    var B: Int = 0
    var C: Int = 0
    
    for measureOfFirstNumber in 1...firstNumber {
        firstMeasure = firstNumber / measureOfFirstNumber
        resultFirstMeasure.insert(firstMeasure)
    }
    for measureOfSecondNumber in 1...secondNumber {
        secondMeasure = secondNumber / measureOfSecondNumber
        resultSecondMeasure.insert(secondMeasure)
    }
    
   print(resultSecondMeasure)
   print(resultFirstMeasure)
   
   let theGreatestCommonMeasure: Set<Int> = resultFirstMeasure.intersection(resultSecondMeasure)
   print("\(firstNumber) 와 \(secondNumber) 의 최대 공약수는 \(theGreatestCommonMeasure.max()!) 입니다.")
   
    A = firstNumber / theGreatestCommonMeasure.max()!
    B = secondNumber / theGreatestCommonMeasure.max()!
    C = A * B * theGreatestCommonMeasure.max()!
    
    print("\(firstNumber) 와 \(secondNumber) 의 최소 공배수는 \(C) 입니다")
}

theGreatestCommonMeasureAndTheLeastCommonMultiple(firstNumber: 9, secondNumber: 18)

////선풍기 구현
//
//class AnElectricFanStat {
//    fileprivate var power: Bool = false
//    fileprivate var timer: Int = 0
//    fileprivate var statOfElectricFan: String = ""
//}
//
//class AnElectricFan: AnElectricFanStat {
//
//    func powerIsOnOFF(poweris: Bool) {
//        guard poweris else { return }
//        super.power = poweris
//        print("안녕하세요")
//        super.statOfElectricFan = "동작"
//        print(super.statOfElectricFan)
//    }
//    func fanSeed(speed: String) {
//        guard super.power else { return }
//        switch speed {
//        case "강":
//            print("현재 세기는 '강' 입니다.")
//        case "중":
//            print("현재 세기는 '중' 입니다.")
//        default:
//            print("현재 세기는 '약' 입니다.")
//        }
//    }
//
//    func fanTimer(changeTimer: Int) {
//        print("\(changeTimer)초로 예약되었습니다.")
//        super.timer = changeTimer
//        repeat {
//            super.timer -= 1
//            print("\(timer)초")
//        } while super.timer > 0
//
//        super.statOfElectricFan = "정지"
//        print(super.statOfElectricFan)
//    }
//
//    func spinNeck(spinOfNeck: Bool) {
//        if spinOfNeck == true {
//            print("회전합니다")
//        } else {
//            print("정지합니다")
//        }
//    }
//
//
//
//}
//
//let useElectricFan: AnElectricFan = AnElectricFan()
//useElectricFan.powerIsOnOFF(poweris: true)
//useElectricFan.fanSeed(speed: "강")
//useElectricFan.fanTimer(changeTimer: 10)
//useElectricFan.spinNeck(spinOfNeck: true)
