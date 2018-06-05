//: [Previous](@previous)
import Foundation
/*:
 # UserDefaults
 - iOS 에서 데이터를 파일에 저장하기 위해 사용하는 대표적인 클래스 중 하나
 - 간단한 정보를 저장하고 불러올 때 사용하며 내부적으로 pList 파일로 저장
 */


class A {
    class func a() {}
    static func b() {}
}
struct B {              //struct는 상속이 안된다.
//    class func a() {} //에러
    static func b() {}
}

let userDefault0 = UserDefaults()        //
let userDefault1 = UserDefaults.init()   //
let userDefault2 = UserDefaults.standard //

//메모리에 저장했다가 불러옴             //빠름
var intKey = 10
intKey

//파일에 저장하고 파일에서 불러오는 형태                //소프트웨어->하드웨어.............->메모리 //느림
UserDefaults.standard.set(10, forKey: "IntKey")
UserDefaults.standard.integer(forKey: "IntKey")

UserDefaults.standard.set(3.14, forKey: "Double Pi")
UserDefaults.standard.double(forKey: "Double Pi")

UserDefaults.standard.set(true, forKey: "BoolKey")
UserDefaults.standard.bool(forKey: "BoolKey")

print(UserDefaults.standard.integer(forKey: "IntKey1111"))
print(UserDefaults.standard.double(forKey: "Double Pi1111"))
print(UserDefaults.standard.bool(forKey: "BoolKey1111"))

//UserDefaults.standard.set(<#T##value: Int##Int#>, forKey: <#T##String#>)
//UserDefaults.standard.integer(forKey: <#T##String#>)

//UserDefaults.standard.set(<#T##value: Double##Double#>, forKey: <#T##String#>)
//UserDefaults.standard.double(forKey: <#T##String#>)

//UserDefaults.standard.set(<#T##url: URL?##URL?#>, forKey: <#T##String#>)
//UserDefaults.standard.url(forKey: <#T##String#>)




let userDefaults = UserDefaults.standard    //UserDefaults.standard부분을 프로젝트 만들어서
                                            //print(UserDefaults.standard.dictionaryRepresentation()) 해봄 - 뭐 들어있나 확인
print(userDefaults)


print("\n---------- [ dictionaryRepresentation ] ----------\n")
print(userDefaults.dictionaryRepresentation())
print(Array(userDefaults.dictionaryRepresentation().keys))
print(userDefaults.dictionaryRepresentation().keys)
//print("\n---------- [ keys ] ----------\n")
//print(Array(UserDefaults.standard.dictionaryRepresentation().keys))
//
//print("\n---------- [ values ] ----------\n")
//print(Array(UserDefaults.standard.dictionaryRepresentation().values))



//: [Next](@next)
