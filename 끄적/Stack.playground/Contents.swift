//: Playground - noun: a place where people can play

import UIKit



final class Node {
    let value: String
    var next: Node?
    
    init(value: String) {
        self.value = value
    }
}

final class LinkedList {
    private var head: Node?
    
    private var lastNode: Node? {
        guard var node = head else { return nil }
        while let nextNode = node.next {
            node = nextNode
        }
        return node
    }
    
    var size = 0
    var isEmpty: Bool {
        return head == nil
    }
    
    func push(node newNode: Node) {
        size += 1
        guard let node = lastNode else { return head = newNode }
        node.next = newNode
    }
    
    func pop() -> String? {
        size = size > 1 ? size - 1 : 0
        guard var node = head else { return nil }
        guard node.next != nil else {
            head = nil
            return node.value
        }
        while let nextNode = node.next {
            guard nextNode.next != nil else {
                node.next = nil
                return nextNode.value
            }
            node = nextNode
        }
        return node.value
    }
    
    func peek() -> String? {
        guard let node = lastNode else { return nil }
        return node.value
    }
}


let linkedList = LinkedList()
let nodes = [Node(value: "A"), Node(value: "B"), Node(value: "C"), Node(value: "D")]

linkedList.isEmpty
linkedList.push(node: nodes[0])
linkedList.peek()
linkedList.push(node: nodes[1])
linkedList.peek()

linkedList.size
linkedList.isEmpty
linkedList.pop()
linkedList.size
linkedList.pop()

linkedList.push(node: nodes[2])
linkedList.pop()
linkedList.pop()
linkedList.size

