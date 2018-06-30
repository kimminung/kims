//: Playground - noun: a place where people can play

struct CustomQueue<T> {
  private var pushStack: [T] = []
  private var popStack: [T] = []
  
  fileprivate var size: Int {
    return pushStack.count + popStack.count
  }
  fileprivate var list: [T] {
    return popStack.reversed() + pushStack
  }
  fileprivate mutating func enqueue(element: T) {
    pushStack.append(element)
  }
  @discardableResult
  fileprivate mutating func dequeue() -> T? {
    if popStack.isEmpty {
      popStack.append(contentsOf: pushStack.reversed())
      pushStack.removeAll()
    }
    return popStack.popLast()
  }
}

var queue = CustomQueue<Int>()
queue.enqueue(element: 1)
queue.enqueue(element: 2)
queue.enqueue(element: 3)
queue.dequeue()
queue.enqueue(element: 4)
print(queue.list)
print(queue.size)
queue.dequeue()
queue.dequeue()
queue.enqueue(element: 5)
queue.dequeue()
queue.dequeue()
queue.dequeue()

