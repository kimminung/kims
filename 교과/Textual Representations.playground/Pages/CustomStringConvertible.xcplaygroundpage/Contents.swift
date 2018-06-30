//: [Previous](@previous)
/*:
 ---
 # CustomStringConvertible
 ---
 */

final class Cat: CustomStringConvertible, CustomDebugStringConvertible {
    
    
    //1.
    let name = "Bori"
    let age = 2
    var description: String {       //description = 서술
        return "name: \(name)"
    }
    var debugDescription: String {  //debugDescription = 디버그 서술
        return "name: \(name) and age: \(age)"
    }
}

let cat = Cat()
print(cat)
debugPrint(cat)
dump(cat)

/*
 name: Bori
 name: Bori and age: 2
 ▿ name: Bori and age: 2 #0
 - name: "Bori"
 - age: 2
 */

                            //description = 안에 보여줄 내용만 커스텀해서 뺄거 빼고 출력되게끔 함

///     struct Point: CustomStringConvertible {
///         let x: Int, y: Int
///
///         var description: String {
///             return "(\(x), \(y))"
///         }
///     }
///
///     let p = Point(x: 21, y: 30)
///     let s = String(describing: p)
///     print(s)
///     // Prints "(21, 30)"

//2.
//    var description: String = "111"
//
//    var debugDescription: String = "222"
//
//    let name = "Bori"
//    let age = 2
//
//}
//
//let cat = Cat()
//print(cat)
//debugPrint(cat)
//dump(cat)

/*
 111
 222
 ▿ 222 #0
 - description: "111"
 - debugDescription: "222"
 - name: "Bori"
 - age: 2
 */
//: [Next](@next)
