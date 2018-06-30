//: Playground - noun: a place where people can play

import Cocoa

var stack: [Int] = []
stack.append(1)
stack.append(2)
stack.append(3)
stack.popLast()
stack.popLast()
stack.popLast()

var stack2: [Any] = []
stack2.append(1)
stack2.append("2")
stack2.append(3.0)
stack2.popLast()
stack2.popLast()
stack2.popLast()

class Node {
    let value: String
    var prev: Node?
    var next: Node?
    
    init(value: String) {
        self.value = value
    }
}

class LinkedList {
    var head: Node?
    var tail: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node? {
        return head
    }
    
    var last: Node? {
        return tail
    }
    
    var size: Int {
        return 0
    }
    
    
    //MARK: -LinkedList
    
    /*
     public class LinkedList {
     fileprivate var head: Node?
     private var tail: Node?
     
     public var isEmpty: Bool {
     return head == nil
     }
     
     public var first: Node? {
     return head
     }
     
     public var last: Node? {
     return tail
     }
     }
 */
    
    //MARK: -Append
    
    /*
     public func append(value: String) {
     // 1
     let newNode = Node(value: value)
     // 2
     if let tailNode = tail {
     newNode.previous = tailNode
     tailNode.next = newNode
     }
     // 3
     else {
     head = newNode
     }
     // 4
     tail = newNode
     }
 */
    func push(str: String) {
        
        let newNode = Node(value: str)
        
        if head?.value == nil{
            head = newNode
        } else {
            head?.next = newNode
        }
        
        //head = newNode
    }  // 데이터 삽입
    
    //    func push(value:String) {   //데이터 삽입
    //        if head?.prev != nil {
    //            head?.value +=
    //        }
    //
    //
    //    }
    
    func pop() {    //데이터 반출
        
        
    }
    
    func peek() {   //마지막 데이터 확인
    }
    
}

/*
// 1
extension LinkedList: CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        var text = "["
        var node = head
        // 4
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        // 5
        return text + "]"
    }
}
*/

let link = LinkedList()
link.push(str: "a")
link.head?.value
print(link.head?.value)

link.push(str: "b")
link.head?.value
link.head?.next?.value

link.push(str: "c")

print(link.head?.next?.value)
