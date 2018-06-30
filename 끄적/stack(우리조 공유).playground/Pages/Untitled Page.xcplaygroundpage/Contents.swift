//: Playground - noun: a place where people can play

import UIKit

class Node {
    var value: String
    var next: Node?

    init(value: String) {
        self.value = value
    }
}

class LinkedList {
    var head: Node?
    var tailNode: Node?

    var isEmpty: Bool {
        return head?.value == nil
    }

    var size: Int  = 0

    // 데이터 삽입
    func push(newNode: Node) {
        if head?.value == nil {
            head = newNode
            tailNode = head
            size += 1
        } else {
            tailNode?.next = newNode
            tailNode = tailNode?.next
            size += 1
        }
    }

    // 데이터 반출
    func pop() -> Optional<String> {
        var returnString: Node?
        returnString = head
        if size == 1 {
            returnString = head
            head = nil
        } else if size > 1 {
            for _ in 2...size {
                returnString = returnString?.next
            }
        }
        size -= 1
        return returnString?.value
    }

    // 마지막 데이터 확인
    func peek() -> Optional<String> {
        var peakNode = head
        
        for _ in 2...size {
            peakNode = peakNode?.next
        }
        return peakNode?.value

    }
}



let link = LinkedList()
link.push(newNode: Node(value: "a"))
link.push(newNode: Node(value: "b"))
link.push(newNode: Node(value: "c"))
link.push(newNode: Node(value: "b"))
link.push(newNode: Node(value: "a"))
link.push(newNode: Node(value: "c"))

link.head?.value
link.head?.next?.value
link.head?.next?.next?.value
link.head?.next?.next?.next?.value
link.head?.next?.next?.next?.next?.value
link.head?.next?.next?.next?.next?.next?.value
link.head?.next?.next?.next?.next?.next?.next?.value
link.head?.next?.next?.next?.next?.next?.next?.next?.value

link.peek()

link.pop()
link.pop()
link.pop()
link.pop()
link.pop()
link.pop()
link.pop()
link.pop()
link.head?.next?.next?.next?.next?.next?.value
link.head?.next?.next?.next?.next?.value
link.head?.next?.next?.next?.value
link.head?.value

link.isEmpty

//link.push(str: "a")
//link.head?.value
//
//link.push(str: "b")
//link.head?.value
//link.head?.next?.value









