//
//  main.swift
//  이쿼터블
//
//  Created by 김민웅 on 2018. 6. 29..
//  Copyright © 2018년 김민웅. All rights reserved.
//

import Foundation

struct Pet {
    let name: String
    let age: Int
    let someProperty: Double
//    init() {        //struct의 이닛은 내가 직접 작성하겠다고 선언한거라서 기본제공 이닛이 사라짐
//
//    }
}

//let pet = Pet()

class Pet2 {
    let name: String
    let age: Int
    let someProperty: Double
    
    init(name:String, age:Int, someProperty: Double) {        //class는 타입만 정해줬을 때 반드시 이닛이 필요함
        self.name = name
        self.age = age
        self.someProperty = someProperty
    }
}

//class와 struct는 힙에 저장하느냐 스택에 저장 하느냐 차이임
