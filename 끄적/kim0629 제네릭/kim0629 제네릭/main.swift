//
//  main.swift
//  kim0629 제네릭
//
//  Created by 김민웅 on 2018. 6. 29..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import Foundation

print("Hello, World!")

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)

var someString = "Hello"
var anotherString = "Swift"
swapTwoValues(&someString, &anotherString)

/*
 class SomeClass{}
 class SomeClass1{}
 protocol SomeProtocol{}
 struct SomeStruct: SomeProtocol{}
 
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
 print(someT)
 print(someU)
 // function body goes here
 }
 
 let someClass: SomeClass = SomeClass()
 let someStruct: SomeProtocol = SOmeStruct()
 //let someProtocol: SomeProtocol = SOmeStruct()              //실수임
 
 someFunction(someT: someClass, someU: someStruct)
 //someFunction(someT: someClass, someU: someProtocol)        //실수함
 */

/*
 func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
 for (index, value) in array.enumerated() {
 if value == valueToFind {                   //error - Binary operator '==' cannot be applied to two 'T' operands
 return index
 }
 }
 return nil
 }
 let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
 let stringIndex = findIndex(of: "Andrea",
 in: ["Mike", "Malcolm", "Andrea"])
 */

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    
    for (index, value) in array.enumerated() {
        
        if value == valueToFind {
            
            return index
        }
    }
    return nil
}
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea",
                            in: ["Mike", "Malcolm", "Andrea"])

struct Pet /*: Equatable*/ {
    let name = "Tori"
    var age = 2
}

let pet1 = Pet()
var pet2 = Pet()
pet2.age = 3

//struct는 주소와 힙을 참조하지 않는다.
//if pet1 == pet2 {   //err - Binary operator '==' cannot be applied to two 'Pet' operands
//    print("equal")
//}
protocol  Initializer {
    init()
}
class Factory<T: Initializer> {     //이렇게 정확하게 상속 해줘야 제네릭이 잘 가져다 씀
    func produce(item: T){
        print("item : ", item)
        print("item type :", type(of: item))
    }
    func produce() -> T {
        return T()                  //이닛으로 리턴해야 하는데 제너릭 T만 쓰기 위해서는 이닛을 정확히 상속시켜줘야한다.
    }
}


class Drink: Initializer {
    required init() { }
}
struct Snack: Initializer {
    init() { }
}
struct Car: Initializer {
    init() { }
}

print("\n---------- [ Drink Factory ] ----------\n")
let drinkFactory = Factory<Drink>()
drinkFactory.produce(item: Drink())
print(drinkFactory.produce())

print("\n---------- [ Snack Factory ] ----------\n")
let snackFactory = Factory<Snack>()
snackFactory.produce(item: Snack())
print(snackFactory.produce())

print("\n---------- [ Car Factory ] ----------\n")
let carFactory = Factory<Car>()
carFactory.produce(item: Car())
print(carFactory.produce())
