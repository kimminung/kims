/*:
 # Basic
 **Metatype > Type > Instance**
 
 ![Metaclass](metaclass.png)
 */


print("\n---------- [ Type of Type ] ----------\n")

print(type(of: 1))
print(type(of: "111"))

struct S {}
class C {}
enum E {}
print(type(of: S.self))
print(type(of: C.self))
print(type(of: E.self))

protocol P {}
print(type(of: P.self))




/***************************************************
 String Metatype > String Type > String Instance
 
                    //String의 객체"String"
 let str: String = "String"
 str : struct String 의 객체
 String : struct String 타입 자체에 대한 참조, String 메타타입(String.Type) 의 객체.  String.self 로 접근
 String.Type : String 의 메타타입
 ***************************************************/

print("\n---------- [ String Type itself] ----------\n")

//let _ = Swift.NSString.init("initString")  // Error
let swiftString = Swift.String.init("initString")
let swiftStringSelf = Swift.String.self //
let swiftStringType = type(of: swiftString)
let swiftStringMetatype = type(of: Swift.String.self)
let swiftStringMetatypeSelf = swiftStringMetatype.self
let swiftStringMetatypeType = type(of: swiftStringMetatype)
print(swiftString)
print(swiftStringSelf)
print(swiftStringType)
print(swiftStringMetatype)
print(swiftStringMetatypeSelf)
print(swiftStringMetatypeType)


print("\n---------- [ String Types ] ----------\n")

let str: String = "myString"
let stringSelf: String = "myString".self
let stringType: String.Type  = type(of: "myString")
let stringMetatype: String.Type.Type  = type(of: type(of: "myString"))
print(str)
print(stringSelf)
print(stringType)
print(stringMetatype)


//: [Next](@next)
