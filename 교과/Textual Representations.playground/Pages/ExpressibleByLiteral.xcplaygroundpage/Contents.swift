//: [Previous](@previous)
/*:
 ---
 # ExpressibleByLiteral
 ---
 */
//Literal - 값을

/*
 struct NameCompounder: ExpressibleByStringLiteral {
 
 typealias StringLiteralType = String
 
 let familyName: String = "장"
 let fullName: String
 
 init(stringLiteral value: StringLiteralType) {
 fullName = familyName + value
 }
 }
 
 
 let name: NameCompounder = "동건"
 name.fullName
 print(name)
 print(type(of: name))
 */

/*
 // struct NameCompounder: ExpressibleByStringLiteral {
 //    typealias StringLiteralType = String
 
 let familyName: String = "장"
 let fullName: String
 
 //    init(stringLiteral value: StringLiteralType) {
 //        fullName = familyName + value
 //    }
 }
 
 let myName = NameCompounder(fullName:"동건")
 myName.fullName
 
 //
 //let name: NameCompounder = "동건"
 //name.fullName
 //print(name)
 //print(type(of: name))
 */

struct OddEvenFilter: ExpressibleByArrayLiteral {
    
    typealias ArrayLiteralElement = Int
    
    var odds: [Int] = []        //  odds = elements.filter {$0 % 2 == 1}
    var evens: [Int] = []       //  evens = elements.filter {$0 % 2 == 0}
    //    let odds: [Int]       //  odds = elements.filter{return $0 % 2 == 1}
    //    let evens: [Int]      //  evens = elements.filter{return $0 % 2 == 0}
    
    init(arrayLiteral elements: ArrayLiteralElement...) {
        
        odds = elements.filter {$0 % 2 == 1}                    //  var odds: [Int] = []
        evens = elements.filter {$0 % 2 == 0}                   //  var evens: [Int] = []
        
        //        odds = elements.filter{return $0 % 2 == 1}    //  let odds: [Int]
        //        evens = elements.filter{return $0 % 2 == 0}   //  let evens: [Int]
        
    }
}

let oddEvenFilter: OddEvenFilter = [1, 3, 5, 2, 7, 4]
oddEvenFilter.odds
oddEvenFilter.evens
print(oddEvenFilter.evens)
print(oddEvenFilter.odds)



//: [Next](@next)
