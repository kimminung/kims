//: Playground - noun: a place where people can play

import UIKit

class Node {
    var value: String = ""
    var next: Node?
    
//    init(value: String) {
//        self.value = value
//    }
}

class LinkedList {
    var v: String = ""
    var head: Node?
}



let a = LinkedList()
a.head?.value = "asdfasf"
a.head?.value
a.v = "asdfas"
a.v


let bb = Node()
bb.value = "asdf"

a.head = bb
a.head?.value

let cc = Node()
cc.value = "QQQQ"
a.head?.next = cc
a.head?.next?.value











