//: Playground - noun: a place where people can play

import UIKit
/*
 - 하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수
 ex) 18의 자릿수 합은 1 + 8 = 9이고, 18은 9로 나누어 떨어지므로 하샤드 수.
 */

func harshad(num1: Int) {
    var strInt = String(num1)//num1을 int로 받은것을 쪼개기 위해 일단 String으로 형변환
    let strIntArr = strInt.characters.map{ String($0) } //저도 map에 대한건 자세히 모르고 String에는 이런함수가 있는데 이함수는 String을 한글자씩 쪼개서 배열에 담음
    //ex) num1 = 5151 일시 strIntArr = ["5","1","5","1"]
    var harshad = Int()
    for i in 0..<strIntArr.count {
        harshad += Int(strIntArr[i])!//배열에 있는 String숫자를 하나하나 Int로 형변환해서 더함. 더한걸 모은 변수가 harshad. 옵셔널 ! 을 쓴 이유는 strIntArr에 값이 있다고 확신하게 해주는게 ! 표시.
    }
    if num1 % harshad == 0 {//여기서 이제 num1을 harshad로 나누어서 하샤드 수인지 아닌지 판단.
        print("\(num1)은 하샤드 수가 맞습니다")
    }else {
        print("\(num1)은 하샤드 수가 아닙니다.")
    }
}
harshad(num1: 5000)
/*
 # 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
 ex) Input : 6, 9   ->  Output : 18, 3
 */
func euclid(num1: Int, num2: Int) {//이해 안되시면 구글에 유클리드 호제법 검색하셔서 한번 보셔도 좋을듯.
    var number1 = Int()// 더 큰수를 지정하기 위해 변수 2개 생성
    var number2 = Int()
    var r = 1
    if num1 > num2 {//둘중 큰수를 number1로 하기위해
        number1 = num1
        number2 = num2
    }else {
        number1 = num2 // number1 = 9 -> 6
        number2 = num1 // number2 = 6 -> 3
    }
    while r>0 {
        r = number1 % number2 // r = 3 -> 0
        number1 = number2 // number1 = 6 -> 3
        number2 = r // number2 = 3 -> 0
        // => r값이 0이 되므로 while문을 벗어나면서 number1(최대공약수)는 3이됨. 최대공약수는 나머지가 0이 될때 두숫자중 큰숫자가 최대공약수이므로 나머지 r값이 0일때 3,0 두숫자가 남으니까 더 큰숫자인 3이 최대공약수가 됨.
    }
    //while 문은 6, 9라고 가정하고 옆에 값을 써봤습니다. 헷갈리시면 새로 숫자 넣어보셔서 해보시면 이해가 되실거에요
    print("최대공약수는 \(number1) 이고 최소공배수는 \((num1 * num2)/number1) 이다") //최소공배수는 두숫자의 곱을 최대공약수로 나눈것이 최소공배수가 됨.
}
euclid(num1: 6, num2: 9)
/*
 # 선풍기를 동작시키는 과정을 추상화, 캡슐화, 상속 개념 등을 이용해 클래스로 구현해보기
 전원킴 전원끔 미풍 강풍 회전
 */
class Fan {
    var onOff: Bool = false
    func turnOn() {
        guard onOff == true else {
            onOff = true
            print("전원켜짐")
            return
        }
    }
    func turnOff() {
        guard onOff == false else {
            onOff = false
            print("전원꺼짐")
            return
        }
    }
}
class Remote: Fan {
    var windPwr = String()
    var windSwing = false
    
    func weakWind() {
        if onOff == true {
            guard windPwr == "미풍" else {
                windPwr = "미풍"
                print("현재 바람세기는 미풍입니다.")
                return
            }
        }else {
            print("전원이 꺼져있습니다.")
        }
    }
    
    func stringWind() {
        if onOff == true {
            guard windPwr == "강풍" else {
                windPwr = "강풍"
                print("현재 바람세기는 강풍입니다.")
                return
            }
        }else {
            print("전원이 꺼져있습니다.")
        }
    }
    
    func swing() {
        if onOff == true {
            switch windSwing {
            case true:
                print("선풍기가 회전을 멈췄습니다.")
                windSwing = false
            case false:
                print("선풍기가 회전을 시작했습니다.")
                windSwing = true
            default:
                break
            }
        }else {
            print("전원이 꺼져있습니다.")
        }
    }
}
//
let remote = Remote()
remote.weakWind()
remote.turnOn()
remote.weakWind()
remote.weakWind()
remote.stringWind()
remote.windPwr
remote.swing()
remote.swing()
remote.turnOff()

/////codility
let d = 21
print("2진수 변환 = \(String(d, radix: 2))")






