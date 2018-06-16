//: [Previous](@previous)
import Foundation
import UIKit
/*:
 # Singleton
 - 특정 클래스의 인스턴스에 접근할 때 항상 동일한 인스턴스만을 반환하도록 하는 설계 패턴
 - 한 번 생성된 이후에는 프로그램이 종료될 때까지 항상 메모리에 상주
 - 어플리케이션에서 유일하게 하나만 필요한 객체에 사용
 - UIApplication, AppDelegate 등
 */

/***************************************************
 iOS 싱글톤 사용 예
 ***************************************************/
let screen = UIScreen.main
let userDefaults = UserDefaults.standard
let application = UIApplication.shared
let fileManager = FileManager.default
let notification = NotificationCenter.default



/*:
 ## Syntax
 */
//: ### Obj-C
//: ![objc_singleton](objc_singleton.png)
/*:
 ### Swift
 */

class Singleton {
    static let shared = Singleton()
    var x = 0
    static var y = 0
    
    lazy var z = 0
}

/***************************************************
 let으로 선언한 것은 기본적으로 thread-safe 하므로 별도로 dispatch_once_t 불필요
 static 전역 변수로 선언한 것은 lazy 하게 동작하므로 처음 Singleton을 생성하기 전까지 메모리에 올라가지 않음
 ***************************************************/


//let x = 0
//x = 1 error

let singleton1 = Singleton.shared   // static let shared = singleton()

let singleton3 = Singleton()
singleton1.x
singleton1
let singleton56 = Singleton.y
singleton1.x = 10
singleton1.x

Singleton.shared.x = 20
Singleton.shared.x


let sss1 = Singleton()  //1이랑
let sss2 = Singleton()  //2는 다름

Singleton().x = 20      //이거랑 20
print(Singleton().x)    //이거는 다름 0

/*:
 ---
 ### Question
 - 위 코드에서 발생할 수 있는 문제점은?
 ---
 */






// 여전히 새로운 객체를 만들고 다른 객체에 접근 가능하므로 싱글톤 취지에 맞지 않음


let singleton2 = Singleton()
singleton2.x
singleton2.x = 55

singleton2.x
singleton1.x




/***************************************************
 외부에서 인스턴스를 직접 생성하지 못하도록 생성자를 private 으로 선언
 ***************************************************/

class PrivateSingleton {
    static let shared = PrivateSingleton()
    private init() {}
    var x = 1
}

//let uniqueSingleton = PrivateSingleton.init()
let uniqueSingleton = PrivateSingleton.shared
uniqueSingleton.x

uniqueSingleton.x = 20
uniqueSingleton.x



//: [Next](@next)
